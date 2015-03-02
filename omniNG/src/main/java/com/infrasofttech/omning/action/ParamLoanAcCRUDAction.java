package com.infrasofttech.omning.action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.BatchMst;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.BatchMstService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ParamsLoanService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParamLoanAcCRUDAction extends ActionSupport implements
		ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamLoanAcCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	@SuppressWarnings("unused")
	private String branchCode = "";
	@SuppressWarnings("unused")
	private String loginId = "";
	private String languageCode = "en";
	@SuppressWarnings("unused")
	private String errMsg = "";
	private Date effFromDate;
	List<ParamLoanAc> codes = new ArrayList<ParamLoanAc>();
	ParamLoanAc paramLoanAc = new ParamLoanAc();
	// Declare lookup MAPS...
	Map<String, String> interestApplicationFrequency = new HashMap<String, String>();
	Map<String, String> productCalculationType = new HashMap<String, String>();
	Map<String, String> roundOff = new HashMap<String, String>();
	Map<String, String> interestChargeType = new HashMap<String, String>();
	Map<String, String> loanType = new HashMap<String, String>();
	Map<String, String> holiDayPeriod = new HashMap<String, String>();
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> batches = new HashMap<String, String>();
	Map<String, String> branchCodes = new HashMap<String, String>();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("ParamLanAcCRUDAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				String mode = request.getParameter("mode");
				String productCode = request.getParameter("productCode");
				String moduleCode = request.getParameter("moduleCode");
				String branchCode1 = request.getParameter("branchCode");
				String effectiveFrom=request.getParameter("effectiveFrom");
				if(!request.getParameter("effectiveFrom").isEmpty()
						&& request.getParameter("effectiveFrom") != null
						&& request.getParameter("effectiveFrom") != ""){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String effectiveFrom1 = (String) request
							.getParameter("effectiveFrom");
					
					// String fromDate = (String) request.getParameter("fromDate");

					try {

						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effectiveFrom1);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						effFromDate=(Date) dateFormat.parse(fromdate1);
						System.out.println("effFromDate"+effFromDate);
						//effFromDate = dateFormat.parse(fromdate1);

					} catch (Exception e) {
						logger.error("Exception in Effect From Date convertion......");
						System.out.println(e.getMessage());
					}

				}
				else if(null==effectiveFrom||effectiveFrom.equalsIgnoreCase("-1")){
					effFromDate =  new Date();
				}
				request.setAttribute("mode", mode);
				setLookupValues();
				ParamLoanAc paramLoanAc = new ParamLoanAc();
				ParamsLoanService paramsLoanService = (ParamsLoanService) SpringUtil
						.getSpringUtil().getService("paramsLoanAcService");
				ParamLoanAc entity = paramsLoanService
						.getParamLoanByUniqueComposite(tenantId, moduleCode,
								productCode, branchCode1,effFromDate);
				if (null == entity) {
					paramLoanAc = new ParamLoanAc();

				} else { // UPDATE, DISABLE, ENABLE
					paramLoanAc = entity;
					System.out
							.println("SetNumber" + paramLoanAc.getSetNumber());
					codes = (List<ParamLoanAc>) paramsLoanService
							.getParamLoanMstBySetNo(paramLoanAc.getTenantId(),
									paramLoanAc.getModuleCode(),
									paramLoanAc.getProdCode(),
									paramLoanAc.getSetNumber());
					System.out.println("paramLoanAcs" + codes);

					
				}
				request.setAttribute("branchCodes", branchCodes);
				request.setAttribute("paramLoanAc", paramLoanAc);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	private void setLookupValues() {
		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");

		interestApplicationFrequency = obj.getLookupValues("INTERESTAPPFREQ",
				languageCode, tenantId);
		productCalculationType = obj.getLookupValues("PRODCALCTYPE",
				languageCode, tenantId);
		roundOff = obj
				.getLookupValues("ROUNDOFFOPTION", languageCode, tenantId);
		interestChargeType = obj.getLookupValues("INTERESTCHARGTYPE",
				languageCode, tenantId);
		loanType = obj.getLookupValues("LOANTYPE", languageCode, tenantId);
		holiDayPeriod = obj.getLookupValues("HOLIDAYPERIOD", languageCode,
				tenantId);

		BranchMstService branchMstService = (BranchMstService) SpringUtil
				.getSpringUtil().getService("branchMstService");
		@SuppressWarnings("unchecked")
		List<BranchMst> branchList = branchMstService.findAllByTenant(tenantId);
		for (BranchMst branchMst : branchList) {
			branches.put(branchMst.getBranchCode(), branchMst.getBranchName());
		}

		ProductMstService productMstService = (ProductMstService) SpringUtil
				.getSpringUtil().getService("productMstService");
		
		String moduleCode = "LOANS";
		List<ProductMst> productList = productMstService.getProductsByModule(
				tenantId, moduleCode);
		for (ProductMst productMst : productList) {
			products.put(productMst.getProductCode(),
					productMst.getProductName());
		}
		
		  BatchMstService batchMstService = (BatchMstService) SpringUtil.getSpringUtil().getService("batchMstService");
		  @SuppressWarnings("unchecked") List<BatchMst> batchList = batchMstService.findAllByTenant(tenantId); 
		  for (BatchMst batchMst :
		  batchList) {
		  batches.put(batchMst.getBatchCode(),batchMst.getBatchName()); }
		 

		request.setAttribute("interestApplicationFrequency",
				interestApplicationFrequency);
		request.setAttribute("productCalculationType", productCalculationType);
		request.setAttribute("roundOff", roundOff);
		request.setAttribute("interestChargeType", interestChargeType);
		request.setAttribute("loanType", loanType);
		request.setAttribute("holiDayPeriod", holiDayPeriod);
		request.setAttribute("branches", branches);
		request.setAttribute("products", products);
		request.setAttribute("batches", batches);

	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

	public List<ParamLoanAc> getCodes() {
		return codes;
	}

	public void setCodes(List<ParamLoanAc> codes) {
		this.codes = codes;
	}

}
