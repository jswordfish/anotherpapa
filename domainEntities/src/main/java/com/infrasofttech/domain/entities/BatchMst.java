package com.infrasofttech.domain.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BatchMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fkBranchMstPk")
	private BranchMst branchMst;

	@Column(nullable = true, length = 30)
	private String batchCode = "";

	@Column(nullable = true, length = 30)
	private String batchTypeCode = ""; // from Lookup

	@Column(nullable = true, length = 50)
	private String batchName = "";

	@Column(nullable = true)
	private String procStage1Dr = "";

	@Column(nullable = true)
	private String balUdtTyp1Dr = "";

	@Column(nullable = true)
	private String procStage2Dr = "";

	@Column(nullable = true)
	private String balUdtTyp2Dr = "";

	@Column(nullable = true)
	private String procStage3Dr = "";

	@Column(nullable = true)
	private String balUdtTyp3Dr = "";

	@Column(nullable = true)
	private String procStage4Dr = "";

	@Column(nullable = true)
	private String balUdtTyp4Dr = "";

	@Column(nullable = true)
	private String cancelUpToDr = "";

	@Column(nullable = true)
	private String procStage1Cr = "";

	@Column(nullable = true)
	private String balUdtTyp1Cr = "";

	@Column(nullable = true)
	private String procStage2Cr = "";

	@Column(nullable = true)
	private String balUdtTyp2Cr = "";

	@Column(nullable = true)
	private String procStage3Cr = "";

	@Column(nullable = true)
	private String balUdtTyp3Cr = "";

	@Column(nullable = true)
	private String procStage4Cr = "";

	@Column(nullable = true)
	private String balUdtTyp4Cr = "";

	@Column(nullable = true)
	private String cancelUpToCr = "";

	@Column(nullable = true)
	private String bookType = "";

	@Column(nullable = true)
	private Boolean defOpenYN = false;

	@Column(nullable = true)
	private Integer defPostDays = 0;

	@Column(nullable = true)
	private Integer defFeffDays = 0;

	@Column(nullable = true)
	private String drCrVcPerm = "";

	@Column(nullable = true)
	private Double maxDrAmt = 0D;

	@Column(nullable = true)
	private Double maxCrAmt = 0D;

	@Column(nullable = true)
	private String defDesc="";

	@Column(nullable = true)
	private Integer vcEntryMgr = 0;

	@Column(nullable = true)
	private Integer status = 0; // reference from DB??

	@Column(nullable = true)
	private Integer opClDay1 = 0;

	@Column(nullable = true)
	private Integer opClDay2 = 0;

	@Column(nullable = true)
	private Integer opClDay3 = 0;

	@Column(nullable = true)
	private String tallyType = "";

	@Column(nullable = true)
	private Boolean tellerBatchYN = false;

	@Column(nullable = true)
	private Integer onOffBatch = 0;

	@Column(nullable = true)
	private Boolean isActive = true;

	public BranchMst getBranchMst() {
		return branchMst;
	}

	public void setBranchMst(BranchMst branchMst) {
		this.branchMst = branchMst;
	}

	public String getBatchCode() {
		return batchCode;
	}

	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}

	public String getBatchTypeCode() {
		return batchTypeCode;
	}

	public void setBatchTypeCode(String batchTypeCode) {
		this.batchTypeCode = batchTypeCode;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getProcStage1Dr() {
		return procStage1Dr;
	}

	public void setProcStage1Dr(String procStage1Dr) {
		this.procStage1Dr = procStage1Dr;
	}

	public String getBalUdtTyp1Dr() {
		return balUdtTyp1Dr;
	}

	public void setBalUdtTyp1Dr(String balUdtTyp1Dr) {
		this.balUdtTyp1Dr = balUdtTyp1Dr;
	}

	public String getProcStage2Dr() {
		return procStage2Dr;
	}

	public void setProcStage2Dr(String procStage2Dr) {
		this.procStage2Dr = procStage2Dr;
	}

	public String getBalUdtTyp2Dr() {
		return balUdtTyp2Dr;
	}

	public void setBalUdtTyp2Dr(String balUdtTyp2Dr) {
		this.balUdtTyp2Dr = balUdtTyp2Dr;
	}

	public String getProcStage3Dr() {
		return procStage3Dr;
	}

	public void setProcStage3Dr(String procStage3Dr) {
		this.procStage3Dr = procStage3Dr;
	}

	public String getBalUdtTyp3Dr() {
		return balUdtTyp3Dr;
	}

	public void setBalUdtTyp3Dr(String balUdtTyp3Dr) {
		this.balUdtTyp3Dr = balUdtTyp3Dr;
	}

	public String getProcStage4Dr() {
		return procStage4Dr;
	}

	public void setProcStage4Dr(String procStage4Dr) {
		this.procStage4Dr = procStage4Dr;
	}

	public String getBalUdtTyp4Dr() {
		return balUdtTyp4Dr;
	}

	public void setBalUdtTyp4Dr(String balUdtTyp4Dr) {
		this.balUdtTyp4Dr = balUdtTyp4Dr;
	}

	public String getCancelUpToDr() {
		return cancelUpToDr;
	}

	public void setCancelUpToDr(String cancelUpToDr) {
		this.cancelUpToDr = cancelUpToDr;
	}

	public String getProcStage1Cr() {
		return procStage1Cr;
	}

	public void setProcStage1Cr(String procStage1Cr) {
		this.procStage1Cr = procStage1Cr;
	}

	public String getBalUdtTyp1Cr() {
		return balUdtTyp1Cr;
	}

	public void setBalUdtTyp1Cr(String balUdtTyp1Cr) {
		this.balUdtTyp1Cr = balUdtTyp1Cr;
	}

	public String getProcStage2Cr() {
		return procStage2Cr;
	}

	public void setProcStage2Cr(String procStage2Cr) {
		this.procStage2Cr = procStage2Cr;
	}

	public String getBalUdtTyp2Cr() {
		return balUdtTyp2Cr;
	}

	public void setBalUdtTyp2Cr(String balUdtTyp2Cr) {
		this.balUdtTyp2Cr = balUdtTyp2Cr;
	}

	public String getProcStage3Cr() {
		return procStage3Cr;
	}

	public void setProcStage3Cr(String procStage3Cr) {
		this.procStage3Cr = procStage3Cr;
	}

	public String getBalUdtTyp3Cr() {
		return balUdtTyp3Cr;
	}

	public void setBalUdtTyp3Cr(String balUdtTyp3Cr) {
		this.balUdtTyp3Cr = balUdtTyp3Cr;
	}

	public String getProcStage4Cr() {
		return procStage4Cr;
	}

	public void setProcStage4Cr(String procStage4Cr) {
		this.procStage4Cr = procStage4Cr;
	}

	public String getBalUdtTyp4Cr() {
		return balUdtTyp4Cr;
	}

	public void setBalUdtTyp4Cr(String balUdtTyp4Cr) {
		this.balUdtTyp4Cr = balUdtTyp4Cr;
	}

	public String getCancelUpToCr() {
		return cancelUpToCr;
	}

	public void setCancelUpToCr(String cancelUpToCr) {
		this.cancelUpToCr = cancelUpToCr;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public Boolean getDefOpenYN() {
		return defOpenYN;
	}

	public void setDefOpenYN(Boolean defOpenYN) {
		this.defOpenYN = defOpenYN;
	}

	public Integer getDefPostDays() {
		return defPostDays;
	}

	public void setDefPostDays(Integer defPostDays) {
		this.defPostDays = defPostDays;
	}

	public Integer getDefFeffDays() {
		return defFeffDays;
	}

	public void setDefFeffDays(Integer defFeffDays) {
		this.defFeffDays = defFeffDays;
	}

	public String getDrCrVcPerm() {
		return drCrVcPerm;
	}

	public void setDrCrVcPerm(String drCrVcPerm) {
		this.drCrVcPerm = drCrVcPerm;
	}

	public Double getMaxDrAmt() {
		return maxDrAmt;
	}

	public void setMaxDrAmt(Double maxDrAmt) {
		this.maxDrAmt = maxDrAmt;
	}

	public Double getMaxCrAmt() {
		return maxCrAmt;
	}

	public void setMaxCrAmt(Double maxCrAmt) {
		this.maxCrAmt = maxCrAmt;
	}

	public String getDefDesc() {
		return defDesc;
	}

	public void setDefDesc(String defDesc) {
		this.defDesc = defDesc;
	}

	public Integer getVcEntryMgr() {
		return vcEntryMgr;
	}

	public void setVcEntryMgr(Integer vcEntryMgr) {
		this.vcEntryMgr = vcEntryMgr;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getOpClDay1() {
		return opClDay1;
	}

	public void setOpClDay1(Integer opClDay1) {
		this.opClDay1 = opClDay1;
	}

	public Integer getOpClDay2() {
		return opClDay2;
	}

	public void setOpClDay2(Integer opClDay2) {
		this.opClDay2 = opClDay2;
	}

	public Integer getOpClDay3() {
		return opClDay3;
	}

	public void setOpClDay3(Integer opClDay3) {
		this.opClDay3 = opClDay3;
	}

	public String getTallyType() {
		return tallyType;
	}

	public void setTallyType(String tallyType) {
		this.tallyType = tallyType;
	}

	public Boolean getTellerBatchYN() {
		return tellerBatchYN;
	}

	public void setTellerBatchYN(Boolean tellerBatchYN) {
		this.tellerBatchYN = tellerBatchYN;
	}

	public Integer getOnOffBatch() {
		return onOffBatch;
	}

	public void setOnOffBatch(Integer onOffBatch) {
		this.onOffBatch = onOffBatch;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	

}
