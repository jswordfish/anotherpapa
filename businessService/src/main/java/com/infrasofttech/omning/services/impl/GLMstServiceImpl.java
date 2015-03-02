package com.infrasofttech.omning.services.impl;


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
import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IGLMstDao;
import com.infrasofttech.omning.services.GLMstService;

@Service("glMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class GLMstServiceImpl extends OmniNGServiceImpl<Long, GLMst>
		implements GLMstService {
	private static final Logger logger = Logger.getLogger(GLMstServiceImpl.class);

	@Autowired
	protected IGLMstDao glMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) glMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		glMstDAO.setEntityManager(entityManager);
	}

	/*public GLMst getGLMst(String tenantId, String glCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("glCode", glCode);
		queryParams.put("tenantId", tenantId);
		@SuppressWarnings("unchecked")
		List<GLMst> glMsts = (List<GLMst>)findByNamedQueryAndNamedParams("GLMst.getGlCode", queryParams);
		if (glMsts == null) {
			return null;
		} else if (glMsts != null && glMsts.size() == 0) {
			return null;
		}
		return glMsts.get(0);
		
		
		
		
	}*/
	public GLMst getGLMstByUniqueComposition(String tenantId, String glCode,String fyCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("glCode", glCode);
		queryParams.put("tenantId", tenantId);
		queryParams.put("fyCode", fyCode);
		@SuppressWarnings("unchecked")
		List<GLMst> glMsts = (List<GLMst>)findByNamedQueryAndNamedParams("GLMst.getGLMst", queryParams);
		if (glMsts == null) {
			return null;
		} else if (glMsts != null && glMsts.size() == 0) {
			return null;
		}
		return glMsts.get(0);
	}

	public List<GLMst> getGLList(String tenantId) throws OmniNGException {
		
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		List<GLMst> glMsts = (List<GLMst>)findByNamedQueryAndNamedParams("GLMst.getAllGLMstByTenant", queryParams);
		if (glMsts == null) {
			return null;
		} else if (glMsts != null && glMsts.size() == 0) {
			return null;
		}
		return glMsts;
	}

	public GLMst saveOrUpdate(GLMst entity) throws OmniNGException {
		
		
		GLMst glMst = getGLMstByUniqueComposition(entity.getTenantId(), entity.getGlCode(),entity.getFyCode());
		if (glMst == null) {
			// create mode
		    
			entity.setIsActive(true);
			
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = glMst.getId();
			
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, glMst);
				glMst.setId(id);
			}catch(Exception e){
				e.printStackTrace();
				throw new OmniNGException("can not update gl", e);
			}
			return super.saveOrUpdate(glMst);
		}
		
	}
	
	public GLMst enableGL(String tenantId, String glCode,String fyCode) throws OmniNGException{
		GLMst glMst = getGLMstByUniqueComposition(tenantId, glCode, fyCode);
		if (glMst == null) {
			throw new OmniNGException("GL NOT Found");
		} else {
			// set active to true
			glMst.setIsActive(true);
			return saveOrUpdate(glMst);
		}
	}

	public GLMst disableGL(String tenantId, String glCode,String fyCode ) throws OmniNGException{
		GLMst glMst = getGLMstByUniqueComposition(tenantId, glCode, fyCode);
		if (glMst == null) {
			throw new OmniNGException("GL NOT Found");
		} else {
			// set active to true
			glMst.setIsActive(false);
			return saveOrUpdate(glMst);
		}
	}
	
	private GLMst getDisabledGL(String tenantId, String glCode,String fyCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("glCode", glCode);
		queryParams.put("tenantId", tenantId);
		queryParams.put("fyCode", fyCode);
		@SuppressWarnings("unchecked")
		List<GLMst> glmsts = (List<GLMst>)findByNamedQueryAndNamedParams("GLMst.getDisableGL", queryParams);
		if (glmsts == null) {
			return null;
		} else if (glmsts != null && glmsts.size() == 0) {
			return null;
		}
		return glmsts.get(0);
	}
}
