package com.infrasofttech.domain.entities.transaction.runtime;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.infrasofttech.domain.entities.Base;
import com.infrasofttech.domain.entities.transaction.ScreenDataType;
import com.infrasofttech.domain.entities.transaction.ScreenElement;

@Entity
public class ScreenElementTransaction extends Base{
	
	@ManyToOne(optional=false)
	@JoinColumn(name = "screenElementId")
	private ScreenElement screenElement;
	
	private String productAccountNumber;
	
	private String activityCode;
	
	private String transactionId;
	
	private Long screenId;
	
	
	private Long longValue;
	
	private BigDecimal decimalValue;
	
	@Column(length = 500, nullable = true)
	private String textValue;
	
	@Lob
	private byte[] attachmentValue;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=true)
	private Date dateValue;
	
	
	ScreenDataType screenDataType = ScreenDataType.String;


	public String getProductAccountNumber() {
		return productAccountNumber;
	}


	public void setProductAccountNumber(String productAccountNumber) {
		this.productAccountNumber = productAccountNumber;
	}


	public String getActivityCode() {
		return activityCode;
	}


	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}


	public String getTransactionId() {
		return transactionId;
	}


	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}


	public Long getScreenId() {
		return screenId;
	}


	public void setScreenId(Long screenId) {
		this.screenId = screenId;
	}


	public Long getLongValue() {
		return longValue;
	}


	public void setLongValue(Long longValue) {
		this.longValue = longValue;
	}


	public BigDecimal getDecimalValue() {
		return decimalValue;
	}


	public void setDecimalValue(BigDecimal decimalValue) {
		this.decimalValue = decimalValue;
	}


	public String getTextValue() {
		return textValue;
	}


	public void setTextValue(String textValue) {
		this.textValue = textValue;
	}


	public byte[] getAttachmentValue() {
		return attachmentValue;
	}


	public void setAttachmentValue(byte[] attachmentValue) {
		this.attachmentValue = attachmentValue;
	}


	public Date getDateValue() {
		return dateValue;
	}


	public void setDateValue(Date dateValue) {
		this.dateValue = dateValue;
	}


	public ScreenDataType getScreenDataType() {
		return screenDataType;
	}


	public void setScreenDataType(ScreenDataType screenDataType) {
		this.screenDataType = screenDataType;
	}


	public ScreenElement getScreenElement() {
		return screenElement;
	}


	public void setScreenElement(ScreenElement screenElement) {
		this.screenElement = screenElement;
	}
	
	
	

}
