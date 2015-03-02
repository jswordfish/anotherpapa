package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.UserMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface UserMstService extends OmniNGService {
	/**
	 * Functionalities required:
	 * > Create New User, Edit existing User
	 * > Disable existing user
	 * > Find (active) users based on tenantId  -------------- For user list screen
	 * > Find (disabled) users based on tenantId  -------------- For disabled user list screen
	 * > Find User's EmailId
	 * > Find User based on tenantId, loginId
	 * > Find User based on tenantId, PkId
	 * > Unlock User
	 * > Lock User
	 * > Reset password
	 */

	public List<UserMst> getActiveUsers(String tenantId) throws OmniNGException;
	public List<UserMst> getActiveUsersPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
	public List<UserMst> getDisabledUsers(String tenantId) throws OmniNGException;
	public List<UserMst> getDisabledUsersPg(String tenantId, Integer startFrom, Integer maxResults) throws OmniNGException;
	public UserMst enableUser(String tenantId, String loginId ) throws OmniNGException;
	public UserMst disableUser(String tenantId, String loginId ) throws OmniNGException;
	public UserMst saveOrUpdate(UserMst entity) throws OmniNGException;
	public UserMst getUserBasedOnLogin(String tenantId, String loginId) throws OmniNGException;
	public UserMst getEmailId(String tenantId, String loginId) throws OmniNGException;
	public UserMst unLockUser(String tenantId, String loginId) throws OmniNGException;
	public UserMst lockUser(String tenantId, String loginId) throws OmniNGException;
	public UserMst resetUserPwd(String tenantId, String loginId) throws OmniNGException;
	public UserMst setBadLoginCount(String tenantId, String loginId) throws OmniNGException;
	public UserMst changePwd(String tenantId, String loginId, String hOldPwd, String hNewPwd) throws OmniNGException;
	public UserMst setSuccessfulLogin(String tenantId, String loginId) throws OmniNGException;

//	public UserMst getUserMstByPkId(Long pkId) throws OmniNGException;
//	public Long getPkId(String tenantId, String loginId) throws OmniNGException;
//	public UserBranchMap getUserBranchMap(String branchCode, String loginId) throws OmniNGException;
}
