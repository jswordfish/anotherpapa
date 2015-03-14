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
//for savings balances
@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = 
{ "PrdAcctId"}))
@NamedQueries({
	@NamedQuery(name = "D009622.getUniqueD009622", query = "SELECT d FROM D009622 d "
			+ "WHERE d.PrdAcctId=:PrdAcctId ")
})
public class D009622 extends Base{
	
	public Integer LBrCode = 0;
	
	public String PrdAcctId = "";
	
	public String CurCd = "";
	
	public Float ShdClrBalFcy= 0.0f;
	
	public Float ShdTotBalFcy= 0.0f;
	
	public Float ActClrBalFcy= 0.0f;
	
	public Float InClearBalFcy= 0.0f;
	
	public Float UnClearBalFcy= 0.0f;

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
	
	
	public static List<String> getAttrNames(){
		Field fields[] = D009622.class.getDeclaredFields();
		List<String> fieldNames = new ArrayList<String>();
		for(Field field : fields){
			String name = field.getName();
			fieldNames.add(name);
		}
		return fieldNames;
	}
	

}
