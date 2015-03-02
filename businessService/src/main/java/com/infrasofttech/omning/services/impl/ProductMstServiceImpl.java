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
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IProductMstDAO;

@Service("productMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ProductMstServiceImpl extends OmniNGServiceImpl<Long, ProductMst>
		implements com.infrasofttech.omning.services.ProductMstService {
	private static final Logger logger = Logger.getLogger(ProductMstServiceImpl.class);
	@Autowired
	protected IProductMstDAO productMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) productMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		productMstDAO.setEntityManager(entityManager);
	}

	//-------------------------------
	
	public ProductMst getProductMstByUniqueComposite(String tenantId, String moduleCode, String productCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		@SuppressWarnings("unchecked")
		List<ProductMst> products = (List<ProductMst>)findByNamedQueryAndNamedParams("ProductMst.getProductMst", 
				queryParams);
		if (products == null) {
			return null;
		} else if (products != null && products.size() == 0) {
			return null;
		}
		return products.get(0);
	}

	public ProductMst saveOrUpdate(ProductMst entity) throws OmniNGException {
		// Find out whether object exists or not
		ProductMst productMst = getProductMstByUniqueComposite(entity.getTenantId(), entity.getModuleCode(),
				entity.getProductCode());
		if (productMst == null) {
			// create mode
			entity.setIsActive(true);
			//TODO ProductNameNAddress
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = productMst.getId();
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, productMst);
			}catch(Exception e){
				e.printStackTrace();
			}
			productMst.setId(id);
			//entity.setIsActive(true);
			return super.saveOrUpdate(productMst);
		}
	}

	public ProductMst enableProduct(String tenantId, String moduleCode,	String productCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		@SuppressWarnings("unchecked")
		List<ProductMst> products = (List<ProductMst>)findByNamedQueryAndNamedParams("ProductMst.getDisabledProduct", 
				queryParams);
		
		if (products == null || products.size()==0) {
			throw new OmniNGException(":::Product NOT Found");
		} else {
			// set active to true
			ProductMst productMst = products.get(0);
			productMst.setIsActive(true);
			return super.saveOrUpdate(productMst);
		}
	}

	public ProductMst disableProduct(String tenantId, String moduleCode, String productCode) throws OmniNGException {
		ProductMst productMst = getProductMstByUniqueComposite(tenantId, moduleCode, productCode);
		if (productMst == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			productMst.setIsActive(false);
			return super.saveOrUpdate(productMst);
		}
	}

	public List<ProductMst> getProductsByModule(String tenantId, String moduleCode) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("moduleCode", moduleCode);
		@SuppressWarnings({"unchecked"})
		List<ProductMst> products = (List<ProductMst>)findByNamedQueryAndNamedParams("ProductMst.getProductsByModule", 
				queryParams);
		if(products==null){
			throw new OmniNGException(":::No Products");
		}else if(products!=null && products.size()==0){
			throw new OmniNGException(":::No Products");
		}
	
		return products;
	}

	public List<ProductMst> getProductsByModuleNBranch(String tenantId,
			String moduleCode, String branchCode) throws OmniNGException {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProductMst> getActiveProducts(String tenantId) throws OmniNGException{
		List<ProductMst> products = new ArrayList<ProductMst>();
		products = findAllByTenant(tenantId);
		return products;
	}

	public List<ProductMst> getActiveProductsPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException{
		List<ProductMst> products = new ArrayList<ProductMst>();
		products = findAllByTenantPg(tenantId, startFrom, maxResults);
		return products;
	}

	public List<ProductMst> getDisabledProducts(String tenantId)
			throws OmniNGException {
		List<ProductMst> products = new ArrayList<ProductMst>();
		products = findDisabled(tenantId);
		return products;
	}

	public List<ProductMst> getDisabledProductsPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException {
		List<ProductMst> products = new ArrayList<ProductMst>();
		products = findDisabledPg(tenantId, startFrom, maxResults);
		return products;
	}
}
