package com.infrasofttech.domain.entities;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;



@Entity
@NamedQueries({
	@NamedQuery(name = "VoucherMst.getUniqueVoucherMst", query = "SELECT v FROM VoucherMst v "
			+ "WHERE v.tenantId=:tenantId AND v.branchCode=:branchCode AND v.entryDate=:entryDate AND v.batchCode=:batchCode AND "
			+ " v.setNo=:setNo AND v.scrollNo=:scrollNo")
})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = 
	{ "tenantId", "branchCode", "entryDate", "batchCode", "setNo", "scrollNo" }))
public class VoucherMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(nullable=true, length=100)
	private String branchCode = "";					// integer
	
	@Column(nullable=true, length=100)
	private String entryDate;						// datetime

	@Column(nullable=true, length=100)
	private String batchCode = "";					// integer

	@Column(nullable=true)
	private Long setNo = 0l;						

	@Column(nullable=true)
	private Long scrollNo = 0l;

	@Column(nullable=true)
	private Integer mainScrollNo = 0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date postDate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fundEffDate;

	@Column(nullable=true, length=20)
	private String activityCode;						// max. 8
	
	@Column(nullable=true, length=20)
	private String cashFlowType;						// max. 8

	@Temporal(TemporalType.TIMESTAMP)
	private Date valueDate;

	@Column(nullable=true, length=10)
	private String bookType;							// max. 2
	
	@Column(nullable=true, length=1)
	private String drCr;								// max. 1
	
	@Column(nullable=true, length=50)
	private String vcrAcctId;							// max. 32
	
	@Column(nullable=true, length=50)
	private String mainAcctId;
	
	@Column(nullable=true, length=10)
	private String mainModule;							// integer
	
	@Column(nullable=true, length=10)
	private String vcrModule;							// integer
	
	@Column(nullable=true, length=5)
	private String trnCurrCode;							// max. 3

	@Column(nullable=true)
	private Double fcyTrnAmt=0d;
	
	@Column(nullable=true)
	private Double lcyConvRate=1d;
	
	@Column(nullable=true)
	private Double lcyTrnAmt=0d;
	
	@Column(nullable=true, length=10)
	private String instrBankCd="";						// integer
	
	@Column(nullable=true, length=10)
	private String instrBranchCd="";					// integer
	
	@Column(nullable=true, length=10)
	private String instrType="";						// integer
	
	@Column(nullable=true, length=20)
	private String instrNo="";							// max. 12

	@Temporal(TemporalType.TIMESTAMP)
	private Date instrDate;
	
	@Column(nullable=true)
	private Integer tokenNo;
	
	@Column(nullable=true, length=70)
	private String narration="";
	
	@Column(nullable=true, length=70)
	private String particulars="";
	
	@Column(nullable=true)
	private Integer sysGenVcr=0;;
	
	@Column(nullable=true, length=2)
	private String shTotFlag="";
	
	@Column(nullable=true, length=2)
	private String shClrFlag="";
	
	@Column(nullable=true, length=2)
	private String acTotFlag="";
	
	@Column(nullable=true, length=2)
	private String acClrFlag="";
	
	@Column(nullable=true)
	private Integer fkMakerPK=0;							// user pk

	@Temporal(TemporalType.TIMESTAMP)
	private Date makerDate;
	
	@Column(nullable=true, length=20)
	private String makerTime="0";							// integer
	
	@Column(nullable=true)
	private Integer checker1=0;
	
	@Column(nullable=true)
	private Integer checker2=0;

	@Column(nullable=true)
	private Integer checker3=0;
	
	@Column(nullable=true)
	private Integer checker4=0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date checkDate;
	
	@Column(nullable=true, length=20)
	private String checkerTime;								// integer
	
	@Column(nullable=true)
	private Integer noAuthPending=0;
	
	@Column(nullable=true)
	private Integer noAuthOver=0;
	
	@Column(nullable=true, length=1)
	private String postFlag="P";
	
	@Column(nullable=true, length=1)
	private String authFlag="A";
	
	@Column(nullable=true, length=1)
	private String fundEffFlag="F";
	
	@Column(nullable=true, length=1)
	private String canceledFlag="";
	
	@Column(nullable=true)
	private Integer postAuthFeffCncl;
	
	@Column(nullable=true)
	private Integer updtChkId;
	
	@Column(nullable=true)
	private Double partClearAmt=0d;
	
	@Column(nullable=true)
	private String postTime="0";									// integer

	@Temporal(TemporalType.TIMESTAMP)
	private Date entryDateTime;
	
	
	public Date getEntryDateTime() {
		return entryDateTime;
	}

	public void setEntryDateTime(Date entryDateTime) {
		this.entryDateTime = entryDateTime;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getBatchCode() {
		return batchCode;
	}

	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}

	

	
	public Integer getMainScrollNo() {
		return mainScrollNo;
	}

	public void setMainScrollNo(Integer mainScrollNo) {
		this.mainScrollNo = mainScrollNo;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getFundEffDate() {
		return fundEffDate;
	}

	public void setFundEffDate(Date fundEffDate) {
		this.fundEffDate = fundEffDate;
	}

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getCashFlowType() {
		return cashFlowType;
	}

	public void setCashFlowType(String cashFlowType) {
		this.cashFlowType = cashFlowType;
	}

	public Date getValueDate() {
		return valueDate;
	}

	public void setValueDate(Date valueDate) {
		this.valueDate = valueDate;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public String getDrCr() {
		return drCr;
	}

	public void setDrCr(String drCr) {
		this.drCr = drCr;
	}

	public String getVcrAcctId() {
		return vcrAcctId;
	}

	public void setVcrAcctId(String vcrAcctId) {
		this.vcrAcctId = vcrAcctId;
	}

	public String getMainAcctId() {
		return mainAcctId;
	}

	public void setMainAcctId(String mainAcctId) {
		this.mainAcctId = mainAcctId;
	}

	public String getMainModule() {
		return mainModule;
	}

	public void setMainModule(String mainModule) {
		this.mainModule = mainModule;
	}

	public String getVcrModule() {
		return vcrModule;
	}

	public void setVcrModule(String vcrModule) {
		this.vcrModule = vcrModule;
	}

	public String getTrnCurrCode() {
		return trnCurrCode;
	}

	public void setTrnCurrCode(String trnCurrCode) {
		this.trnCurrCode = trnCurrCode;
	}

	public Double getFcyTrnAmt() {
		return fcyTrnAmt;
	}

	public void setFcyTrnAmt(Double fcyTrnAmt) {
		this.fcyTrnAmt = fcyTrnAmt;
	}

	public Double getLcyConvRate() {
		return lcyConvRate;
	}

	public void setLcyConvRate(Double lcyConvRate) {
		this.lcyConvRate = lcyConvRate;
	}

	public Double getLcyTrnAmt() {
		return lcyTrnAmt;
	}

	public void setLcyTrnAmt(Double lcyTrnAmt) {
		this.lcyTrnAmt = lcyTrnAmt;
	}

	public String getInstrBankCd() {
		return instrBankCd;
	}

	public void setInstrBankCd(String instrBankCd) {
		this.instrBankCd = instrBankCd;
	}

	public String getInstrBranchCd() {
		return instrBranchCd;
	}

	public void setInstrBranchCd(String instrBranchCd) {
		this.instrBranchCd = instrBranchCd;
	}

	public String getInstrType() {
		return instrType;
	}

	public void setInstrType(String instrType) {
		this.instrType = instrType;
	}

	public String getInstrNo() {
		return instrNo;
	}

	public void setInstrNo(String instrNo) {
		this.instrNo = instrNo;
	}

	public Date getInstrDate() {
		return instrDate;
	}

	public void setInstrDate(Date instrDate) {
		this.instrDate = instrDate;
	}

	public Integer getTokenNo() {
		return tokenNo;
	}

	public void setTokenNo(Integer tokenNo) {
		this.tokenNo = tokenNo;
	}

	public String getNarration() {
		return narration;
	}

	public void setNarration(String narration) {
		this.narration = narration;
	}

	public String getParticulars() {
		return particulars;
	}

	public void setParticulars(String particulars) {
		this.particulars = particulars;
	}

	public Integer getSysGenVcr() {
		return sysGenVcr;
	}

	public void setSysGenVcr(Integer sysGenVcr) {
		this.sysGenVcr = sysGenVcr;
	}

	public String getShTotFlag() {
		return shTotFlag;
	}

	public void setShTotFlag(String shTotFlag) {
		this.shTotFlag = shTotFlag;
	}

	public String getShClrFlag() {
		return shClrFlag;
	}

	public void setShClrFlag(String shClrFlag) {
		this.shClrFlag = shClrFlag;
	}

	public String getAcTotFlag() {
		return acTotFlag;
	}

	public void setAcTotFlag(String acTotFlag) {
		this.acTotFlag = acTotFlag;
	}

	public String getAcClrFlag() {
		return acClrFlag;
	}

	public void setAcClrFlag(String acClrFlag) {
		this.acClrFlag = acClrFlag;
	}

	public Integer getFkMakerPK() {
		return fkMakerPK;
	}

	public void setFkMakerPK(Integer fkMakerPK) {
		this.fkMakerPK = fkMakerPK;
	}

	public Date getMakerDate() {
		return makerDate;
	}

	public void setMakerDate(Date makerDate) {
		this.makerDate = makerDate;
	}

	public String getMakerTime() {
		return makerTime;
	}

	public void setMakerTime(String makerTime) {
		this.makerTime = makerTime;
	}

	public Integer getChecker1() {
		return checker1;
	}

	public void setChecker1(Integer checker1) {
		this.checker1 = checker1;
	}

	public Integer getChecker2() {
		return checker2;
	}

	public void setChecker2(Integer checker2) {
		this.checker2 = checker2;
	}

	public Integer getChecker3() {
		return checker3;
	}

	public void setChecker3(Integer checker3) {
		this.checker3 = checker3;
	}

	public Integer getChecker4() {
		return checker4;
	}

	public void setChecker4(Integer checker4) {
		this.checker4 = checker4;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getCheckerTime() {
		return checkerTime;
	}

	public void setCheckerTime(String checkerTime) {
		this.checkerTime = checkerTime;
	}

	public Integer getNoAuthPending() {
		return noAuthPending;
	}

	public void setNoAuthPending(Integer noAuthPending) {
		this.noAuthPending = noAuthPending;
	}

	public Integer getNoAuthOver() {
		return noAuthOver;
	}

	public void setNoAuthOver(Integer noAuthOver) {
		this.noAuthOver = noAuthOver;
	}

	public String getPostFlag() {
		return postFlag;
	}

	public void setPostFlag(String postFlag) {
		this.postFlag = postFlag;
	}

	public String getAuthFlag() {
		return authFlag;
	}

	public void setAuthFlag(String authFlag) {
		this.authFlag = authFlag;
	}

	public String getFundEffFlag() {
		return fundEffFlag;
	}

	public void setFundEffFlag(String fundEffFlag) {
		this.fundEffFlag = fundEffFlag;
	}

	public String getCanceledFlag() {
		return canceledFlag;
	}

	public void setCanceledFlag(String canceledFlag) {
		this.canceledFlag = canceledFlag;
	}

	public Integer getPostAuthFeffCncl() {
		return postAuthFeffCncl;
	}

	public void setPostAuthFeffCncl(Integer postAuthFeffCncl) {
		this.postAuthFeffCncl = postAuthFeffCncl;
	}

	public Integer getUpdtChkId() {
		return updtChkId;
	}

	public void setUpdtChkId(Integer updtChkId) {
		this.updtChkId = updtChkId;
	}

	public Double getPartClearAmt() {
		return partClearAmt;
	}

	public void setPartClearAmt(Double partClearAmt) {
		this.partClearAmt = partClearAmt;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public Long getSetNo() {
		return setNo;
	}

	public void setSetNo(Long setNo) {
		this.setNo = setNo;
	}

	public Long getScrollNo() {
		return scrollNo;
	}

	public void setScrollNo(Long scrollNo) {
		this.scrollNo = scrollNo;
	}
	
	public static List<String> getAttrNames(){
		Field fields[] = VoucherMst.class.getDeclaredFields();
		List<String> fieldNames = new ArrayList<String>();
		for(Field field : fields){
			String name = field.getName();
			fieldNames.add(name);
		}
		return fieldNames;
	}
	
}
