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

import com.infrasofttech.domain.entities.UserBranchMap;
import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.omning.services.UserMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class UserMstTest {
	
	@Autowired
	UserMstService userMstService;
	
	
	/** > QUERY TO TEST THE RESULTS AT BACKEND
	 select id, tenantid, loginid, userdisplayname, isuserlocked, isuserloggedin, 
     allowconcurrentlogin, isactive, consequetivebadlogincount, pwd from usermst
	 */
	
	@Test
	@Rollback(value = false)
	public void testUserMstCreation() {
		String tenantId="01";
		String loginId="mahesh15";
		String userDisplayName = loginId+tenantId;
		String pwd="abcd1234";
		String userBaseBranchCode = "00001";
		String branchCode1 = "00001";
		String branchCode2 = "00002";
		String userFName="FName 1";
		String userTypeCode="Type 1";
		String permissionNo="permission 1";
		String emailId="mahesh1.laddha@infrasofttech.com";
		List<UserBranchMap> userBranchMaps = new ArrayList<UserBranchMap>();

		UserBranchMap userBranchMap = new UserBranchMap();
//		userBranchMap.setId(1L);
		userBranchMap.setTenantId(tenantId);
		userBranchMap.setBranchCode(branchCode1);
		userBranchMap.setLoginId(loginId);
		userBranchMap.setIsActive(true);
		userBranchMaps.add(userBranchMap);
		
		try {
			UserMst user = new UserMst();
			user.setTenantId(tenantId);
			user.setLoginId(loginId);
			user.setPwd(pwd);
			user.setUserDisplayName(userDisplayName);
			user.setUserFName(userFName);
			user.setUserTypeCode(userTypeCode);
			user.setPermissionNo(permissionNo);
			user.setEmailId(emailId);
			
			user.setUserBaseBranchCode(userBaseBranchCode);
			user.setUserBranchMaps(userBranchMaps);
			
			user = (UserMst)userMstService.saveOrUpdate(user);
			
			if(user==null) {Assert.assertEquals(true, false);}
			if(user!=null && user.getUserDisplayName().equalsIgnoreCase(userDisplayName)){
				List<UserBranchMap> ubms = (List<UserBranchMap>) user.getUserBranchMaps();

				if(ubms.get(0).getLoginId().equals(loginId)){
					Assert.assertEquals(true, true);
				}else{
					Assert.assertEquals(true, false);
				}
			}
			else{
				Assert.assertEquals(true, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testGetUserBasedOnLogin(){
		String tenantId="01";
		String loginId = "mahesh5";
		try{
			List<UserMst> users = userMstService.findAllByTenant("01");
			UserMst user = new UserMst();
			user = (UserMst)userMstService.getUserBasedOnLogin(tenantId, loginId);
			if(user==null) {Assert.assertEquals(true, false);}
			if(user.getLoginId().equalsIgnoreCase(loginId)){
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testDisableUser() {
		String tenantId="01";
		String loginId="mahesh5";
		try{
			UserMst user = new UserMst();
			
			user = userMstService.disableUser(tenantId, loginId);
			if(user==null) {Assert.assertEquals(true, false);}

			if(user!=null && user.getIsActive() == false){
				Assert.assertEquals(true, true);
			}
			else{
				Assert.assertEquals(true, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value = false)
	public void testEnableUser() {
		String tenantId="01";
		String loginId="mahesh5";
		try{
			UserMst user = new UserMst();
			
			user = userMstService.enableUser(tenantId, loginId);
			if(user==null) {Assert.assertEquals(true, false);}

			if(user!=null && user.getIsActive() == true){
				Assert.assertEquals(true, true);
			}
			else{
				Assert.assertEquals(true, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testSetBadLoginCount() {
		String tenantId = "01";
		String loginId="mahesh5";
		Integer cntOrg=0;
		Integer cntNew=0;
		UserMst user = new UserMst();
		try{
			user = userMstService.getUserBasedOnLogin(tenantId, loginId);
			cntOrg = user.getConsequetiveBadLoginCount();
			if (cntOrg==null) cntOrg=0;	
			user = (UserMst)userMstService.setBadLoginCount(tenantId,loginId);
			if(user==null) {Assert.assertEquals(true, false);}
			
			cntNew = user.getConsequetiveBadLoginCount();
			if(cntNew==null) cntNew=0;
			if((cntNew-cntOrg)==1) {
				Assert.assertEquals(true, true);
			}else {
				Assert.assertEquals(true, false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
	
	@Test
	@Rollback(value = false)
	public void testLockUser() {
		String tenantId="01";
		String loginId="mahesh5";
		try{
			UserMst user = new UserMst();
			user = userMstService.lockUser(tenantId, loginId); 
			
			if(user==null){
				Assert.assertEquals(true, false);
			}
			else if(user != null && user.getIsUserLocked()==true){
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testUnLockUser() {
		String tenantId="01";
		String loginId="mahesh5";
		try{
			UserMst user = new UserMst();
			user = userMstService.unLockUser(tenantId, loginId); 
			
			if(user==null){
				Assert.assertEquals(true, false);
			}
			else if(user != null && user.getIsUserLocked()==false){
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}

	@Test
	@Rollback(value = false)
	public void testChangePwd() {
		String tenantId="01";
		String loginId="mahesh5";
		String hOldPwd="pqrs1234";
		String hNewPwd="abcd1234";
		UserMst user = new UserMst();
		try{
			user = userMstService.changePwd(tenantId, loginId, hOldPwd, hNewPwd);
			if(user==null){
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
	public void testResetPwd() {
		String tenantId="01";
		String loginId="mahesh5";
		UserMst user = new UserMst();
		try{
			user = userMstService.resetUserPwd(tenantId, loginId);
			if(user==null){
				Assert.assertEquals(true, false);
			}else{
				Assert.assertEquals(true, true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Assert.assertEquals(true, false);
		}
	}
}
