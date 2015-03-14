package com.infrasofttech.domain.entities.transaction.runtime;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.infrasofttech.domain.entities.Base;
import com.infrasofttech.domain.entities.VoucherMst;
//for loan balances
@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = 
{ "PrdAcctId"}))
@NamedQueries({
	@NamedQuery(name = "D030003.getUniqueD030003", query = "SELECT d FROM D009622 d "
			+ "WHERE d.PrdAcctId=:PrdAcctId ")
})
public class D030003 extends Base{

	Integer LBrCode;
	
	String PrdAcctId;
	
	Float InClrgFcy = 0.0f;
	
	Float UnClearFcy= 0.0f;
	
	Float MainBalFcy= 0.0f;
	
	Float IntPrvdFcy= 0.0f;
	
	Float IntPaidFcy= 0.0f;
	
	Float OthChgPrvdFcy= 0.0f;
	
	Float OthChgPaidFcy= 0.0f;
	
	Float PenalPrvdFcy= 0.0f;
	
	Float PenalPaidFcy= 0.0f;
	
	Float TaxPrvdFcy= 0.0f;
	
	Float TaxPaidFcy= 0.0f;
	
	Float DisbursedAmtFcy= 0.0f;
	
	Float MainBalLcy= 0.0f;
	
	Float IntLcy= 0.0f;
	
	Float OthChgLcy= 0.0f;
	
	Float PenalLcy= 0.0f;
	
	Float TaxLcy= 0.0f;
	
	Float DisbursedAmtLcy= 0.0f;
	
	Integer DbtrAddMk = 0;
	
	Integer DbtrAddMb = 0;
	
	Integer DbtrAddMs = 0;
	
	//datetime
	java.util.Date DbtrAddMd;
	
	//datetime
	java.util.Date DbtrAddMt;
	
	
	Integer DbtrAddCk = 0;
	
	Integer DbtrAddCb = 0;
	
	Integer DbtrAddCs = 0;
	
	
	//datetime
	java.util.Date DbtrAddCd;
	
	java.util.Date DbtrAddCt;
	
	Integer DbtrLupdMk = 0;
	
	Integer DbtrLupdMb = 0;
	
	Integer DbtrLupdMs = 0;
	
	java.util.Date DbtrLupdMd;
	
	java.util.Date DbtrLupdMt;
	
	Integer DbtrLupdCk = 0;
	
	Integer DbtrLupdCb = 0;
	
	Integer DbtrLupdCs = 0 ;
	
	java.util.Date DbtrLupdCd;
	
	java.util.Date DbtrLupdCt;
	
	Integer DbtrTAuthDone = 0;
	
	Integer DbtrRecStat = 0;
	
	Integer DbtrAuthDone = 0;
	
	Integer DbtrAuthNeeded = 0;
	
	Integer DbtrUpdtChkId = 0;
	
	Integer DbtrLHisTrnNo = 0;
	
	Float TotalCredit = 0.0f;
	
	Float ExcessCredit= 0.0f;
	
	Float Reserve2 = 0.0f;
	
	java.util.Date LastPaydate;
	
	java.util.Date LastAccrdate;

	public Integer getLBrCode() {
		return LBrCode;
	}

	public void setLBrCode(Integer lBrCode) {
		LBrCode = lBrCode;
	}

	public String getPrdAcctId() {
		return PrdAcctId;
	}

	public void setPrdAcctId(String prdAcctId) {
		PrdAcctId = prdAcctId;
	}

	public Float getInClrgFcy() {
		return InClrgFcy;
	}

	public void setInClrgFcy(Float inClrgFcy) {
		InClrgFcy = inClrgFcy;
	}

	public Float getUnClearFcy() {
		return UnClearFcy;
	}

	public void setUnClearFcy(Float unClearFcy) {
		UnClearFcy = unClearFcy;
	}

	public Float getMainBalFcy() {
		return MainBalFcy;
	}

	public void setMainBalFcy(Float mainBalFcy) {
		MainBalFcy = mainBalFcy;
	}

	public Float getIntPrvdFcy() {
		return IntPrvdFcy;
	}

	public void setIntPrvdFcy(Float intPrvdFcy) {
		IntPrvdFcy = intPrvdFcy;
	}

	public Float getIntPaidFcy() {
		return IntPaidFcy;
	}

	public void setIntPaidFcy(Float intPaidFcy) {
		IntPaidFcy = intPaidFcy;
	}

	public Float getOthChgPrvdFcy() {
		return OthChgPrvdFcy;
	}

	public void setOthChgPrvdFcy(Float othChgPrvdFcy) {
		OthChgPrvdFcy = othChgPrvdFcy;
	}

