package com.infrasofttech.omning.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.PrdAcNoConfigService;
import com.infrasofttech.omning.services.PrdAcNoMstService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrdAcNoSaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(BranchListAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String branchCode="";
	private String loginId="";
	private String languageCode="";
	private String errMsg = "";
	private String mode="";
	PrdAcNoMst prdAcNo = new PrdAcNoMst();
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
				mode = (String)request.getParameter("mode");
				
				System.out.println("Saving in "+mode+" mode.");
				// Action logic here...
				prdAcNo = (PrdAcNoMst)request.getAttribute("prdAcNo");
				
				prdAcNo = setValuesToPrdAcNoMst(prdAcNo);
				
				prdAcNo.setTenantId(tenantId);
				 PrdAcNoMstService prdAcNoMstService = (PrdAcNoMstService) SpringUtil.getSpringUtil().getService("prdAcNoMstService");
				if(mode.equalsIgnoreCase("CREATE"))
				{
					System.out.println("CREATE MODE  ACNO GENERATE");
				PrdAcNumberConfig prdAcNumberConfig=new PrdAcNumberConfig();
				// added for accountnumber gen to get config object
				PrdAcNoConfigService prdAcNoConfigService = (PrdAcNoConfigService) SpringUtil.getSpringUtil().getService("prdAcNoConfigService");
				
				 prdAcNumberConfig=	prdAcNoConfigService.getPrdAcNumberConfigByUniqueComposite(tenantId, prdAcNo.getModuleCode(), prdAcNo.getProductCode());
				 
	
			  //passing prdacnomst object and prdacconfig onj to compare and generate a/c number
				 prdAcNo =prdAcNoMstService.accountNumberGen(prdAcNo ,prdAcNumberConfig);
				System.out.println("accountNumber from action"+prdAcNo.getAccountNumber());
				}
				prdAcNoMstService.saveOrUpdate(prdAcNo);
				
				retVal = OmniConstants.SUCCESS;
			}  // END OF ELSE :: SESSION NOT EXPIRE
		}catch(Exception e){
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		}finally{
			
		}
		return retVal;
	}

	private PrdAcNoMst setValuesToPrdAcNoMst(PrdAcNoMst prdAcNo){
		try{
			prdAcNo.setAccountNumber(request.getParameter("accountNumber"));
			prdAcNo.setBranchCode(request.getParameter("branchCode"));
			prdAcNo.setCustomerNumber(request.getParameter("customerNumber"));
			prdAcNo.setCustomerName(request.getParameter("customerName"));
			prdAcNo.setModuleCode(request.getParameter("moduleCode"));
			prdAcNo.setProductCode(request.getParameter("productCode"));
		    prdAcNo.setCurrencyCode(request.getParameter("currencyCode"));			
			prdAcNo.setAccountType(request.getParameter("acType"));
			prdAcNo.setModeOfOperation(request.getParameter("modeOfOprn"));
			prdAcNo.setAccountStatus(request.getParameter("acStatus"));
			prdAcNo.setMinorType(request.getParameter("minorType"));
			prdAcNo.setDocumentFileNumber(request.getParameter("docFileNo"));
			prdAcNo.setFreezeType(request.getParameter("freezeType"));
			prdAcNo.setReason(request.getParameter("reason"));
			prdAcNo.setMemberNumber(request.getParameter("memberNo"));
			prdAcNo.setMemberType(request.getParameter("memberType"));
			prdAcNo.setAdditionalInformation1(request.getParameter("additionalInfo1"));
			prdAcNo.setAdditionalInformation2(request.getParameter("additionalInfo2"));
			prdAcNo.setHolder1Name(request.getParameter("holder1Name"));
			prdAcNo.setHolder1Gender(request.getParameter("genderHolder1"));
			prdAcNo.setHolder2Name(request.getParameter("holder2Name"));
			prdAcNo.setHolder2Gender(request.getParameter("genderHolder2"));
			prdAcNo.setHolder3Name(request.getParameter("holder3Name"));
			prdAcNo.setHolder3Gender(request.getParameter("genderHolder3"));
			prdAcNo.setNominee1Name(request.getParameter("nominee1Name"));
			prdAcNo.setNominee1Gender(request.getParameter("genderNominee1"));
			prdAcNo.setNominee2Name(request.getParameter("nominee2Name"));
			prdAcNo.setNominee2Gender(request.getParameter("genderNominee2"));
			prdAcNo.setNominee3Name(request.getParameter("nominee3Name"));
			prdAcNo.setNominee3Gender(request.getParameter("genderNominee3"));
						
			//DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if(mode.equalsIgnoreCase("CREATE")){
				prdAcNo.setCreatedDate(createdDate);
				prdAcNo.setCreatedBy(loginId);
				Integer random = (int)Math.round(Math.random() * 100000000);
				prdAcNo.setAccountNumber(random.toString());   //TODO read from PrdAcNoConfig
			}else{
				prdAcNo.setLastModifiedDate(lastModifiedDate);	
				prdAcNo.setLastModifiedBy(loginId);
			}
			prdAcNo.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return prdAcNo;
		}catch(OmniNGException e){
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return prdAcNo;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public PrdAcNoMst getPrdAcNo() {
		return prdAcNo;
	}

	public void setPrdAcNo(PrdAcNoMst prdAcNo) {
		this.prdAcNo = prdAcNo;
	}

}
