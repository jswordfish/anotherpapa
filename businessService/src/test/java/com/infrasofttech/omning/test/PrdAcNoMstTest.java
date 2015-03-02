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

import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.omning.services.PrdAcNoMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class PrdAcNoMstTest {
	
	@Autowired
	PrdAcNoMstService prdAcNoMstService;
	
	@Test
	@Rollback(value = false)
	public void testPrdAcNoMstCreation() {
		PrdAcNoMst prdAcNoMst = new PrdAcNoMst();
		String tenantId="01";
		String branchCode="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		String customerNumber="003";
		String accountNumber = "010101001";
		String acName= "Mahesh Laddha1";
		try {
			prdAcNoMst.setTenantId(tenantId);
			prdAcNoMst.setBranchCode(branchCode);
			prdAcNoMst.setModuleCode(moduleCode);
			prdAcNoMst.setProductCode(productCode);
			prdAcNoMst.setCustomerNumber(customerNumber);
			prdAcNoMst.setAccountNumber(accountNumber);
			prdAcNoMst.setAccountName(acName);
			prdAcNoMst = (PrdAcNoMst)prdAcNoMstService.saveOrUpdate(prdAcNoMst);
			if(prdAcNoMst==null){
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
	public void testGetPrdAcNoByUniqueComposite() {
		PrdAcNoMst prdAcNoMst = new PrdAcNoMst();
		String tenantId="01";
		String branchCode="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		String customerNumber="003";
		String accountNumber="010101001";
		String acName= "Mahesh Laddha1";
		try {
			prdAcNoMst = (PrdAcNoMst)prdAcNoMstService.getPrdAcNoByUniqueComposite(tenantId, branchCode, moduleCode, productCode, customerNumber, accountNumber);
			
			if(prdAcNoMst == null){
				Assert.assertEquals(true, false);	
			}else if (prdAcNoMst.getAccountName().equalsIgnoreCase(acName)){
				Assert.assertEquals(true, true);
			}else{
				Assert.assertEquals(true, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testEnablePrdAcNo() {
		PrdAcNoMst prdAcNoMst = new PrdAcNoMst();
		String tenantId="01";
		String branchCode="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		String customerNumber="003";
		String accountNumber="010101001";
		try {
			prdAcNoMst  = (PrdAcNoMst)prdAcNoMstService.enablePrdAcNo(tenantId, branchCode, moduleCode, productCode, customerNumber, accountNumber);
			if(prdAcNoMst == null){
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoMst.getIsActive()==false){
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
	public void testDisablePrdAcNo() {
		PrdAcNoMst prdAcNoMst = new PrdAcNoMst();
		String tenantId="01";
		String branchCode="01";
		String moduleCode="10";
		String productCode="Prd-Test4";
		String customerNumber="003";
		String accountNumber="010101001";
		try {
			prdAcNoMst  = (PrdAcNoMst)prdAcNoMstService.disablePrdAcNo(tenantId, branchCode, moduleCode, productCode, customerNumber, accountNumber);
			if(prdAcNoMst == null){
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoMst.getIsActive()==true){
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
	public void testGetActivePrdAcNo() {
		String tenantId="01";
		String branchCode="01";
		try {
			List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
			prdAcNoz = (List<PrdAcNoMst>)prdAcNoMstService.getActivePrdAcNo(tenantId, branchCode);
			if(prdAcNoz==null || prdAcNoz.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoz.size() > 0){
					System.out.println("Records="+prdAcNoz.size());
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
	public void testGetActivePrdAcNoPg() {
		String tenantId="01";
		String branchCode="01";
		Integer startFrom=0;
		Integer maxResults=25;
		try {
			List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
			prdAcNoz = (List<PrdAcNoMst>)prdAcNoMstService.getActivePrdAcNoPg(tenantId, branchCode, startFrom, maxResults);
			if(prdAcNoz==null || prdAcNoz.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoz.size() > 0){
					System.out.println("1st ID: " + prdAcNoz.get(0).getId());
			//		System.out.println("5th ID: " + prdAcNoz.get(4).getId());
					System.out.println("Records="+prdAcNoz.size());
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
	public void testGetDisabledPrdAcNo() {
		String tenantId="01";
		String branchCode="01";
		try {
			List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
			prdAcNoz = (List<PrdAcNoMst>)prdAcNoMstService.getDisabledPrdAcNo(tenantId, branchCode);
			if(prdAcNoz==null || prdAcNoz.size()==0){
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoz.size() > 0){
					System.out.println("Prd ID:"+prdAcNoz.get(0).getId());
					System.out.println("Records="+prdAcNoz.size());
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
	public void testGetDisabledPrdAcNoPg() {
		String tenantId="01";
		String branchCode="01";
		Integer startFrom=0;
		Integer maxResults=25;
		try {
			List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
			prdAcNoz = (List<PrdAcNoMst>)prdAcNoMstService.getDisabledPrdAcNoPg(tenantId, branchCode, startFrom, maxResults);
			if(prdAcNoz==null || prdAcNoz.size()==0){
				System.out.println("No Records");
				Assert.assertEquals(true, false);	
			}else{
				if(prdAcNoz.size() > 0){
					System.out.println("1st :"+ prdAcNoz.get(0).getId());
					System.out.println("Records=" + prdAcNoz.size());
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