	public Float getOthChgPaidFcy() {
		return OthChgPaidFcy;
	}

	public void setOthChgPaidFcy(Float othChgPaidFcy) {
		OthChgPaidFcy = othChgPaidFcy;
	}

	public Float getPenalPrvdFcy() {
		return PenalPrvdFcy;
	}

	public void setPenalPrvdFcy(Float penalPrvdFcy) {
		PenalPrvdFcy = penalPrvdFcy;
	}

	public Float getPenalPaidFcy() {
		return PenalPaidFcy;
	}

	public void setPenalPaidFcy(Float penalPaidFcy) {
		PenalPaidFcy = penalPaidFcy;
	}

	public Float getTaxPrvdFcy() {
		return TaxPrvdFcy;
	}

	public void setTaxPrvdFcy(Float taxPrvdFcy) {
		TaxPrvdFcy = taxPrvdFcy;
	}

	public Float getTaxPaidFcy() {
		return TaxPaidFcy;
	}

	public void setTaxPaidFcy(Float taxPaidFcy) {
		TaxPaidFcy = taxPaidFcy;
	}

	public Float getDisbursedAmtFcy() {
		return DisbursedAmtFcy;
	}

	public void setDisbursedAmtFcy(Float disbursedAmtFcy) {
		DisbursedAmtFcy = disbursedAmtFcy;
	}

	public Float getMainBalLcy() {
		return MainBalLcy;
	}

	public void setMainBalLcy(Float mainBalLcy) {
		MainBalLcy = mainBalLcy;
	}

	public Float getIntLcy() {
		return IntLcy;
	}

	public void setIntLcy(Float intLcy) {
		IntLcy = intLcy;
	}

	public Float getOthChgLcy() {
		return OthChgLcy;
	}

	public void setOthChgLcy(Float othChgLcy) {
		OthChgLcy = othChgLcy;
	}

	public Float getPenalLcy() {
		return PenalLcy;
	}

	public void setPenalLcy(Float penalLcy) {
		PenalLcy = penalLcy;
	}

	public Float getTaxLcy() {
		return TaxLcy;
	}

	public void setTaxLcy(Float taxLcy) {
		TaxLcy = taxLcy;
	}

	public Float getDisbursedAmtLcy() {
		return DisbursedAmtLcy;
	}

	public void setDisbursedAmtLcy(Float disbursedAmtLcy) {
		DisbursedAmtLcy = disbursedAmtLcy;
	}

	public Integer getDbtrAddMk() {
		return DbtrAddMk;
	}

	public void setDbtrAddMk(Integer dbtrAddMk) {
		DbtrAddMk = dbtrAddMk;
	}

	public Integer getDbtrAddMb() {
		return DbtrAddMb;
	}

	public void setDbtrAddMb(Integer dbtrAddMb) {
		DbtrAddMb = dbtrAddMb;
	}

	public Integer getDbtrAddMs() {
		return DbtrAddMs;
	}

	public void setDbtrAddMs(Integer dbtrAddMs) {
		DbtrAddMs = dbtrAddMs;
	}

	public java.util.Date getDbtrAddMd() {
		return DbtrAddMd;
	}

	public void setDbtrAddMd(java.util.Date dbtrAddMd) {
		DbtrAddMd = dbtrAddMd;
	}

	public java.util.Date getDbtrAddMt() {
		return DbtrAddMt;
	}

	public void setDbtrAddMt(java.util.Date dbtrAddMt) {
		DbtrAddMt = dbtrAddMt;
	}

	public Integer getDbtrAddCk() {
		return DbtrAddCk;
	}

	public void setDbtrAddCk(Integer dbtrAddCk) {
		DbtrAddCk = dbtrAddCk;
	}

	public Integer getDbtrAddCb() {
		return DbtrAddCb;
	}

	public void setDbtrAddCb(Integer dbtrAddCb) {
		DbtrAddCb = dbtrAddCb;
	}

	public Integer getDbtrAddCs() {
		return DbtrAddCs;
	}

	public void setDbtrAddCs(Integer dbtrAddCs) {
		DbtrAddCs = dbtrAddCs;
	}

	public java.util.Date getDbtrAddCd() {
		return DbtrAddCd;
	}

	public void setDbtrAddCd(java.util.Date dbtrAddCd) {
		DbtrAddCd = dbtrAddCd;
	}

	public java.util.Date getDbtrAddCt() {
		return DbtrAddCt;
	}

	public void setDbtrAddCt(java.util.Date dbtrAddCt) {
		DbtrAddCt = dbtrAddCt;
	}

	public Integer getDbtrLupdMk() {
		return DbtrLupdMk;
	}

	public void setDbtrLupdMk(Integer dbtrLupdMk) {
		DbtrLupdMk = dbtrLupdMk;
	}

