/**
 * @author Mahesh Laddha
 *
 */
package com.infrasofttech.domain.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@NamedQueries({
	@NamedQuery(name = "TenantGrpMst.getTenantGrpMst", query = "SELECT t FROM TenantGrpMst t WHERE t.tenantGrpCode=:tenantGrpCode "
			+ "AND t.isActive=true"),
	@NamedQuery(name = "TenantGrpMst.getDisabledTenantGrpMst", query = "SELECT t FROM TenantGrpMst t WHERE t.tenantGrpCode=:tenantGrpCode AND"
					+ " t.isActive=false"),
	@NamedQuery(name = "TenantGrpMst.getTenantGrpMstWithoutFilter", query = "SELECT t FROM TenantGrpMst t WHERE t.isActive=true")
})
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "tenantGrpCode" }))
public class TenantGrpMst {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 20, nullable = true)
	private String tenantGrpCode = "";

	@Column(length = 200, nullable = true)
	private String tenantGrpName = "";

	// @OneToMany(mappedBy="tenantGrpMst")
	// private Collection<TenantMst> tenants = new ArrayList<TenantMst>();

	@Column(nullable = true)
	private Boolean isActive = true;

	public String getTenantGrpCode() {
		return tenantGrpCode;
	}

	public void setTenantGrpCode(String tenantGrpCode) {
		this.tenantGrpCode = tenantGrpCode;
	}

	public String getTenantGrpName() {
		return tenantGrpName;
	}

	public void setTenantGrpName(String tenantGrpName) {
		this.tenantGrpName = tenantGrpName;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
}
