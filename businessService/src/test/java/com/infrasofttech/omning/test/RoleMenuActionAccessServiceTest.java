package com.infrasofttech.omning.test;

import java.util.Set;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.RoleMenuActionAccess;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.services.RoleMstService;
import com.infrasofttech.utils.MENUACTIONSTATUS;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class RoleMenuActionAccessServiceTest {
	@Autowired
	RoleMstService roleMstService;
	
	@Autowired
	MenuMstService menuMstService;
	
	@Autowired
	RoleMenuActionAccessService roleMenuActionAccessService;
	
	@Test
	@Rollback(value=false)
	public void testCreateUpdateRoleMenuActionAccess(){
		try {
			RoleMenuActionAccess roleMenuActionAccess = new RoleMenuActionAccess();
			roleMenuActionAccess.setTenantId("01");
			roleMenuActionAccess.setRoleMstCode("01");
			roleMenuActionAccess.setMenuCode("02");
			roleMenuActionAccess.setCreateAction(MENUACTIONSTATUS.ACTIVE);
			roleMenuActionAccessService.saveOrUpdate(roleMenuActionAccess);
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value=false)
	public void testGetRoleMenuActionAccessSet(){
		try {
			Set<RoleMenuActionAccess> rmaas = roleMenuActionAccessService.getRoleMenuActionAccessSet("01", "01");
			Assert.assertEquals(true, true);
		} catch (OmniNGException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
}