	public Integer getDbtrLupdMb() {
		return DbtrLupdMb;
	}

	public void setDbtrLupdMb(Integer dbtrLupdMb) {
		DbtrLupdMb = dbtrLupdMb;
	}

	public Integer getDbtrLupdMs() {
		return DbtrLupdMs;
	}

	public void setDbtrLupdMs(Integer dbtrLupdMs) {
		DbtrLupdMs = dbtrLupdMs;
	}

	public java.util.Date getDbtrLupdMd() {
		return DbtrLupdMd;
	}

	public void setDbtrLupdMd(java.util.Date dbtrLupdMd) {
		DbtrLupdMd = dbtrLupdMd;
	}

	public java.util.Date getDbtrLupdMt() {
		return DbtrLupdMt;
	}

	public void setDbtrLupdMt(java.util.Date dbtrLupdMt) {
		DbtrLupdMt = dbtrLupdMt;
	}

	public Integer getDbtrLupdCk() {
		return DbtrLupdCk;
	}

	public void setDbtrLupdCk(Integer dbtrLupdCk) {
		DbtrLupdCk = dbtrLupdCk;
	}

	public Integer getDbtrLupdCb() {
		return DbtrLupdCb;
	}

	public void setDbtrLupdCb(Integer dbtrLupdCb) {
		DbtrLupdCb = dbtrLupdCb;
	}

	public Integer getDbtrLupdCs() {
		return DbtrLupdCs;
	}

	public void setDbtrLupdCs(Integer dbtrLupdCs) {
		DbtrLupdCs = dbtrLupdCs;
	}

	public java.util.Date getDbtrLupdCd() {
		return DbtrLupdCd;
	}

	public void setDbtrLupdCd(java.util.Date dbtrLupdCd) {
		DbtrLupdCd = dbtrLupdCd;
	}

	public java.util.Date getDbtrLupdCt() {
		return DbtrLupdCt;
	}

	public void setDbtrLupdCt(java.util.Date dbtrLupdCt) {
		DbtrLupdCt = dbtrLupdCt;
	}

	public Integer getDbtrTAuthDone() {
		return DbtrTAuthDone;
	}

	public void setDbtrTAuthDone(Integer dbtrTAuthDone) {
		DbtrTAuthDone = dbtrTAuthDone;
	}

	public Integer getDbtrRecStat() {
		return DbtrRecStat;
	}

	public void setDbtrRecStat(Integer dbtrRecStat) {
		DbtrRecStat = dbtrRecStat;
	}

	public Integer getDbtrAuthDone() {
		return DbtrAuthDone;
	}

	public void setDbtrAuthDone(Integer dbtrAuthDone) {
		DbtrAuthDone = dbtrAuthDone;
	}

	public Integer getDbtrAuthNeeded() {
		return DbtrAuthNeeded;
	}

	public void setDbtrAuthNeeded(Integer dbtrAuthNeeded) {
		DbtrAuthNeeded = dbtrAuthNeeded;
	}

	public Integer getDbtrUpdtChkId() {
		return DbtrUpdtChkId;
	}

	public void setDbtrUpdtChkId(Integer dbtrUpdtChkId) {
		DbtrUpdtChkId = dbtrUpdtChkId;
	}

	public Integer getDbtrLHisTrnNo() {
		return DbtrLHisTrnNo;
	}

	public void setDbtrLHisTrnNo(Integer dbtrLHisTrnNo) {
		DbtrLHisTrnNo = dbtrLHisTrnNo;
	}

	public Float getTotalCredit() {
		return TotalCredit;
	}

	public void setTotalCredit(Float totalCredit) {
		TotalCredit = totalCredit;
	}

	public Float getExcessCredit() {
		return ExcessCredit;
	}

	public void setExcessCredit(Float excessCredit) {
		ExcessCredit = excessCredit;
	}

	public Float getReserve2() {
		return Reserve2;
	}

	public void setReserve2(Float reserve2) {
		Reserve2 = reserve2;
	}

	public java.util.Date getLastPaydate() {
		return LastPaydate;
	}

	public void setLastPaydate(java.util.Date lastPaydate) {
		LastPaydate = lastPaydate;
	}

	public java.util.Date getLastAccrdate() {
		return LastAccrdate;
	}

	public void setLastAccrdate(java.util.Date lastAccrdate) {
		LastAccrdate = lastAccrdate;
	}
	
	public static List<String> getAttrNames(){
		Field fields[] = D030003.class.getDeclaredFields();
		List<String> fieldNames = new ArrayList<String>();
		for(Field field : fields){
			String name = field.getName();
			fieldNames.add(name);
		}
		return fieldNames;
	}
	
	
}
