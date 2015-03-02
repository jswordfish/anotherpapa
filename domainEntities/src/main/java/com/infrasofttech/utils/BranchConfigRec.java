package com.infrasofttech.utils;

import java.util.ArrayList;
import java.util.List;

import com.infrasofttech.domain.entities.AppConfig;

public class BranchConfigRec {

//	String branchCode;
	
	List<AppConfig> mapBrConfigRecs = new ArrayList<AppConfig>();



	public List<AppConfig> getMapBrConfigRecs() {
		return mapBrConfigRecs;
	}

	public void setMapBrConfigRecs(List<AppConfig> mapBrConfigRecs) {
		this.mapBrConfigRecs = mapBrConfigRecs;
	}

	
}
