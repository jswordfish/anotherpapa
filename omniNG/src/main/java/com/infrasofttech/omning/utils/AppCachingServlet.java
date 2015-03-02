package com.infrasofttech.omning.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.MenuMstService;
import com.infrasofttech.utils.SetOfLookupCodeValue;
import com.infrasofttech.utils.SetOfRoleMenuz;

public class AppCachingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AppCachingServlet.class);
	public static String appPath;

	public static List<SetOfRoleMenuz> setOfRoleMenuz = new ArrayList<SetOfRoleMenuz>();
	public static List<SetOfLookupCodeValue> setOfLookupCodeValue = new ArrayList<SetOfLookupCodeValue>();

	public void init(ServletConfig config) throws ServletException {
		try{
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);	
			MenuMstService menuMstService = (MenuMstService)SpringUtil.getSpringUtil().getService("menuMstService");
			Map<String, Map<String, List<MenuMst>>>  mapper = menuMstService.setAppLevelRoleMenuz();
			
			config.getServletContext().setAttribute("menuCache", mapper);
			System.out.println("MAPPER SIZE::: " + mapper.size());
			
//			for (Map.Entry<String, List<MenuMst>>> entry : mapper.entrySet()) {
//				
//				System.out.println("Key : " + entry.getKey() + " Value : "
//					+ entry.getValue());
//			}
			
			
			// appPath = this.getClass().getClassLoader().getResource("").getPath();
		}catch(OmniNGException e){
			throw e;
		} catch (ClassNotFoundException e) {
			System.out.println(">>>>>>>>>>>>>>"+e.getMessage());
			System.out.println("--------------------------------------------");
			e.printStackTrace();
			System.out.println("--------------------------------------------");
			
		}
	}
}
