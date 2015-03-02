package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.RoleMst;
import com.infrasofttech.omning.services.RoleMenuActionAccessService;
import com.infrasofttech.omning.services.RoleMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class RoleMstTest {
	
	@Autowired
	RoleMstService roleMstService;
	
	@Autowired
	RoleMenuActionAccessService rmaaService;
	
	@Test
	@Rollback(value = false)
	public void testRoleMstCreation() {
		Integer i=0;
		String tenantId="01";
		String[] roleCode={"testrole1","testrole2","testrole3","testrole4","testrole5"};
		String[] roleName={"test role11","test role2","test role3","test role4","test role5"};
		try {
			RoleMst roleMst1 = new RoleMst();
			roleMst1.setTenantId("01");
			roleMst1.setRoleCode(roleCode[i]);
			roleMst1.setRoleName(roleName[i]);
			roleMst1 = (RoleMst)roleMstService.saveOrUpdate(roleMst1);

			Assert.assertEquals(true, true);
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	

	
}
