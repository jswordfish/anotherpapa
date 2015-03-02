package com.infrasofttech.omning.action;

import java.io.File;
import java.io.FileInputStream;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerMst;

import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.utils.SpringUtil;

import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.commons.io.FileUtils;

public class CustomerSignPhotoSaveAction extends ActionSupport implements
/* ModelDriven<BranchMst>, */ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(CustomerSignPhotoSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "en";
	private String errMsg = "";
	CustomerMst customerMst = new CustomerMst();
	private HttpServletRequest servletRequest;
	private File userImage;
	private String userImageContentType;
	private String userImageFileName ;

	public String execute() throws Exception {
		try {
			String filePath = servletRequest.getSession().getServletContext()
					.getRealPath("/");
			System.out.println("Server path:" + filePath);
			String customerCode = request.getParameter("customerCode");
			File fileToCreate = new File(filePath, this.userImageFileName);
			FileUtils.copyFile(this.userImage, fileToCreate);
			byte[] bFile = new byte[(int) fileToCreate.length()];
			try {

				FileInputStream fileInputStream = new FileInputStream(
						fileToCreate);

				fileInputStream.read(bFile);

				fileInputStream.close();
				
				for (int i = 0; i < bFile.length; i++) {
			       	System.out.print((char)bFile[i]);
		            }

			} catch (Exception e) {

				e.printStackTrace();

			}
			customerMst.setSignature(bFile);
			customerMst.setCustomerCode(customerCode);
			CustomerService customerService = (CustomerService) SpringUtil
					.getSpringUtil().getService("customerService");
			customerService.saveOrUpdate(customerMst);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());

			return INPUT;
		}
		return SUCCESS;

	}

	public File getUserImage() {
		return userImage;
	}

	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}

	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}
}
