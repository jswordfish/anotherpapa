package com.infrasofttech.omning.services.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IBranchMstDAO;
import com.infrasofttech.omning.IUserMstDAO;
import com.infrasofttech.omning.orch.services.HashingService;
import com.infrasofttech.omning.services.UserBranchMapService;
import com.infrasofttech.omning.services.UserMstService;

@Service("userMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class UserMstServiceImpl extends OmniNGServiceImpl<Long, UserMst>
		implements UserMstService {

	private static final Logger logger = Logger.getLogger(UserMstServiceImpl.class);

	@Autowired
	protected IUserMstDAO userMstDAO;

	@Autowired
	protected IBranchMstDAO branchMstDAO;
	
	@Autowired
	UserBranchMapService userBranchMapService;
	
	@Autowired
	HashingService hashingService;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) userMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		userMstDAO.setEntityManager(entityManager);
	}

	// -------------------------------

	public List<UserMst> getActiveUsers(String tenantId) throws OmniNGException{
		List<UserMst> users = new ArrayList<UserMst>();
		users = findAllByTenant(tenantId);
		return users;
	}

	public List<UserMst> getActiveUsersPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException{
		List<UserMst> users = new ArrayList<UserMst>();
		users = findAllByTenantPg(tenantId, startFrom, maxResults);
		return users;
	}

	public List<UserMst> getDisabledUsers(String tenantId) throws OmniNGException{
		List<UserMst> users = new ArrayList<UserMst>();
		users = findDisabled(tenantId);
		return users;
	}

	public List<UserMst> getDisabledUsersPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException{
		List<UserMst> users = new ArrayList<UserMst>();
		users = findDisabledPg(tenantId, startFrom, maxResults);
		return users;
	}

	public UserMst enableUser(String tenantId, String loginId ) throws OmniNGException{
		UserMst userMst = getUserMstByUniqueComposite(tenantId, loginId);
		if (userMst == null) {
			throw new OmniNGException("User NOT Found");
		} else {
			// set active to true
			userMst.setIsActive(true);
			return saveOrUpdate(userMst);
		}
	}

	public UserMst disableUser(String tenantId, String loginId ) throws OmniNGException{
		UserMst userMst = getUserMstByUniqueComposite(tenantId, loginId);
		if (userMst == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			userMst.setIsActive(false);
			return saveOrUpdate(userMst);
		}
	}

	public UserMst saveOrUpdate(UserMst entity) throws OmniNGException {
			// Find out whether object exists or not
		     UserMst userMst= new UserMst();
		     if (entity.getIsActive()==false){
		    	 userMst = getDisabledUser(entity.getTenantId(), entity.getLoginId());
		     }else{
		         userMst = getUserMstByUniqueComposite(entity.getTenantId(), entity.getLoginId());}
			if (userMst == null) {
				// create mode
			    final String emailConfigType="NEWUSER";
				String hPwd = "";
				String hSaltPwd="";
				try {
					hPwd = hashingService.getHashedStrPwd(entity.getTenantId(), entity.getLoginId(), emailConfigType,entity.getEmailId(),entity.getUserDisplayName());
					hSaltPwd= hashingService.getHashedSaltPwd();
					
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				entity.setPwd(hPwd);
				entity.setPwdSalt(hSaltPwd);
				
				//------------------
				//entity.setPwd("abcd1234");				// TODO generate hashed password and email to user
				entity.setForcePwdChgYN(true);
				entity.setIsActive(true);
				entity.setIsUserLocked(false);
				entity.setIsUserLoggedin(false);
				entity.setAllowConcurrentLogin(true);    // TODO read from app config for tenant
				Collection<UserBranchMap> userBranchMapsFromClient = returnUniqueUserBranchMapObjects(entity.getUserBranchMaps(), null);
				entity.setUserBranchMaps(userBranchMapsFromClient);
				return super.saveOrUpdate(entity);
			} else {
				// update
				Long id = userMst.getId();
				Collection<UserBranchMap> userBranchMapsFromClient = entity.getUserBranchMaps();
				entity.setUserBranchMaps(null);
				Collection<UserBranchMap> userBranchMaps = userMst.getUserBranchMaps();
				try{
					Mapper mapper = new DozerBeanMapper();
					mapper.map(entity, userMst);
					userMst.setId(id);
					userBranchMapsFromClient = returnUniqueUserBranchMapObjects(userBranchMapsFromClient, userBranchMaps);
					userMst.setUserBranchMaps(userBranchMapsFromClient);
				}catch(Exception e){
					e.printStackTrace();
					throw new OmniNGException("can not update user", e);
				}
				userMst.setId(id);
				return super.saveOrUpdate(userMst);
			}
	}	
	
//	private Collection<UserBranchMap> saveAndReturnDeltaUserBranchMap(Collection<UserBranchMap> fromClient, Collection<UserBranchMap> fromDb){
//		Collection<UserBranchMap> userBranchAssociations = new ArrayList<UserBranchMap>();
//		for(UserBranchMap userBranchMap : fromClient){
//			//userBranchMapService.
//			String qry = "UserBranch.getBranchUser";
//			Map<String, String> params = new HashMap<String, String>();
//			params.put("tenantId", userBranchMap.getTenantId());
//			params.put("loginId", userBranchMap.getLoginId());
//			params.put("branchCode", userBranchMap.getBranchCode());
//			List<UserBranchMap> branchMaps = userBranchMapService.findByNamedQueryAndNamedParams(qry, params);
//			if(branchMaps != null && branchMaps.size() > 0){
//				//need not save it
//				userBranchAssociations.add(userBranchMap);
//			}
//			else{
//				//create record
//			//	userBranchMap = (UserBranchMap) userBranchMapService.saveOrUpdate(userBranchMap);
//				userBranchAssociations.add(userBranchMap);
//			}
//			
//		}
//		return userBranchAssociations;
//	}
	
	private Collection<UserBranchMap> returnUniqueUserBranchMapObjects(Collection<UserBranchMap> fromClient, Collection<UserBranchMap> fromDb){
		Collection<UserBranchMap> uniqueRecords = new ArrayList<UserBranchMap>();
		Map<String, UserBranchMap> mapper = new HashMap<String, UserBranchMap>();
		for(UserBranchMap userBranchMap: fromClient){
			if(mapper.get(userBranchMap.getTenantId()+userBranchMap.getLoginId()+userBranchMap.getBranchCode()) == null){
				userBranchMap = (UserBranchMap) userBranchMapService.saveOrUpdate(userBranchMap);
				uniqueRecords.add(userBranchMap);
				mapper.put(userBranchMap.getTenantId()+userBranchMap.getLoginId()+userBranchMap.getBranchCode(), userBranchMap);
			}
		}
		return uniqueRecords;
	}
	
	public UserMst setSuccessfulLogin(String tenantId, String loginId) throws OmniNGException{
		try{
			UserMst userMst = getUserBasedOnLogin(tenantId, loginId);
			userMst.setConsequetiveBadLoginCount(0);
			userMst.setIsUserLocked(false);
			userMst.setIsUserLoggedin(true);
			userMst.setLastSuccessfulLoginDateTime(new Date());   //Set to current
			userMst = saveOrUpdate(userMst);
			return userMst;
		}catch(Exception e){
			throw new OmniNGException("set successful login failed", e);
		}
	}
	
	public UserMst getUserBasedOnLogin(String tenantId, String loginId) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("loginId", loginId);
		List<UserMst> users = findByNamedQueryAndNamedParams("UserMst.getUserMst", queryParams);
		if (null==users) {
			throw new OmniNGException("No User Found");
		} else if (users != null && users.size() == 0) {
			throw new OmniNGException("User NOT Found");
		}
		return users.get(0);
	 }

	public UserMst getEmailId(String tenantId, String loginId) throws OmniNGException {
		UserMst userMst = getUserBasedOnLogin(tenantId, loginId);
		return userMst;
	}

	public UserMst unLockUser(String tenantId, String loginId) throws OmniNGException{
		UserMst userMst = new UserMst();
		userMst = getUserBasedOnLogin(tenantId, loginId);

		if(userMst == null){
			throw new OmniNGException();
		}else{
			userMst.setIsUserLocked(false);
			userMst.setConsequetiveBadLoginCount(0);
			userMst.setIsUserLoggedin(false);
			saveOrUpdate(userMst);
		}
		return userMst;
	}
	
	public UserMst lockUser(String tenantId, String loginId) throws OmniNGException{
		{
			UserMst user = new UserMst();
			try{
				user = getUserBasedOnLogin(tenantId, loginId);
		
				if(user == null){
					throw new OmniNGException();
				}else{
					user.setIsUserLocked(true);
					saveOrUpdate(user);
				}
			}catch(Exception e){
				throw new OmniNGException("", e);
			}
			return user;
		}
	}

	public UserMst resetUserPwd(String tenantId, String loginId) throws OmniNGException{
		String hPwd="";
		String emailConfigType="RESETPASSWORD";

		UserMst userMst = new UserMst();
		try{
			userMst = getUserBasedOnLogin(tenantId, loginId);
			hPwd= hashingService.getHashedStrPwd(tenantId, loginId,emailConfigType,userMst.getEmailId(),userMst.getUserDisplayName());
	
			if(userMst == null){
				throw new OmniNGException();
			}else{
				if(null != hPwd){
					userMst.setPwd(hPwd);
					userMst.setForcePwdChgYN(true);
					saveOrUpdate(userMst);
				}
				//TODO Email pwd to the user on his email
			}
		}catch(Exception e){
			
		}
		return userMst;
	}

	@Transactional
	public UserMst changePwd(String tenantId, String loginId, String hOldPwd, String hNewPwd) throws OmniNGException{
		// No Emailing of Password required
		UserMst userMst = new UserMst();
		userMst = getUserBasedOnLogin(tenantId, loginId);
		if(hOldPwd==null || hOldPwd.length()==0) {throw new OmniNGException("Old password cannot be blank");}
		if(hNewPwd==null || hNewPwd.length()==0) {throw new OmniNGException("New password cannot be blank");}
		if(hOldPwd.equals(hNewPwd)){throw new OmniNGException("Old and New password cannot be same");}
		if(userMst == null){
			throw new OmniNGException();
		}else if(!userMst.getPwd().equals(hOldPwd)){
			throw new OmniNGException("Invalid details. Check Old Password!");
		}else if(userMst.getPwd().equals(hOldPwd)){
			userMst.setPwd(hNewPwd);
			userMst.setPrevPwdChgOn(new Date());
			userMst.setForcePwdChgYN(false);
			saveOrUpdate(userMst);
		}
		return userMst;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public UserMst setBadLoginCount(String tenantId, String loginId) throws OmniNGException{
		Integer cntAttempts=0;
		UserMst userMst = getUserBasedOnLogin(tenantId, loginId);
		cntAttempts = userMst.getConsequetiveBadLoginCount();
		if(cntAttempts==null) cntAttempts=0;
		userMst.setConsequetiveBadLoginCount(++cntAttempts);
		userMst.setIsUserLoggedin(false);
		if(cntAttempts==3){userMst.setIsUserLocked(true);}   // TODO read value from AppConfig
		userMst = saveOrUpdate(userMst);
		return userMst;
	}

	private UserMst getUserMstByUniqueComposite(String tenantId, String loginId) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("loginId", loginId);
		queryParams.put("tenantId", tenantId);
		@SuppressWarnings("unchecked")
		List<UserMst> users = (List<UserMst>)findByNamedQueryAndNamedParams("UserMst.getUserMst", queryParams);
		if (users == null) {
			return null;
		} else if (users != null && users.size() == 0) {
			return null;
		}
		return users.get(0);
	}


	private UserMst getDisabledUser(String tenantId, String loginId) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("loginId", loginId);
		queryParams.put("tenantId", tenantId);
		@SuppressWarnings("unchecked")
		List<UserMst> users = (List<UserMst>)findByNamedQueryAndNamedParams("UserMst.getDisabledUser", queryParams);
		if (users == null) {
			return null;
		} else if (users != null && users.size() == 0) {
			return null;
		}
		return users.get(0);
	}

}
