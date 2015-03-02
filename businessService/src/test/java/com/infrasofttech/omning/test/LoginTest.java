package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.services.UserMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class LoginTest {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserMstService userMstService;
	
	
	@Test
	@Rollback(value = false)
	public void testValidateBranchUserDtls(){
		String tenantId="01";
		String branchCode="00001";
		String loginId="mahesh5";
		UserMst userMst = new UserMst();
		
		try{
			userMst = loginService.validateBranchUserDtls(tenantId, branchCode, loginId);
			
			if(userMst==null){
				Assert.assertEquals(true, false);
			}else{
				Assert.assertEquals(true, true);
			}
		}catch(Exception e){
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testKillLoginSession(){
		String tenantId="01";
		String branchCode="00001";
		String loginId="mahesh5";
		UserMst userMst = new UserMst();
		
		try{
			userMst = loginService.killLoginSession(tenantId, loginId);

			if(userMst==null){
				Assert.assertEquals(true, false);
			}else{
				Assert.assertEquals(true, true);
			}
		}catch(Exception e){
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testValidateLoginCredentials(){
		String tenantId="01";
		String loginId="mahesh5";
		String hPwd="abcd1234";
		UserMst userMst = new UserMst();
		try{
			userMst = loginService.validateLoginCredentials(tenantId, loginId, hPwd);

			if(userMst==null){
				Assert.assertEquals(true, false);
			}else{
				Assert.assertEquals(true, true);
			}
		}catch(Exception e){
			Assert.assertEquals(true, false);
		}
	}
}
