package com.infrasofttech.domain.entities.transaction;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.infrasofttech.domain.entities.Base;

@Entity
public class ScreenRow extends Base{
	
	@ManyToMany
    @JoinTable(name="ScreenRow_Element",
        joinColumns=
            @JoinColumn(name="row_ID", referencedColumnName="id"),
        inverseJoinColumns=
            @JoinColumn(name="ele_ID", referencedColumnName="id")
        )
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<ScreenElement> screenElements = new ArrayList<ScreenElement>();
	
	@Transient
	Integer rownum = 0;

	public List<ScreenElement> getScreenElements() {
		return screenElements;
	}

	public void setScreenElements(List<ScreenElement> screenElements) {
		this.screenElements = screenElements;
	}

	public Integer getRownum() {
		return rownum;
	}

	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}
	
	

}
