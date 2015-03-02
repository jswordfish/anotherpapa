package com.infrasofttech.domain.entities.transaction.runtime;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.infrasofttech.domain.entities.Base;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
@Entity
public class ScreenRowTransaction extends Base{
	@ManyToOne(optional=false)
	@JoinColumn(name = "screenRowId")
	private ScreenRow screenRow;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<ScreenElementTransaction> elementTransactions = new ArrayList<ScreenElementTransaction>();

	public List<ScreenElementTransaction> getElementTransactions() {
		return elementTransactions;
	}

	public void setElementTransactions(
			List<ScreenElementTransaction> elementTransactions) {
		this.elementTransactions = elementTransactions;
	}

	public ScreenRow getScreenRow() {
		return screenRow;
	}

	public void setScreenRow(ScreenRow screenRow) {
		this.screenRow = screenRow;
	}

	
	
}
