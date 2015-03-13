package com.infrasofttech.domain.entities.transaction.runtime;

import javax.persistence.Entity;

import com.infrasofttech.domain.entities.Base;
//for savings balances
@Entity
public class D009622 extends Base{
	
	private Integer LBrCode;
	
	private String PrdAcctId;
	
	private String CurCd;
	
	private Float ShdClrBalFcy;
	
	private Float ShdTotBalFcy;
	
	private Float ActClrBalFcy;
	
	private Float InClearBalFcy;
	
	private Float UnClearBalFcy;

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

	public String getCurCd() {
		return CurCd;
	}

	public void setCurCd(String curCd) {
		CurCd = curCd;
	}

	public Float getShdClrBalFcy() {
		return ShdClrBalFcy;
	}

	public void setShdClrBalFcy(Float shdClrBalFcy) {
		ShdClrBalFcy = shdClrBalFcy;
	}

	public Float getShdTotBalFcy() {
		return ShdTotBalFcy;
	}

	public void setShdTotBalFcy(Float shdTotBalFcy) {
		ShdTotBalFcy = shdTotBalFcy;
	}

	public Float getActClrBalFcy() {
		return ActClrBalFcy;
	}

	public void setActClrBalFcy(Float actClrBalFcy) {
		ActClrBalFcy = actClrBalFcy;
	}

	public Float getInClearBalFcy() {
		return InClearBalFcy;
	}

	public void setInClearBalFcy(Float inClearBalFcy) {
		InClearBalFcy = inClearBalFcy;
	}

	public Float getUnClearBalFcy() {
		return UnClearBalFcy;
	}

	public void setUnClearBalFcy(Float unClearBalFcy) {
		UnClearBalFcy = unClearBalFcy;
	}
	
	
	
	

}
