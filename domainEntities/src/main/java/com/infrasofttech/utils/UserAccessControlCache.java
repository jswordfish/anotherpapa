package com.infrasofttech.utils;

import java.util.HashMap;
import java.util.Map;

public class UserAccessControlCache {

	// TODO To be called from web.xml
	public static Map<UserBranch, UserBranchAccessRights> mapUserAccessControls = new HashMap<UserBranch, UserBranchAccessRights>();

	private UserAccessControlCache(){
	
	}
	
	//TODO initialize the map
	public static Map<UserBranch, UserBranchAccessRights> fillUserAccessControlCache(){
		
		
		
		
		return mapUserAccessControls;
		
	}
}
