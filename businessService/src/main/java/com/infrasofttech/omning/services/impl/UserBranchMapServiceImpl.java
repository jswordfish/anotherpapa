package com.infrasofttech.omning.services.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserBranch_RoleMap;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IUserBranchMapDAO;
import com.infrasofttech.omning.services.UserBranchMapService;
@Service("userBranchMapService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class UserBranchMapServiceImpl extends OmniNGServiceImpl<Long, UserBranchMap> implements UserBranchMapService {

	private static final Logger logger = Logger.getLogger(RoleMstServiceImpl.class);

	@Autowired
	protected IUserBranchMapDAO userBranchMapDAO;
	
	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) userBranchMapDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		userBranchMapDAO.setEntityManager(entityManager);
	}

	public String getRoleCode(String tenantId, String branchCode, String loginId) throws OmniNGException {
		try{
			Map<String, String> params = new HashMap<String, String>();
			params.put("tenantId", tenantId);
			params.put("branchCode", branchCode);
			params.put("loginId", loginId);
			List<UserBranchMap> branchMaps = userBranchMapDAO.
					findByNamedQueryAndNamedParams("UserBranch.getBranchUser", params);
			if(branchMaps != null && branchMaps.size() > 0){
				UserBranchMap userBranchMap = branchMaps.get(0);
				Collection<UserBranch_RoleMap> roleMaps = userBranchMap.getUserBranch_RoleMaps();
				if(roleMaps != null && roleMaps.size() > 0){
					Object data[] =  roleMaps.toArray();
					UserBranch_RoleMap role = (UserBranch_RoleMap)data[0];
					return role.getRoleCode();
				}else{
					throw new OmniNGException("No role present");
				}
			}else{
				throw new OmniNGException("No role present");
			}
		}catch(Exception e){
			throw new OmniNGException("No role present");
		}
	}

	
}
