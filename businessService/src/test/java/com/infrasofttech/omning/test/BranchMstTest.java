package com.infrasofttech.omning.test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.Address;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.BranchMstService;
//import com.infrasofttech.domain.entities.Address;
//import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.omning.services.HolidayMstService;
import com.infrasofttech.omning.services.ProductMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class BranchMstTest {

	@Autowired
	BranchMstService branchMstService;
	
	@Autowired
	HolidayMstService holidayMstService;
	
	@Autowired
	ProductMstService productMstService;

	@Test
	@Rollback(value = false)
	public void testBranchMstCreation() {
		Integer i=2;
		String[] branchCode={"01","02","03","04","05"};
		String[] branchName={"Andheri","Malad","Boivali","Parel","Goregaon"};
		String[] branchTypeCode={"HO","HO","HO","BO","BO"};
		String[] branchAddress={"Mumbai-53","Mumbai-64","Mumbai-68","Mumbai-13","Mumbai-62"};
		String[] contactPerson={"Tina","Mina","Rina","Bina","Shina"};
		String[] contactDetails={"mahesh@infra.com","ml@infra.com","ml@infra.com","ml@infra.com","ml@infra.com"};
		try {
			BranchMst branchMst = new BranchMst();
			branchMst.setBranchCode(branchCode[i]);
			branchMst.setBranchName(branchName[i]);
			branchMst.setBranchTypeCode(branchTypeCode[i]);
			branchMst.setContactPerson(contactPerson[i]);
			branchMst.setEmailId(contactDetails[i]);
			Collection<Address> branchAddresses = new ArrayList<Address>();
			Address address = new Address();
			address.setAddress1(branchAddress[i]);
			branchAddresses.add(address);
			branchMst.setBranchAddresses(branchAddresses);
			
			//associate holiday
			HolidayMst holidayMst = new HolidayMst();
			holidayMst.setTenantId("01");
			holidayMst.setHolidayCode("02");//make sure u always have a diff code
			holidayMst = (HolidayMst) holidayMstService.saveOrUpdate(holidayMst);
			
		/*	List<HolidayMst> holidays = new ArrayList<HolidayMst>();
			holidays.add(holidayMst);
			branchMst.setHolidays(holidays);*/
			
//			//associate productmst
//			ProductMst productMst = new ProductMst();
//			productMst.setTenantId("01");
//			productMst.setProductCode("02");//make sure u always have a diff code
//			productMst = (ProductMst) productMstService.saveOrUpdate(productMst);
//			List<ProductMst> products = new ArrayList<ProductMst>();
//			products.add(productMst);
			branchMst.setTenantId("01");
//			branchMst.setProducts(products);
			branchMst = branchMstService.saveOrUpdate(branchMst);

			Assert.assertEquals(true, true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value=false)
	public void testGetBranchMst() {
		try {
			BranchMst branchMst = branchMstService.getBranchMst("01", "00001");
			List<BranchMst> branches = branchMstService.getBranches("01");
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	
}
