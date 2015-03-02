package com.infrasofttech.domain.entities.transaction.runtime;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.infrasofttech.domain.entities.Base;
import com.infrasofttech.domain.entities.transaction.Screen;
@Entity
public class ScreenTransaction extends Base{
	
	@ManyToOne(optional=false)
	@JoinColumn(name = "screenId")
	private Screen screen;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<ScreenRowTransaction>  rowTransactions = new ArrayList<ScreenRowTransaction>();

	public List<ScreenRowTransaction> getRowTransactions() {
		return rowTransactions;
	}

	public void setRowTransactions(List<ScreenRowTransaction> rowTransactions) {
		this.rowTransactions = rowTransactions;
	}

	public Screen getScreen() {
		return screen;
	}

	public void setScreen(Screen screen) {
		this.screen = screen;
	}
	
	
	
}
