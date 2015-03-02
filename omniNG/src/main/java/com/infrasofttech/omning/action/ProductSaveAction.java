package com.infrasofttech.omning.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.ProductMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.ProductMstService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductSaveAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(ProductSaveAction.class);
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
	ProductMst product = new ProductMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("ProductSaveAction.execute() SESSION EXPIRED");
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
				product = (ProductMst) request.getAttribute("product");

				product = setValuesToProductMst(product);
				product.setTenantId(tenantId);

				ProductMstService productMstService = (ProductMstService) SpringUtil
						.getSpringUtil().getService("productMstService");

				productMstService.saveOrUpdate(product);

				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			retVal = OmniConstants.INPUT;
		} finally {

		}
		return retVal;
	}

	private ProductMst setValuesToProductMst(ProductMst product) {
		try {
			product.setProductCode(request.getParameter("productCode"));
			product.setProductName(request.getParameter("productName"));
			product.setCurrencyCode(request.getParameter("currencyCode"));
			product.setCustomerInternal(request
					.getParameter("customerInternal"));
			product.setGeneralLadger(request.getParameter("generalLadger"));
			product.setVcrOpenLevel(request.getParameter("vcrOpenLevel"));
			product.setVcrEntryLevel(request.getParameter("vcrEntryLevel"));
			product.setModuleCode(request.getParameter("modules"));
			product.setTypeOfDeposit(request.getParameter("typeOfDeposit"));
			if (null != request.getParameter("acNoAuto")
					&& request.getParameter("acNoAuto").equalsIgnoreCase("Y")) {
				// System.out.println("request.getParameter(acNoAuto) >"+request.getParameter("acNoAuto")
				// );
				product.setAutoGenAcNoYN(true);
			} else {
				product.setAutoGenAcNoYN(false);
			}
			if (null != request.getParameter("subAcNoAuto")
					&& request.getParameter("subAcNoAuto")
							.equalsIgnoreCase("Y")) {
				product.setAutoGenSubAcNoYN(true);
			} else {
				product.setAutoGenSubAcNoYN(false);
			}

			product.setMinBalChqBook(Double.parseDouble(request
					.getParameter("minBalChqBk")));
			product.setMinBalNonChqBook(Double.parseDouble(request
					.getParameter("minBalWOChqBk")));

			product.setAssetLiability(request.getParameter("assetLiability"));
			product.setFinNonFin(request.getParameter("finNonFin"));
			product.setConditionalAssetGL(request.getParameter("assetGL"));
			product.setConditionalLiabilityGL(request
					.getParameter("liabilityGL"));
			product.setReconType(request.getParameter("reconType"));
			product.setPrdStatus(request.getParameter("productStatus"));
			// product.setGeneralLadger(request.getParameter("generalLadger"));

			if (null != request.getParameter("accrued")
					&& request.getParameter("accrued").equalsIgnoreCase("Y")) {
				product.setAccruedYN(true);
			} else {
				product.setAccruedYN(false);
			}

			if (null != request.getParameter("cashDR")
					&& request.getParameter("cashDR").equalsIgnoreCase("Y")) {
				product.setCashDrYN(true);
			} else {
				product.setCashDrYN(false);
			}
			if (null != request.getParameter("cashCR")
					&& request.getParameter("cashCR").equalsIgnoreCase("Y")) {
				product.setCashCrYN(true);
			} else {
				product.setCashCrYN(false);
			}
			if (null != request.getParameter("transferDR")
					&& request.getParameter("transferDR").equalsIgnoreCase("Y")) {
				product.setTransferDrYN(true);
			} else {
				product.setTransferDrYN(false);
			}
			if (null != request.getParameter("transferCR")
					&& request.getParameter("transferCR").equalsIgnoreCase("Y")) {
				product.setTransferCrYN(true);
			} else {
				product.setTransferCrYN(false);
			}
			if (null != request.getParameter("clearingDR")
					&& request.getParameter("clearingDR").equalsIgnoreCase("Y")) {
				product.setClearingDrYN(true);
			} else {
				product.setClearingDrYN(false);
			}
			if (null != request.getParameter("clearingCR")
					&& request.getParameter("clearingCR").equalsIgnoreCase("Y")) {
				product.setClearingCrYN(true);
			} else {
				product.setClearingCrYN(false);
			}

			// DateFormat dateFormat = new
			// SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date createdDate = cal.getTime();
			Date lastModifiedDate = cal.getTime();
			if (mode.equalsIgnoreCase("CREATE")) {
				product.setCreatedDate(createdDate);
				product.setCreatedBy(loginId);
			} else {
				product.setLastModifiedDate(lastModifiedDate);
				product.setLastModifiedBy(loginId);
			}
			product.setAuthStatus(OmniConstants.AUTH_AUTHORIZED);
			return product;
		} catch (OmniNGException e) {
			e.printStackTrace();
			errMsg = e.getMessage();
			retVal = OmniConstants.INPUT;
		}
		return product;
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

	public ProductMst getProduct() {
		return product;
	}

	public void setProduct(ProductMst product) {
		this.product = product;
	}

}
