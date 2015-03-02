package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.domain.entities.LoanInterestMst;
import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.LoanInterestMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoanInterestMstViewAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(LoanInterestMstViewAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "";
	private String errMsg = "";

	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> currencies = new HashMap<String, String>();

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		List<LoanInterestMst> loanInterestList = new ArrayList<LoanInterestMst>();
		LoanInterestMst loanInterestMst = new LoanInterestMst();
		String productCode = "";
		ProductMst productMst = new ProductMst();
		String currencyCode = "";
		CurrencyMst currencyMst = new CurrencyMst();
		products = new HashMap<String, String>();
		currencies = new HashMap<String, String>();
		loanInterestMst = new LoanInterestMst();
		Calendar cal = Calendar.getInstance();
		Date effFromDate = cal.getTime();
		Date effToDate = cal.getTime();
		Double fromAmount = 0d;
		Double toAmount = 0d;

		try {
			if (request.getSession(false) == null) {
				System.out.println("SESSION EXPIRED");
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
				languageCode = (String) session.getAttribute("languageCode");
				String mode = request.getParameter("mode");

				request.setAttribute("mode", mode);

				// Read values from JSP
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				if (!request.getParameter("effFromDate").isEmpty()
						&& request.getParameter("effFromDate") != null
						&& request.getParameter("effFromDate") != "") {
					try {
						String effFromStr = (String) request.getParameter("effFromDate");
						effFromDate = new SimpleDateFormat("yyyy-MM-dd").parse(effFromStr);
//						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
//						prdAcNumberConfig.setEffFromDate((Date) sd.parse(fromdate1));
					} catch (Exception e) {
						System.out.println("error while parsing fromDate " + e);
						logger.error("error while parsing fromDate", e);
						e.printStackTrace();
					}
				}

				String effToStr = (String) request.getParameter("effToDate");
				request.setAttribute("effToDate",  effToStr);
				
//				effToDate = new SimpleDateFormat("yyyy-MM-dd").parse(effToStr);
//						String toDate1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
//						prdAcNumberConfig.setEffTillDate((Date).parse(toDate1));
				
				LoanInterestMstService liMstService = (LoanInterestMstService)SpringUtil.getSpringUtil().getService("loanInterestMstService"); 
				loanInterestList = (List<LoanInterestMst>)liMstService.getLIMstByUniqueComposition(mode, productCode, currencyCode, effFromDate);
				request.setAttribute("effFromDate",effFromDate);
				effToDate = cal.getTime();
				
				// Set values in Request for JSP to read
				request.setAttribute("loanInterestList", loanInterestList );
				request.setAttribute("loanInterestMst", loanInterestMst);
				setLookupValues();

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

		// getLookupValues("GLCATEGORY",languageCode,tenantId);

		// Load all Currency of the tenant
		CurrencyMstService currencyMstService = (CurrencyMstService) SpringUtil
				.getSpringUtil().getService("currencyMstService");
		List<CurrencyMst> currencyList = currencyMstService.findAllByTenant(tenantId);
		if (currencies.size() > 0) {
			for (CurrencyMst currencyMst : currencyList) {
				currencies.put(currencyMst.getCurrencyISOCode(),
						currencyMst.getCurrencyName());
			}
		} else {
			System.out.println("currency list is less than 0");
		}

		// Load all products of the tenant
		String moduleCode = "20";
		ProductMstService productMstService = (ProductMstService) SpringUtil
				.getSpringUtil().getService("productMstService");
		List<ProductMst> productList = (List<ProductMst>) productMstService.getProductsByModule(tenantId, moduleCode);
		if (null != productList && productList.size() > 0) {
			for (ProductMst productMst : productList) {
				products.put(productMst.getProductCode(), productMst.getProductName());
			}
		} else {
			logger.info("Product List not available");
			System.out.println("Product List NOT available");
		}

		request.setAttribute("currencies", currencies);
		request.setAttribute("products", products);

	}

	private Map<String, String> getLookupValues(String code,
			String languageCode, String tenantId) {
		Map<String, String> keyVal = new HashMap<String, String>();

		LookupValueService obj = (LookupValueService) SpringUtil
				.getSpringUtil().getService("lookupValueService");
		keyVal = obj.getLookupValues(code, languageCode, tenantId);

		return keyVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
