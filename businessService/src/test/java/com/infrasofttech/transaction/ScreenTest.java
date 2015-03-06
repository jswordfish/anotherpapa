package com.infrasofttech.transaction;

import java.util.ArrayList;
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

import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.domain.entities.transaction.ScreenType;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.transaction.services.ScreenElementService;
import com.infrasofttech.omning.transaction.services.ScreenMapperService;
import com.infrasofttech.omning.transaction.services.ScreenRowService;
import com.infrasofttech.omning.transaction.services.ScreenService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class ScreenTest {
	@Autowired
	ScreenService screenService;
	
	@Autowired
	ScreenMapperService screenMapperService;
	
	@Autowired
	ScreenElementService screenElementService;
	
	@Autowired
	ScreenRowService screenRowService;
	
	@Test
	@Rollback(value = false)
	public void testScreenWithScreenElements(){
		try {
			List<ScreenElement> els = screenElementService.findAllByTenant("001");
			ScreenRow screenRow = new ScreenRow();
			screenRow.setScreenElements(els);
			//screenRowService.saveOrUpdate(screenRow);
			Screen screen = new Screen();
			screen.setActive(true);
			screen.setScreenName("abcdefddd");
			List<ScreenRow> rows = new ArrayList<ScreenRow>();
			rows.add(screenRow);
			screen.setRows(rows);
			screenService.saveOrUpdate(screen);
			System.out.println("screen");
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	private Screen getScreen(ScreenType type, String name){
		List<ScreenElement> els = screenElementService.findAllByTenant("001");
		ScreenRow screenRow = new ScreenRow();
		screenRow.setScreenElements(els);
		//screenRowService.saveOrUpdate(screenRow);
		Screen screen = new Screen();
		screen.setActive(true);
		screen.setScreenName(name);
		List<ScreenRow> rows = new ArrayList<ScreenRow>();
		rows.add(screenRow);
		screen.setRows(rows);
		screen.setScreenType(type);
		return screen;
	}
	
	@Test
	@Rollback(value = false)
	public void testScreenMapper(){
		try {
			Screen txScreen = getScreen(ScreenType.TRANSACTION, "tScreen");
			Screen iScreen = getScreen(ScreenType.BALANCE, "iScreen");
			Screen bScreen = getScreen(ScreenType.INFO, "bScreen");
			ScreenMapper screenMapper = new ScreenMapper();
			screenMapper.setTenantId("01");
			screenMapper.setActivityCode("a01");
			screenMapper.setBranchCode("b01");
			screenMapper.setProductCode("p01");
			screenMapper.setModuleCode("m01");
			screenMapper.setActivityName("a01");
			screenMapper.setBranchName("Bhandup West");
			screenMapper.setModuleName("modulename");
			screenMapper.setProductName("pname");
			screenMapper.setBalancesScreen(bScreen);
			screenMapper.setInfoScreen(iScreen);
			screenMapper.setTransactionScreen(txScreen);
			screenMapper = screenMapperService.saveOrUpdate(screenMapper);
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	
	@Test
	@Rollback(value = false)
	public void testScreenCreation() {
		try {
			Screen transScreen = getTestScreen("loan payment", ScreenType.TRANSACTION);
			Screen balancesScreen = getTestScreen("loan payment Balances", ScreenType.BALANCE);
			Screen infoScreen = getTestScreen("loan payment Info", ScreenType.INFO);
			transScreen = screenService.saveOrUpdate(transScreen);
			balancesScreen = screenService.saveOrUpdate(balancesScreen);
			infoScreen = screenService.saveOrUpdate(infoScreen);
			ScreenMapper screenMapper = new ScreenMapper();
			screenMapper.setTenantId("01");
			screenMapper.setActivityCode("a01");
			screenMapper.setBranchCode("b01");
			screenMapper.setProductCode("p01");
			screenMapper.setModuleCode("m01");
			screenMapper.setBalancesScreen(balancesScreen);
			screenMapper.setInfoScreen(infoScreen);
			screenMapper.setTransactionScreen(transScreen);
			screenMapper = screenMapperService.saveOrUpdate(screenMapper);
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
		//screenElement1.s
	}
	
	@Test
	@Rollback(value=false)
	public void testUpdateScreenMapper() {
		Screen tranScreen = getScreenFromDB("loan payment");
		Screen balScreen = getScreenFromDB("loan payment Balances");
		Screen infoScreen = getScreenFromDB("loan payment Info");
		ScreenMapper screenMapper = new ScreenMapper();
		screenMapper.setTenantId("01");
		screenMapper.setActivityCode("a01");
		screenMapper.setBranchCode("b01");
		screenMapper.setProductCode("p01");
		screenMapper.setModuleCode("m01");
		screenMapper.setBalancesScreen(balScreen);
		screenMapper.setInfoScreen(infoScreen);
		screenMapper.setTransactionScreen(tranScreen);
		screenMapper = screenMapperService.saveOrUpdate(screenMapper);
		
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
	
	private Screen getTestScreen(String screenName, ScreenType screenType) {
		ScreenElement screenElement1 = new ScreenElement();
		screenElement1.setName("abc1");
		screenElement1.setTenantId("01");
		ScreenElement screenElement2 = new ScreenElement();
		screenElement2.setName("def");
		screenElement2.setTenantId("01");
		ScreenElement screenElement3 = new ScreenElement();
		screenElement3.setName("xyz");
		screenElement3.setTenantId("01");
		List<ScreenElement> elements = new ArrayList<ScreenElement>();
		elements.add(screenElement1);
		elements.add(screenElement2);
		elements.add(screenElement3);
		ScreenRow row1 = new ScreenRow();
		row1.setScreenElements(elements);
		row1.setTenantId("01");
		Screen screen = new Screen();
		screen.setScreenType(screenType);
		screen.setTenantId("01");
		screen.setScreenName(screenName);
		screen.setActive(true);
		List<ScreenRow> rows = new ArrayList<ScreenRow>();
		rows.add(row1);
		screen.setRows(rows);
		return screen;
	}
	
	@Test
	public void testGetScreen() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("screenName", "Loan_Repayment_Screen");
		params.put("tenantId", "01");
		params.put("active", true);
		String qry = "Screen.getScreenByName";
		List<Screen> screens = screenService.findByNamedQueryAndNamedParams(qry, params);
			if(screens.size() > 0) {
				Screen s1 = screens.get(0);
				Assert.assertEquals(true, true);
			}
			else {
				Assert.assertEquals(true, false);
			}
	}

}
