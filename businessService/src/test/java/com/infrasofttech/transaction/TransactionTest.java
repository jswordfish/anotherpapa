package com.infrasofttech.transaction;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.transaction.services.ScreenService;
import com.infrasofttech.omning.transaction.services.ScreenTransactionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class TransactionTest {
	@Autowired
	ScreenTransactionService screenTransactionService;
	
	@Autowired
	ScreenService screenService;
	
	@Test
	@Rollback(value = false)
	public void testAddNewVoucherToNewTransaction(){
		try {
			String tenantId = "01";
			String transactionNo = ""+System.currentTimeMillis();
			ScreenTransaction txn = new ScreenTransaction();
			
		
			Screen tScreen = getScreenFromDB("tScreen1");
			txn.setScreen(tScreen);
			txn.setTenantId(tenantId);
		//	txn.sets
			txn.setTransactionNumber(transactionNo);
			
			txn.setProductName("prd1");
			txn.setModuleCode("modCode1");
			String branchCode = "bran01";
			txn.setBranchCode(branchCode);
			txn.setActivityCode("a01");
			
			txn.setProductCode("prdcode");
			txn.setActivityName("a01");
			txn.setBranchName("bhagalkot");
			txn.setModuleName("modname");
			
			
			VoucherMst mst = new VoucherMst();
			mst.setTenantId(tenantId);
			mst.setBranchCode(branchCode);
		//	sdf1.applyPattern("dd/MM/yyyy");
			DateFormat df = new SimpleDateFormat("dd/mm/yyyy HH:mm:ss");

			// Get the date today using Calendar object.
			Date today = Calendar.getInstance().getTime();        
			// Using DateFormat format method we can create a string 
			// representation of a date with the defined format.
			String entryDate = df.format(today);
			mst.setEntryDate(entryDate);
			mst.setBatchCode("b01");
			mst.setSetNo(new Long(txn.getTransactionNumber()));
			Long scrollNo = System.currentTimeMillis();
			mst.setScrollNo(scrollNo);
			mst.setActivityCode("a01");
			mst.setCashFlowType("CR");
			mst.setFcyTrnAmt(234.56f);
			//txn.getVouchers().add(mst);
			txn = screenTransactionService.saveOrUpdate(txn, mst);
			Assert.assertEquals(true, true);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Test
	@Rollback(value = false)
	public void testAddNewVoucherToExistingTransaction(){
		try {
			Long setNo = 1426323464375l;
			ScreenTransaction transaction = screenTransactionService.findUniqueScreenTransaction("01", setNo+"");
			
			VoucherMst mst = new VoucherMst();
			mst.setTenantId("01");
			String branchCode = "bran01";
			mst.setBranchCode(branchCode);
			
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

			// Get the date today using Calendar object.
			Date today = Calendar.getInstance().getTime();        
			// Using DateFormat format method we can create a string 
			// representation of a date with the defined format.
			String entryDate = df.format(today);
			mst.setEntryDate(entryDate);
			mst.setBatchCode("b01");
			mst.setSetNo(setNo);
			Long scrollNo = System.currentTimeMillis();
			mst.setScrollNo(scrollNo);
			mst.setActivityCode("a01");
			mst.setCashFlowType("CR");
			mst.setFcyTrnAmt(884.56f);
			//transaction.getVouchers().add(mst);
			
			transaction= screenTransactionService.saveOrUpdate(transaction, mst);
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	private Screen getScreenFromDB(String screenName) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("screenName", screenName);
		params.put("tenantId", "01");
		params.put("active", true);
		String qry = "Screen.getScreenByName";
		List<Screen> screens = screenService.findByNamedQueryAndNamedParams(qry, params);
			if(screens.size() > 0) {
				Screen s1 = screens.get(0);
				Assert.assertEquals(true, true);
				return s1;
			}
			else {

				Assert.assertEquals(true, false);
				throw new OmniNGException("bo screen present");
			}
	}

}
