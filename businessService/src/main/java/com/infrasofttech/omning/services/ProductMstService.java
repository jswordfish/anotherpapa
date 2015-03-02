package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface ProductMstService extends OmniNGService {

	public ProductMst getProductMstByUniqueComposite(String tenantId, String moduleCode, String productCode);
	public ProductMst saveOrUpdate(ProductMst entity) throws OmniNGException;
	public ProductMst enableProduct(String tenantId, String moduleCode, String productCode) throws OmniNGException;
	public ProductMst disableProduct(String tenantId, String moduleCode, String productCode) throws OmniNGException;
	public List<ProductMst> getProductsByModule(String tenantId, String moduleCode) throws OmniNGException;
	public List<ProductMst> getProductsByModuleNBranch(String tenantId, String moduleCode, String branchCode) throws OmniNGException;
	public List<ProductMst> getDisabledProducts(String tenantId) throws OmniNGException;
	public List<ProductMst> getDisabledProductsPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
	public List<ProductMst> getActiveProducts(String tenantId) throws OmniNGException;
	public List<ProductMst> getActiveProductsPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
}
