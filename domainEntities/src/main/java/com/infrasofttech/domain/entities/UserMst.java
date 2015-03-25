package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@NamedQueries({
		@NamedQuery(name = "UserMst.getUserMst", query = "SELECT u FROM UserMst u WHERE u.loginId=:loginId "
				+ " AND u.tenantId=:tenantId"),
		@NamedQuery(name = "UserMst.verifyLogin", query = "SELECT u FROM UserMst u WHERE u.loginId=:loginId "
				+ " AND u.tenantId=:tenantId AND u.pwd=:pwd"
				+ " AND u.isActive=true"),
		@NamedQuery(name = "UserMst.getDisabledUser", query = "SELECT u FROM UserMst u WHERE u.loginId=:loginId "
				+ "AND u.tenantId=:tenantId AND u.isActive=false") })
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantId",
		"loginId" }))
public class UserMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	// @Transient
	// private List<Address> addresses = new ArrayList<Address>();

	@Column(length = 1000, nullable = true)
	private String loginSession = "";

	@Column(length = 1000, nullable = false)
	private String roleCode = "";

	@OneToMany(cascade = CascadeType.PERSIST)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<UserBranchMap> userBranchMaps = new ArrayList<UserBranchMap>();

	@Column(length = 20, nullable = true)
	private String userCode = "";

	@Column(length = 20, nullable = false)
	private String loginId = "";

	@Column(length = 20, nullable = true)
	private String userTypeCode = ""; // from Lookup - Internal, External,
										// WebUser

	@Column(nullable = true)
	private String reportingUserCode = ""; // to create Users' reporting
											// hierarchy

	@Column(length = 1200, nullable = true)
	private String pwd = ""; // Encrypted value
	@Column(length = 1200, nullable = true)
	private String pwdSalt = ""; // Encrypted value

	@Column(length = 30, nullable = true)
	private String permissionNo = "";

	@Column(length = 10, nullable = true)
	private String userSalutation = "";
	@Column(length = 30, nullable = true)
	private String userFName = ""; // This can also be a System Name (ATM, etc.)
	@Column(length = 30, nullable = true)
	private String userMName = "";
	@Column(length = 30, nullable = true)
	private String userLName = "";

	@Column(length = 30, nullable = true)
	private String userDisplayName = "";

	@Column(nullable = true)
	private String userBaseBranchCode = "";

	@Column(length = 100, nullable = true)
	private String emailId = "";

	@Column(nullable = true)
	private Boolean forcePwdChgYN = false;

	@Column(nullable = true)
	private Integer forcePwdChgDays = 0;

	@Column(nullable = true)
	private Boolean forceMinLoginFreqYN = false;

	@Column(nullable = true)
	private Integer forceMinLoginFreqDays = 0;

	@Column(nullable = true)
	private Integer maxConseBadLoginPerDay = 0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date lastSuccessfulLoginDateTime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date prevPwdChgOn;

	@Temporal(TemporalType.DATE)
	private Date nextPwdChgOn;

	@Column(nullable = true)
	private Boolean isUserLocked = false;

	@Column(nullable = true)
	private Boolean isUserLoggedin = false;

	@Column(nullable = true)
	private Integer consequetiveBadLoginCount = 0;

	@Column(nullable = true)
	private Boolean allowConcurrentLogin = false;

	@Temporal(TemporalType.TIMESTAMP)
	private Date inActiveFromDateTime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date inActiveTillDateTime;

	@Column(nullable = true)
	private Boolean isActive = true;

	@Column(nullable = true, length = 30)
	private String authStatus = "";

	public Collection<UserBranchMap> getUserBranchMaps() {
		return userBranchMaps;
	}

	public void setUserBranchMaps(Collection<UserBranchMap> userBranchMaps) {
		this.userBranchMaps = userBranchMaps;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getUserTypeCode() {
		return userTypeCode;
	}

	public void setUserTypeCode(String userTypeCode) {
		this.userTypeCode = userTypeCode;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwdSalt() {
		return pwdSalt;
	}

	public void setPwdSalt(String pwdSalt) {
		this.pwdSalt = pwdSalt;
	}

	public String getPermissionNo() {
		return permissionNo;
	}

	public void setPermissionNo(String permissionNo) {
		this.permissionNo = permissionNo;
	}

	public String getUserSalutation() {
		return userSalutation;
	}

	public void setUserSalutation(String userSalutation) {
		this.userSalutation = userSalutation;
	}

	public String getUserFName() {
		return userFName;
	}

	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}

	public String getUserMName() {
		return userMName;
	}

	public void setUserMName(String userMName) {
		this.userMName = userMName;
	}

	public String getUserLName() {
		return userLName;
	}

	public void setUserLName(String userLName) {
		this.userLName = userLName;
	}

	public String getUserDisplayName() {
		return userDisplayName;
	}

	public void setUserDisplayName(String userDisplayName) {
		this.userDisplayName = userDisplayName;
	}

	public String getUserBaseBranchCode() {
		return userBaseBranchCode;
	}

	public void setUserBaseBranchCode(String userBaseBranchCode) {
		this.userBaseBranchCode = userBaseBranchCode;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Boolean getForcePwdChgYN() {
		return forcePwdChgYN;
	}

	public void setForcePwdChgYN(Boolean forcePwdChgYN) {
		this.forcePwdChgYN = forcePwdChgYN;
	}

	public Integer getForcePwdChgDays() {
		return forcePwdChgDays;
	}

	public void setForcePwdChgDays(Integer forcePwdChgDays) {
		this.forcePwdChgDays = forcePwdChgDays;
	}

	public Boolean getForceMinLoginFreqYN() {
		return forceMinLoginFreqYN;
	}

	public void setForceMinLoginFreqYN(Boolean forceMinLoginFreqYN) {
		this.forceMinLoginFreqYN = forceMinLoginFreqYN;
	}

	public Integer getForceMinLoginFreqDays() {
		return forceMinLoginFreqDays;
	}

	public void setForceMinLoginFreqDays(Integer forceMinLoginFreqDays) {
		this.forceMinLoginFreqDays = forceMinLoginFreqDays;
	}

	public Integer getMaxConseBadLoginPerDay() {
		return maxConseBadLoginPerDay;
	}

	public void setMaxConseBadLoginPerDay(Integer maxConseBadLoginPerDay) {
		this.maxConseBadLoginPerDay = maxConseBadLoginPerDay;
	}

	public Date getLastSuccessfulLoginDateTime() {
		return lastSuccessfulLoginDateTime;
	}

	public void setLastSuccessfulLoginDateTime(Date lastSuccessfulLoginDateTime) {
		this.lastSuccessfulLoginDateTime = lastSuccessfulLoginDateTime;
	}

	public Date getPrevPwdChgOn() {
		return prevPwdChgOn;
	}

	public void setPrevPwdChgOn(Date prevPwdChgOn) {
		this.prevPwdChgOn = prevPwdChgOn;
	}

	public Date getNextPwdChgOn() {
		return nextPwdChgOn;
	}

	public void setNextPwdChgOn(Date nextPwdChgOn) {
		this.nextPwdChgOn = nextPwdChgOn;
	}

	public Boolean getIsUserLocked() {
		return isUserLocked;
	}

	public void setIsUserLocked(Boolean isUserLocked) {
		this.isUserLocked = isUserLocked;
	}

	public Boolean getIsUserLoggedin() {
		return isUserLoggedin;
	}

	public void setIsUserLoggedin(Boolean isUserLoggedin) {
		this.isUserLoggedin = isUserLoggedin;
	}

	public Integer getConsequetiveBadLoginCount() {
		return consequetiveBadLoginCount;
	}

	public void setConsequetiveBadLoginCount(Integer consequetiveBadLoginCount) {
		this.consequetiveBadLoginCount = consequetiveBadLoginCount;
	}

	public Boolean getAllowConcurrentLogin() {
		return allowConcurrentLogin;
	}

	public void setAllowConcurrentLogin(Boolean allowConcurrentLogin) {
		this.allowConcurrentLogin = allowConcurrentLogin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Date getInActiveFromDateTime() {
		return inActiveFromDateTime;
	}

	public void setInActiveFromDateTime(Date inActiveFromDateTime) {
		this.inActiveFromDateTime = inActiveFromDateTime;
	}

	public Date getInActiveTillDateTime() {
		return inActiveTillDateTime;
	}

	public void setInActiveTillDateTime(Date inActiveTillDateTime) {
		this.inActiveTillDateTime = inActiveTillDateTime;
	}

	public String getLoginSession() {
		return loginSession;
	}

	public void setLoginSession(String loginSession) {
		this.loginSession = loginSession;
	}

	public String getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}

	public String getReportingUserCode() {
		return reportingUserCode;
	}

	public void setReportingUserCode(String reportingUserCode) {
		this.reportingUserCode = reportingUserCode;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

}
