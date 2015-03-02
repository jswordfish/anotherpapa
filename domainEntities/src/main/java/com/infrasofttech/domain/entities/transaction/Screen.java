package com.infrasofttech.domain.entities.transaction;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.infrasofttech.domain.entities.Base;

@Entity
@NamedQueries({
	@NamedQuery(name = "Screen.getScreenByName", query = "SELECT s FROM Screen s WHERE s.screenName=:screenName "
			+ " AND s.tenantId=:tenantId AND s.active=:active")}
	)
public class Screen extends Base{
	@Column(length=200, unique=true)
	private String screenName;
	
	private Boolean active = true;
	
	@Enumerated(EnumType.STRING)
	private ScreenType  screenType = ScreenType.TRANSACTION;
	
	@OneToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<ScreenRow> rows = new ArrayList<ScreenRow>();

	public ScreenType getScreenType() {
		return screenType;
	}

	public void setScreenType(ScreenType screenType) {
		this.screenType = screenType;
	}

	public List<ScreenRow> getRows() {
		return rows;
	}

	public void setRows(List<ScreenRow> rows) {
		this.rows = rows;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	
	
	

}
