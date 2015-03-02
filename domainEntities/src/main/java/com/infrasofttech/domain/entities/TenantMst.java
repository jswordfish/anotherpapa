package com.infrasofttech.domain.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@NamedQueries({
		@NamedQuery(name = "TenantMst.getTenants", query = "SELECT t FROM TenantMst t "
				+ "WHERE t.isActive=TRUE"),
		@NamedQuery(name = "TenantMst.getTenantFromURL", query = "SELECT t FROM TenantMst t "
				+ "	WHERE t.tenantURL=:tenantURL AND t.isActive=TRUE"),
		@NamedQuery(name = "TenantMst.getTenantMst", query = "SELECT t FROM TenantMst t "
				+ "	WHERE t.isActive=TRUE AND t.tenantId=:tenantId")
})
public class TenantMst {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 20, nullable = true, unique = true)
	private String tenantId = "";

	@Column(length = 100, nullable = true, unique = true)
	private String tenantName = "";

	@Column(length = 20, nullable = true)
	private String tenantGrpCode = "";

	@Column(length = 20, nullable = true, unique = false)
	private String parentTenantCode = "";

	@ElementCollection
	@JoinTable(name = "TENANT_ADDRESS", joinColumns = @JoinColumn(name = "TENANT_ID"))
	@GenericGenerator(name = "hilo-gen", strategy = "hilo")
	@CollectionId(columns = { @Column(name = "Id") }, generator = "hilo-gen", type = @Type(type = "long"))
	private Collection<Address> tenantAddresses = new ArrayList<Address>();

	@Temporal(TemporalType.DATE)
	private Date estbDate;

	@Column(length = 256, nullable = true)
	private String tenantURL = "";

	@Column(nullable = true)
	private Boolean isActive = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getTenantName() {
		return tenantName;
	}

	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}

	public String getTenantGrpCode() {
		return tenantGrpCode;
	}

	public void setTenantGrpCode(String tenantGrpCode) {
		this.tenantGrpCode = tenantGrpCode;
	}

	public String getParentTenantCode() {
		return parentTenantCode;
	}

	public void setParentTenantCode(String parentTenantCode) {
		this.parentTenantCode = parentTenantCode;
	}

	public Collection<Address> getTenantAddresses() {
		return tenantAddresses;
	}

	public void setTenantAddresses(Collection<Address> tenantAddresses) {
		this.tenantAddresses = tenantAddresses;
	}

	public Date getEstbDate() {
		return estbDate;
	}

	public void setEstbDate(Date estbDate) {
		this.estbDate = estbDate;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getTenantURL() {
		return tenantURL;
	}

	public void setTenantURL(String tenantURL) {
		this.tenantURL = tenantURL;
	}

}
