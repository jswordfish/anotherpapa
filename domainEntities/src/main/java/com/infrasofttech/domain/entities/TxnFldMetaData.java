package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class TxnFldMetaData extends Base {

	private static final long serialVersionUID = 1701926931204630606L;

	@Column(length = 20, nullable = true)
	private String moduleCode = "";

	@Column(length = 20, nullable = true)
	private String dataFldCode = "";

	@Column(length = 20, nullable = true)
	private String dataFldName = "";

	@Column(length = 20, nullable = true)
	private String dataFldType = "";

	@Column(length = 20, nullable = true)
	private String dataFldSize = "";

	@Column
	private Boolean isActive = true;

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	public String getDataFldCode() {
		return dataFldCode;
	}

	public void setDataFldCode(String dataFldCode) {
		this.dataFldCode = dataFldCode;
	}

	public String getDataFldName() {
		return dataFldName;
	}

	public void setDataFldName(String dataFldName) {
		this.dataFldName = dataFldName;
	}

	public String getDataFldType() {
		return dataFldType;
	}

	public void setDataFldType(String dataFldType) {
		this.dataFldType = dataFldType;
	}

	public String getDataFldSize() {
		return dataFldSize;
	}

	public void setDataFldSize(String dataFldSize) {
		this.dataFldSize = dataFldSize;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
