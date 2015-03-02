package com.infrasofttech.domain.entities;

import javax.persistence.Entity;

@Entity
public class VoucherTypeMst extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	private String voucherTypeCode = "";

	private String voucherTypeName = "";

	public String getVoucherTypeCode() {
		return voucherTypeCode;
	}

	public void setVoucherTypeCode(String voucherTypeCode) {
		this.voucherTypeCode = voucherTypeCode;
	}

	public String getVoucherTypeName() {
		return voucherTypeName;
	}

	public void setVoucherTypeName(String voucherTypeName) {
		this.voucherTypeName = voucherTypeName;
	}

}
