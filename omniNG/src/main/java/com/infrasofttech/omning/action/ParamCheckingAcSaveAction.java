package com.infrasofttech.omning.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ParamCheckingAc;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.ParamsCheckingAcService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ParamCheckingAcSaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamCheckingAcSaveAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "";
	private String errMsg = "";
	private String mode = "";
	ParamCheckingAc paramCheckingAc = new ParamCheckingAc();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("ParamCheckingAcSaveAction.execute() SESSION EXPIRED");
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
				mode = (String) request.getParameter("mode");

				System.out.println("Saving in " + mode + " mode.");
				// Action logic here...
				paramCheckingAc = (ParamCheckingAc) request
						.getAttribute("paramCheckingAc");
				paramCheckingAc.setTenantId(tenantId);
				paramCheckingAc = setValuesToParamCheckingAc(paramCheckingAc);

				Long setNo = (long) (Math.random() * 10000000);
				System.out.println("setNo random" + setNo);
				System.out.println("tilldate:"
						+ request.getParameter("effectTillDateDetails"));
				paramCheckingAc.setSetNumber(setNo);
				ParamsCheckingAcService paramsCheckingAcService = (ParamsCheckingAcService) SpringUtil
						.getSpringUtil().getService("paramsCheckingAcService");
				String[] branches = request.getParameterValues("branchCode");
				for (int i = 0; i < branches.length; i++) {
					System.out.println(branches[i] + "branches[i]");
					paramCheckingAc.setBranchCode(branches[i]);

					paramsCheckingAcService.saveOrUpdate(paramCheckingAc);
				}

				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private ParamCheckingAc setValuesToParamCheckingAc(
			ParamCheckingAc paramCheckingAc) {
		try {
			// paramCheckingAc.setBranchCode(request.getParameter("branchCode"));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			if (!request.getParameter("effectFromDateDetails").isEmpty()
					&& request.getParameter("effectFromDateDetails") != null
					&& request.getParameter("effectFromDateDetails") != "") {
				String effectiveFrom = (String) request
						.getParameter("effectFromDateDetails");
				// String fromDate = (String) request.getParameter("fromDate");

				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse(effectiveFrom);
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					paramCheckingAc.setEffectiveFrom((Date) dateFormat
							.parse(fromdate1));

				} catch (Exception e) {
					logger.error("Exception in Effect From Date convertion......");
					System.out.println(e.getMessage());
				}

			}

			if (!request.getParameter("effectTillDateDetails").isEmpty()
					&& request.getParameter("effectTillDateDetails") != null
					&& request.getParameter("effectTillDateDetails") != "") {
				try {

					Date date = new SimpleDateFormat("yyyy-MM-dd")
							.parse((String) request
									.getParameter("effectTillDateDetails"));
					String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(date);
					paramCheckingAc.setEffectiveTill((Date) dateFormat
							.parse(fromdate1));
				} catch (Exception e) {
					System.out.println("error while parsing effectTillDate "
							+ e);
					logger.error("error while parsing effectTillDate", e);
					e.printStackTrace();
				}
			}
			else if(request.getParameter("effectTillDateDetails") != null){
				Calendar date=Calendar.getInstance();
				date.set(2099,11,31);
				Date todayDate=date.getTime();
				paramCheckingAc.setEffectiveTill(todayDate);
			}

			paramCheckingAc.setProdCode(request.getParameter("productCode"));
			paramCheckingAc.setModuleCode("SB");
			paramCheckingAc.setInterestPayOrReceiveCustomer(request
					.getParameter("interestPayOrReceiveCustomer"));
			paramCheckingAc.setDefaultTransferBatch(request
					.getParameter("defaultTransferBatch"));
			paramCheckingAc.setIntAcNo(request.getParameter("intAcNo"));
			paramCheckingAc.setPenalIntAcNo(request
					.getParameter("penalIntAcNo"));
			paramCheckingAc.setIntRecvAcNo(request.getParameter("intRecvAcNo"));
			paramCheckingAc.setIntResAcNo(request.getParameter("intResAcNo"));
			Double pintrate = Double.parseDouble(request
					.getParameter("penalInterestRate"));
			paramCheckingAc.setPenalInterestRate(pintrate);
			Double maxIntRate = Double.parseDouble(request
					.getParameter("maximumInterestRate"));
			paramCheckingAc.setMaximumInterestRate(maxIntRate);
			Double maxAdhockRate = Double.parseDouble(request
					.getParameter("maximumAdhocInterestRate"));
			paramCheckingAc.setMaximumAdhocInterestRate(maxAdhockRate);
			paramCheckingAc.setAfterMonthsDormant(request.getParameter("afterMonthsDormant"));
			paramCheckingAc.setAfterMonthsInOperative(request.getParameter("afterMonthsInoperative"));
			paramCheckingAc.setMoveAcToInoperativeHead(request.getParameter("moveAcToInoperativeHead"));
			paramCheckingAc.setMoveAccountToInDormantHead(request.getParameter("moveAccountToInDormantHead"));

			if (null != request.getParameter("tds")
					&& request.getParameter("tds").equalsIgnoreCase("Y")) {
				// System.out.println("request.getParameter(acNoAuto) >"+request.getParameter("acNoAuto")
				// );
				paramCheckingAc.setTds(true);
			} else {
				paramCheckingAc.setTds(false);
			}
			if (null != request.getParameter("tdsPercent")) {
				Double tdsPercent = Double.parseDouble(request
						.getParameter("tdsPercent"));
				paramCheckingAc.setTdsPercent(tdsPercent);
			}

			paramCheckingAc.setTdsAcNo(request.getParameter("tdsAcNo"));
			if (null != request.getParameter("interestTax")) {
				Double interestTax = Double.parseDouble(request
						.getParameter("interestTax"));
				paramCheckingAc.setInterestTax(interestTax);
			}
			paramCheckingAc.setRoundOffOption(request
					.getParameter("roundOffOption"));
			if (null != request.getParameter("temporaryOverdraftInterestRate")) {
				Double temporaryOverdraftInterestRate = Double
						.parseDouble(request
								.getParameter("temporaryOverdraftInterestRate"));
				paramCheckingAc
						.setTemporaryOverdraftInterestRate(temporaryOverdraftInterestRate);
			}
			Double nonPerpormingAssetPanelRate = Double.parseDouble(request
					.getParameter("nonPerpormingAssetPanelRate"));
			paramCheckingAc
					.setNonPerpormingAssetPanelRate(nonPerpormingAssetPanelRate);
			paramCheckingAc.setInterestCalculationBalancingType(request
					.getParameter("interestCalculationBalancingType"));
			paramCheckingAc.setValueMaxMonth(request
					.getParameter("valueMaxMonth"));
			paramCheckingAc.setInterestApplicationFrequency(request
					.getParameter("interestApplicationFrequency"));
			paramCheckingAc.setDiscountedInterestRate(request
					.getParameter("discountedInterestRate"));
			paramCheckingAc.setProductCalculationType(request
					.getParameter("productCalculationType"));
			paramCheckingAc.setDayOfMonth(request.getParameter("dayOfMonth"));
			paramCheckingAc.setDaysCountPerYear(request
					.getParameter("daysCountPerYear"));
			paramCheckingAc.setStatus(request.getParameter("status"));
			paramCheckingAc.setLastAcNo(request.getParameter("lastAcNo"));
			// String fromDate=request.getParameter("fromDateDetails");
			// String toDate=request.getParameter("toDateDetails");

			Double minimumSBInterestAmount = Double.parseDouble(request
					.getParameter("minimumSBInterestAmount"));
			paramCheckingAc.setMinimumSBInterestAmount(minimumSBInterestAmount);

			Double minimumTODChargeAmount = Double.parseDouble(request
					.getParameter("minimumTODChargeAmount"));

			paramCheckingAc.setMinimumTODChargeAmount(minimumTODChargeAmount);

			Double minimumProductTODCharge = Double.parseDouble(request
					.getParameter("minimumProductTODCharge"));
			paramCheckingAc.setMinimumProductTODCharge(minimumProductTODCharge);
			// String effFrom=request.getParameter("effectiveFromDetails");
			// String effTill=request.getParameter("effectiveTillDetails");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				paramCheckingAc.setCreatedDate(createdDate);
				paramCheckingAc.setCreatedBy(loginId);
			} else {
				paramCheckingAc.setLastModifiedDate(lastModifiedDate);
				paramCheckingAc.setLastModifiedBy(loginId);
				paramCheckingAc.setCreatedBy(request.getParameter("createdBy"));
				if (!request.getParameter("createdDate").isEmpty()
						&& request.getParameter("createdDate") != null
						&& request.getParameter("createdDate") != "") {
					try {
						String effTill1 = "";
						effTill1 = (String) request.getParameter("createdDate");
						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effTill1);
						String toDate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);

						paramCheckingAc.setCreatedDate((Date) dateFormat
								.parse(toDate1));
					}

					catch (Exception e) {

						logger.error("error while parsing createdDate", e);
						e.printStackTrace();
					}

				}
			}
			paramCheckingAc.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);

		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return paramCheckingAc;
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

	public ParamCheckingAc getParamCheckingAc() {
		return paramCheckingAc;
	}

	public void setParamCheckingAc(ParamCheckingAc paramCheckingAc) {
		this.paramCheckingAc = paramCheckingAc;
	}

}
