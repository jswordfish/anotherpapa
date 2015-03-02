package com.infrasofttech.omning.services.impl;

import java.util.ArrayList;
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
import com.infrasofttech.domain.entities.AppConfig;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IAppConfigDAO;
import com.infrasofttech.omning.IBranchMstDAO;
import com.infrasofttech.omning.impl.AppConfigDAO;
import com.infrasofttech.omning.impl.BranchMstDAO;

@Service("appConfigService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class AppConfigServiceImpl extends OmniNGServiceImpl<Long, AppConfig>
		implements com.infrasofttech.omning.services.AppConfigService {
	@Autowired
	protected IAppConfigDAO appConfigDAO;
	
	@Autowired
	protected IBranchMstDAO branchMstDao;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) appConfigDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		appConfigDAO.setEntityManager(entityManager);
	}
	
	//--------------------------N.A.
	private static final Logger logger = Logger
			.getLogger(AppConfigServiceImpl.class);
	
	
	
public List<AppConfig> getAllAppConfigList(){
		
		List<AppConfig> appConfigs = new ArrayList<AppConfig>();
		
		AppConfigDAO appConfigDao= new AppConfigDAO();
		System.out.println("LoanAccountParamServiceImpl > listAccount...");
	try{
		appConfigs = appConfigDao.getAllAppConfigList();
		logger.info("calling dao method");
	}
	catch(Exception e)
	{
		logger.error("Exception in getAllAppConfiglist method"+e.getMessage());
	}
		return appConfigs;
		
		
	}
public AppConfig findById(Long id) {
	  AppConfig appConfig=new AppConfig();
	try {
 
		logger.info(":Inside try block ::createPrdAcNumberConfig()");
		AppConfigDAO appConfigDao = new AppConfigDAO();
		appConfig = appConfigDao.findById(id);
		logger.info("service called");

	} catch (Exception e) {
		logger.error("Exception occured" + e.getMessage());
		e.printStackTrace();

	}
	return appConfig;
	

}
/* Get AppConfig based on setNo And TenantId */
public List<AppConfig> getAppConfigBySetNoTenant(String tenantId,Long setNo){	
	
	List<AppConfig> appConfigs = new ArrayList<AppConfig>();
	Map< String, Object> param = new HashMap<String,Object>();
	param.put("tenantId", tenantId);
	param.put("setNo",setNo);
	
	
	appConfigs = findByNamedQueryAndNamedParams("AppConfig.getAppConfigBySetNoTenant", param);
	if (appConfigs == null) {
		return null;
	} else if (appConfigs != null && appConfigs.size() == 0) {
		return appConfigs;
	}
	return appConfigs; 	
}

public List<BranchMst> showInitBranchList(String tenantCode) {

	List<BranchMst> branches = new ArrayList<BranchMst>();
	BranchMstDAO branchMstDao = new BranchMstDAO();
	System.out.println("BranchMstServiceImpl > listBranches...");
	logger.info("BranchMstServiceImpl > listBranches...");
	branches = branchMstDao.showInitBranchList(tenantCode);
	return branches;

}

public AppConfig saveOrUpdate(AppConfig entity) throws OmniNGException {
	// Find out whether object exists or not
	AppConfig appConfig = getAppConfigByUniqueComposite(entity.getTenantId(), entity.getBranchCode());
			if (appConfig == null) {
				// create mode
				System.out.println("Save AppConfig");
				entity.setIsActive(true);				
				return super.saveOrUpdate(entity);
			} else {
				// update
				System.out.println("update AppConfig");
				Long id = appConfig.getId();
				try{
					Mapper mapper = new DozerBeanMapper();
					mapper.map(entity, appConfig);
				}catch(Exception e){
					e.printStackTrace();
				}
				appConfig.setId(id);
				entity.setIsActive(true);
				return super.saveOrUpdate(appConfig);
			}
}
public AppConfig getAppConfigByUniqueComposite(
		String tenantId, String branchCode)
		throws OmniNGException {
	Map<String, String> queryParams = new HashMap<String, String>();
	queryParams.put("tenantId", tenantId);
	queryParams.put("branchCode", branchCode);
	
	@SuppressWarnings("unchecked")
	List<AppConfig> AppConfigs = (List<AppConfig>)findByNamedQueryAndNamedParams("AppConfig.getAppConfig", 
			queryParams);
	if (AppConfigs == null) {
		return null;
	} else if (AppConfigs != null && AppConfigs.size() == 0) {
		return null;
	}
	return AppConfigs.get(0);
}

public AppConfig getAppConfigByIsActiveFalseNTenantNBranch(String tenantId,
		String branchCode) throws OmniNGException {
	Map<String, String> queryParams = new HashMap<String, String>();
	queryParams.put("tenantId", tenantId);
	queryParams.put("branchCode", branchCode);
	
	@SuppressWarnings("unchecked")
	List<AppConfig> AppConfigs = (List<AppConfig>)findByNamedQueryAndNamedParams("AppConfig.getAppConfigByIsActiveFalse", 
			queryParams);
	if (AppConfigs == null) {
		return null;
	} else if (AppConfigs != null && AppConfigs.size() == 0) {
		return null;
	}
	return AppConfigs.get(0);

}
	
}
