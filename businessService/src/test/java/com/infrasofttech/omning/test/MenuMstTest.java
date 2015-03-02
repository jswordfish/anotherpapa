package com.infrasofttech.omning.test;

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

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.MenuMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class MenuMstTest {
	
	@Autowired
	MenuMstService  menuMstService;
	
	@Test
	@Rollback(value=false)
	public void testAppLevelRoleMenuz(){
		MenuMst  menuMst = new MenuMst();
		menuMst.setTenantId("01");
		menuMst.setLanguageCode("en");
		menuMst.setMenuCode("02");
		menuMst.setIsActive(true);
		try {
			 Map<String, Map<String, List<MenuMst>>>  data = menuMstService.setAppLevelRoleMenuz();
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
}
