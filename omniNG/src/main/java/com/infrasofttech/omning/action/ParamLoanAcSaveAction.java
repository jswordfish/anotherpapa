/**
 * 
 */
package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ParamLoanAc;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.ParamsLoanService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author mahesh.laddha
 * 
 */
public class ParamLoanAcSaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ParamLoanAcSaveAction.class);
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

	ParamLoanAc paramLoanAc = new ParamLoanAc();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("RoleMenuMapAddSaveAction.execute() SESSION EXPIRED");
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
				// paramLoanAc = (ParamLoanAc) request.getpa("paramLoanAc");
				System.out.println("paramLoanAc" + paramLoanAc);
				paramLoanAc = setValuesToParamLoanAc(paramLoanAc);
				paramLoanAc.setTenantId(tenantId);
				paramLoanAc.setModuleCode("04");// always module code is Loan=20
				Long setNo=(long)(Math.random()*10000000);
				paramLoanAc.setSetNumber(setNo);
				ParamsLoanService paramsLoanService = (ParamsLoanService) SpringUtil
						.getSpringUtil().getService("paramsLoanAcService");
				String branchCodes[]=request.getParameterValues("branchCode");
				for(int i=0;i<branchCodes.length;i++ ){
					paramLoanAc.setBranchCode(branchCodes[i]);
					System.out.println("BranchCode"+i+branchCodes[i]);
				paramsLoanService.saveOrUpdate(paramLoanAc);
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

	private ParamLoanAc setValuesToParamLoanAc(ParamLoanAc paramLoanAc) {
		try {
			
			//paramLoanAc.setBranchCode(request.getParameter("branchCode"));
			paramLoanAc.setProdCode(request.getParameter("productCode"));
			
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
					paramLoanAc.setEffectiveFrom((Date) dateFormat
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
					paramLoanAc.setEffectiveTill((Date) dateFormat
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
				paramLoanAc.setEffectiveTill(todayDate);
			}
			
			paramLoanAc.setInterestApplicationFrequency(request
					.getParameter("interestApplicationFrequency"));
			paramLoanAc.setProductCalculationType(request
					.getParameter("productCalculationType"));
			paramLoanAc.setHolidayPeriod(request.getParameter("holiDayPeriod"));
			paramLoanAc.setRoundOff(request.getParameter("roundOff"));
			paramLoanAc.setLoanType(request.getParameter("loanType"));
			paramLoanAc.setInterestChargeType(request
					.getParameter("interestChargeType"));

			if (null != request.getParameter("equated")
					&& request.getParameter("equated").equalsIgnoreCase("Y")) {
				paramLoanAc.setEquated(true);
			} else {
				paramLoanAc.setEquated(false);
			}
			if (null != request.getParameter("funded")
					&& request.getParameter("funded").equalsIgnoreCase("Y")) {
				paramLoanAc.setFunded(true);
			} else {
				paramLoanAc.setFunded(false);
			}
			paramLoanAc.setGraceDaysInstallment(Integer.parseInt(request
					.getParameter("graceDaysInstallment")));
			paramLoanAc.setDefaultTransferBatch(request
					.getParameter("defaultTransferBatch"));
			paramLoanAc.setMinimumTerm(Double.parseDouble(request
					.getParameter("minimumTerm")));
			paramLoanAc.setMaximumTerm(Integer.parseInt(request
					.getParameter("maximumTerm")));
			paramLoanAc.setMaximumAmount(Double.parseDouble(request
					.getParameter("maximumAmount")));
			paramLoanAc.setMinimumAmount(Double.parseDouble(request
					.getParameter("minimumAmount")));
			paramLoanAc.setGraceDayInterest(Integer.parseInt(request
					.getParameter("graceDaysInterest")));
			paramLoanAc.setMinimumDaysOfInterest(Integer.parseInt(request
					.getParameter("minDaysForInterest")));
			paramLoanAc.setPenalInterestRate(Double.parseDouble(request
					.getParameter("penalInterestRate")));
			paramLoanAc.setMaxPenalInterestRate(Double.parseDouble(request
					.getParameter("maxPenalInterestRate")));
			paramLoanAc.setInterestTax(Double.parseDouble(request
					.getParameter("interestTax")));
			paramLoanAc.setNotPerformingAccountpenalRate(Double
					.parseDouble(request
							.getParameter("notPerformingAccountpenalRate")));
			paramLoanAc.setMinimumClosureTerm(Integer.parseInt(request
					.getParameter("minimumClosureTerm")));

			if (null != request.getParameter("discoutedInterestRate")
					&& request.getParameter("discoutedInterestRate")
							.equalsIgnoreCase("Y")) {
				paramLoanAc.setDiscoutedInterestRate(true);
			} else {
				paramLoanAc.setDiscoutedInterestRate(false);
			}
			paramLoanAc.setNumberOfDaysInYear(Integer.parseInt(request
					.getParameter("numberOfDaysInYear")));
			paramLoanAc.setMaximumSanctionLimit(Float.parseFloat(request
					.getParameter("maximumSanctionLimit")));
			if (null != request.getParameter("acceptNonPerformingAccountDate")
					&& request.getParameter("acceptNonPerformingAccountDate")
							.equalsIgnoreCase("Y")) {
				paramLoanAc.setAcceptNonPerformingAccountDate(true);
			} else {
				paramLoanAc.setAcceptNonPerformingAccountDate(false);
			}
			if (null != request.getParameter("chargeFullMonthInterestClosure")
					&& request.getParameter("chargeFullMonthInterestClosure")
							.equalsIgnoreCase("Y")) {
				paramLoanAc.setChargeFullMonthInterestClosure(true);
			} else {
				paramLoanAc.setChargeFullMonthInterestClosure(false);
			}
			paramLoanAc.setMonthValueDate(Integer.parseInt(request
					.getParameter("monthValueDate")));
			paramLoanAc.setDeathInsurance(Double.parseDouble(request
					.getParameter("deathInsurance")));
			paramLoanAc.setGuaranteeDeposit(Double.parseDouble(request
					.getParameter("guaranteeDeposit")));
			paramLoanAc.setGuaranteeFund(Double.parseDouble(request
					.getParameter("guaranteeFund")));
			paramLoanAc.setStatus(request.getParameter("status"));
			paramLoanAc.setNumOfAccount(Integer.parseInt(request
					.getParameter("numOfAccount")));
			paramLoanAc.setLastAccount(request.getParameter("lastAccount"));
			paramLoanAc.setUnRecovExpAc(request.getParameter("unRecovExpAc"));
			paramLoanAc.setNpaAIntRecvAc(request.getParameter("NPAAIntRecvAc"));
			paramLoanAc.setNpaAIntResAc(request.getParameter("NPAAIntResAc"));
			paramLoanAc.setNpaPIntRecvAc(request.getParameter("NPAPIntRecvAc"));
			paramLoanAc.setNpaPIntResAc(request.getParameter("NPAPIntResAc"));
			paramLoanAc.setNpaOCRecvAc(request.getParameter("NPAOCRecvAc"));
			paramLoanAc.setNpaOCResAc(request.getParameter("NPAOCResAc"));
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				paramLoanAc.setCreatedDate(createdDate);
				paramLoanAc.setCreatedBy(loginId);
			} else {
				paramLoanAc.setCreatedBy(request.getParameter("createdBy"));
				paramLoanAc.setLastModifiedDate(lastModifiedDate);
				paramLoanAc.setLastModifiedBy(loginId);
				if (!request.getParameter("createdDate").isEmpty()
						&& request.getParameter("createdDate") != null
						&& request.getParameter("createdDate") != "") {
					try {
						String effTill = (String) request.getParameter("createdDate");
						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(effTill);
						String toDate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						
						paramLoanAc.setCreatedDate((Date) dateFormat
								.parse(toDate1));
					}

					catch (Exception e) {
						
						logger.error("error while parsing createdDate", e);
						e.printStackTrace();
					}
					
				}
				
				
			}
			paramLoanAc.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}

		return paramLoanAc;

	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

}
