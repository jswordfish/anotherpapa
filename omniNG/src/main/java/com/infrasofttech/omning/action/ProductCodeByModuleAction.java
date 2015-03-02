package com.infrasofttech.omning.action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

//import com.google.gson.Gson;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.opensymphony.xwork2.ActionSupport;



public class ProductCodeByModuleAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Map<String, String> moduleMap = new LinkedHashMap<String, String>();
	
	// Parameter from Jquery
	
	HttpSession session=null;
	
	List<ProductMst> products = new ArrayList<ProductMst>();
	

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		session=request.getSession();
		String tenantId=(String)session.getAttribute("tenantCode");
		String moduleCode=request.getParameter("moduleCode");
		ProductMstService productMstService=(ProductMstService) SpringUtil.getSpringUtil().getService("productMstService");
		products = productMstService.getProductsByModule(tenantId, moduleCode);
		
		for (int i = 0; i < products.size(); i++) {
			moduleMap.put(products.get(i).getProductCode(),  products.get(i).getProductName());
		}
	//	String json = new Gson().toJson(moduleMap);
		try {
		//	resp.getWriter().print(json);
		} catch (Exception e) {
		}
		//System.out.println("RESP--" + json);

		return null;
	}

	
	
}