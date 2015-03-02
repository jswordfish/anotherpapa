package com.infrasofttech.omning.action;

import java.text.DateFormat;
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
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.BatchMstService;
import com.infrasofttech.omning.services.BranchMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.services.ParamsCheckingAcService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParamCheckingCRUDAction extends ActionSupport implements
		/* ModelDriven<BranchMst>, */ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamCheckingCRUDAction.class);
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
	List<ParamCheckingAc> paramChkAcs = new ArrayList<ParamCheckingAc>();
	ParamCheckingAc paramCheckingAc = new ParamCheckingAc();

	// Declare lookup MAPS...
	Map<String, String> payReceiveMap = new HashMap<String, String>();
	Map<String, String> roundOffMap = new HashMap<String, String>();
	Map<String, String> intrCalBalMap = new HashMap<String, String>();
	Map<String, String> intAppFreqMap = new HashMap<String, String>();
	Map<String, String> disIntRateMap = new HashMap<String, String>();
	Map<String, String> prodCalcMap = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> batches = new HashMap<String, String>();
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> branchCodes = new HashMap<String, String>();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("ParamCheckingCRUDAction.execute() SESSION EXPIRED");
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
				String branch = request.getParameter("branchCode");
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

				paramCheckingAc = new ParamCheckingAc();
				ParamsCheckingAcService paramsCheckingAcService = (ParamsCheckingAcService) SpringUtil
						.getSpringUtil().getService("paramsCheckingAcService");

				ParamCheckingAc entity = paramsCheckingAcService
						.getParamCheckingAcByUniqueComposite(tenantId,
								moduleCode, productCode, branch,effFromDate);
				if (null == entity) {
					paramCheckingAc = new ParamCheckingAc();

					/*
					 * paramCheckingAc.setEffectiveFrom(new Date());
					 * paramCheckingAc.setEffectiveTill(new Date());
					 */
				} else { // UPDATE, DISABLE, ENABLE
					System.out.println("entity not null"
							+ paramCheckingAc.getBranchCode());

					paramCheckingAc = entity;
					paramChkAcs = paramsCheckingAcService
							.getParamCheckingAcBysetNO(
									paramCheckingAc.getTenantId(),
									paramCheckingAc.getModuleCode(),
									paramCheckingAc.getProdCode(),
									paramCheckingAc.getSetNumber());
					for (ParamCheckingAc paramCheckingAc : paramChkAcs) {
						branchCodes.put(paramCheckingAc.getBranchCode(),
								paramCheckingAc.getBranchCode());
					}
				}

				request.setAttribute("paramCheckingAc", paramCheckingAc);
				request.setAttribute("branchCodes", branchCodes);

				retVal = OmniConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	private void setLookupValues() {
		
		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");
		payReceiveMap = obj.getLookupValues("INTERESTPAY", languageCode,
				tenantId);
		roundOffMap = obj.getLookupValues("ROUNDOFFOPTION", languageCode,
				tenantId);
		intrCalBalMap = obj.getLookupValues("INTERESTCALCBALTYPE",
				languageCode, tenantId);
		intAppFreqMap = obj.getLookupValues("INTERESTAPPFREQ", languageCode,
				tenantId);
		disIntRateMap = obj.getLookupValues("DISCOUNTEDINTRATE", languageCode,
				tenantId);
		prodCalcMap = obj.getLookupValues("PRODCALCTYPE", languageCode,
				tenantId);
		// Load all modules of the tenant
		/*ModuleMstService moduleMstService = (ModuleMstService) SpringUtil
				.getSpringUtil().getService("moduleMstService");
		@SuppressWarnings("unchecked")
		List<ModuleMst> moduleList = moduleMstService.findAllByTenant(tenantId);
		for (ModuleMst moduleMst : moduleList) {
			modules.put(moduleMst.getModuleCode(), moduleMst.getModuleName());
		}*/
		ProductMstService productMstService = (ProductMstService) SpringUtil
				.getSpringUtil().getService("productMstService");
		@SuppressWarnings("unchecked")
		String moduleCode="SB";
		System.out.println("modulecode:"+moduleCode+"\t"+"tenantCode:"+tenantId);
		List<ProductMst> productList = productMstService.getProductsByModule(tenantId, moduleCode);
				
		for (ProductMst productMst : productList) {
			products.put(productMst.getProductCode(),
					productMst.getProductName());
		}
		
		 BatchMstService batchMstService=(BatchMstService)
		 SpringUtil.getSpringUtil().getService("batchMstService");
		 
		 @SuppressWarnings("unchecked") List<BatchMst> batchList =
		  batchMstService.findAllByTenant(tenantId); for(BatchMst batchMst :
		  batchList){
		  batches.put(batchMst.getBatchCode(),batchMst.getBatchName()); }
		 
		BranchMstService branchMstService = (BranchMstService) SpringUtil
				.getSpringUtil().getService("branchMstService");
		@SuppressWarnings("unchecked")
		List<BranchMst> branchList = branchMstService.findAllByTenant(tenantId);
		for (BranchMst branchMst : branchList) {
			branches.put(branchMst.getBranchCode(), branchMst.getBranchName());
		}
		request.setAttribute("payReceiveMap", payReceiveMap);
		request.setAttribute("roundOffMap", roundOffMap);
		request.setAttribute("intrCalBalMap", intrCalBalMap);
		request.setAttribute("intAppFreqMap", intAppFreqMap);
		request.setAttribute("modules", modules);
		request.setAttribute("products", products);
		request.setAttribute("disIntRateMap", disIntRateMap);
		request.setAttribute("prodCalcMap", prodCalcMap);
		request.setAttribute("batches", batches);
		request.setAttribute("branches", branches);

	}

	@SuppressWarnings("unused")
	private Map<String, String> getLookupValues(String code,
			String languageCode, String tenantId) {
		Map<String, String> keyVal = new HashMap<String, String>();
		// TODO Call LookupValue Service
		
		keyVal.put("CODE1", "VALUE 1");
		keyVal.put("CODE2", "VALUE 2");
		keyVal.put("CODE3", "VALUE 3");

		return keyVal;
	}

	public List<ParamCheckingAc> getParamChkAcs() {
		return paramChkAcs;
	}

	public void setParamChkAcs(List<ParamCheckingAc> paramChkAcs) {
		this.paramChkAcs = paramChkAcs;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
