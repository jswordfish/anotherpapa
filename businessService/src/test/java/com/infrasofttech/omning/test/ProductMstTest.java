package com.infrasofttech.omning.test;

import java.util.ArrayList;
import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.domain.entities.ProductNameAddress;
import com.infrasofttech.omning.services.ProductMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class ProductMstTest {
	
	@Autowired
	ProductMstService productMstService;
	
	@Test
	@Rollback(value = false)
	public void testProductMstCreation() {
		String tenantId="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		Boolean autoGen = false;
		try {
			ProductNameAddress pna = new ProductNameAddress();
			pna.setCatType("CATTYPE");
			pna.setIsActive(true);
			pna.setTenantId(tenantId);
			List<ProductNameAddress> pnaz = new ArrayList<ProductNameAddress>();
			pnaz.add(pna);
			ProductMst productMst = new ProductMst();
			productMst.setTenantId(tenantId);
			productMst.setModuleCode(moduleCode);
			productMst.setProductCode(productCode);
			productMst.setAutoGenAcNoYN(autoGen);
//			productMst.setPrdNameAddresses(pnaz);
			productMst = (ProductMst)productMstService.saveOrUpdate(productMst);
			if(productMst==null){
				Assert.assertEquals(true, false);	
			}else{
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetProductMstByUniqueComposite() {
		String tenantId="01";
		String moduleCode="21";
		String productCode="Prd-Test3";
		try {
			ProductMst productMst = new ProductMst();
			productMst.setTenantId(tenantId);
			productMst.setModuleCode(moduleCode);
			productMst.setProductCode(productCode);
			productMst = (ProductMst)productMstService.getProductMstByUniqueComposite(tenantId,moduleCode,productCode);
			if(productMst==null){
				Assert.assertEquals(true, false);	
			}else{
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testEnableProduct() {
		String tenantId="01";
		String moduleCode="21";
		String productCode="Prd-Test3";
		try {
			ProductMst productMst = new ProductMst();
			productMst.setTenantId(tenantId);
			productMst.setModuleCode(moduleCode);
			productMst.setProductCode(productCode);
			productMst = (ProductMst)productMstService.enableProduct(tenantId,moduleCode,productCode);
			if(productMst==null){
				Assert.assertEquals(true, false);	
			}else{
				if(productMst.getIsActive()==false){
					Assert.assertEquals(true, false);
				}else{
					Assert.assertEquals(true, true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testDisableProduct() {
		String tenantId="01";
		String moduleCode="21";
		String productCode="Prd-Test3";
		try {
			ProductMst productMst = new ProductMst();
			productMst.setTenantId(tenantId);
			productMst.setModuleCode(moduleCode);
			productMst.setProductCode(productCode);
			productMst = (ProductMst)productMstService.disableProduct(tenantId,moduleCode,productCode);
			if(productMst==null){
				Assert.assertEquals(true, false);	
			}else{
				if(productMst.getIsActive()==true){
					Assert.assertEquals(true, false);
				}else{
					Assert.assertEquals(true, true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value = false)
	public void testGetActiveProducts() {
		String tenantId="01";
		try {
			List<ProductMst> products = new ArrayList<ProductMst>();
			products = (List<ProductMst>)productMstService.getActiveProducts(tenantId);
			if(products==null || products.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(products.size() > 0){
					System.out.println("Records="+products.size());
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetActiveProductsPg() {
		String tenantId="01";
		Integer startFrom=0;
		Integer maxResults=25;
		try {
			List<ProductMst> products = new ArrayList<ProductMst>();
			products = (List<ProductMst>)productMstService.getActiveProductsPg(tenantId, startFrom, maxResults);
			if(products==null || products.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(products.size() > 0){
					System.out.println("1st ID: " + products.get(0).getId());
					System.out.println("5th ID: " + products.get(4).getId());
					System.out.println("Records="+products.size());
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetDisabledProducts() {
		String tenantId="01";
		try {
			List<ProductMst> products = new ArrayList<ProductMst>();
			products = (List<ProductMst>)productMstService.getDisabledProducts(tenantId);
			if(products==null || products.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(products.size() > 0){
					System.out.println("Prd ID:"+products.get(0).getId());
					System.out.println("Records="+products.size());
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetDisabledProductsPg() {
		String tenantId="01";
		Integer startFrom=0;
		Integer maxResults=25;
		try {
			List<ProductMst> products = new ArrayList<ProductMst>();
			products = (List<ProductMst>)productMstService.getDisabledProductsPg(tenantId, startFrom, maxResults);
			if(products==null || products.size()==0){
				System.out.println("No Records");
				Assert.assertEquals(true, false);	
			}else{
				if(products.size() > 0){
					System.out.println("1st :"+ products.get(0).getId());
					System.out.println("Records="+products.size());
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
}
