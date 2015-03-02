/*package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.infrasofttech.domain.entities.Address;
import com.infrasofttech.domain.entities.BranchMst;
import com.infrasofttech.domain.entities.CustomerAsset;
import com.infrasofttech.domain.entities.CustomerBusinessDtls;
import com.infrasofttech.domain.entities.CustomerContact;
import com.infrasofttech.domain.entities.CustomerEmploymentDtls;
import com.infrasofttech.domain.entities.CustomerKYCDocs;
import com.infrasofttech.domain.entities.CustomerKYCFamily;
import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.domain.entities.TenantMst;
import com.infrasofttech.omning.orch.services.LoginService;
import com.infrasofttech.omning.orch.services.impl.LoginServiceImpl;
import com.infrasofttech.utils.OmniConstants;
import com.infrasofttech.omning.services.impl.CustomerServiceImpl;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerRegSaveAction extends ActionSupport implements
		ModelDriven<CustomerMst> {

	
	private String errMsg = "";
	private static final long serialVersionUID = 1L;
	private CustomerMst customerMst = new CustomerMst();
	private static final Logger logger = Logger
			.getLogger(CustomerRegSaveAction.class);
	private Collection<Address> customerAddresses = new ArrayList<Address>();
	private Collection<Address> assetAddresses = new ArrayList<Address>();
	private Collection<Address> employmentAddresses = new ArrayList<Address>();
	private Collection<CustomerAsset> customerAssets = new ArrayList<CustomerAsset>();
	private Collection<CustomerKYCDocs> customerKYCDocs = new ArrayList<CustomerKYCDocs>();
	private Collection<CustomerKYCFamily> customerKYCFamilys = new ArrayList<CustomerKYCFamily>();
	private Collection<CustomerBusinessDtls> customerBusinessDtls = new ArrayList<CustomerBusinessDtls>();
	private Collection<CustomerEmploymentDtls> customerEmploymentDtls = new ArrayList<CustomerEmploymentDtls>();
	private Collection<CustomerContact> customerContacts = new ArrayList<CustomerContact>();
	private Collection<TenantMst> tenants = new ArrayList<TenantMst>();
	Address addr = new Address();

	CustomerContact customerContact = new CustomerContact();
	String tenantCode;
	String branchCode;
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);
	TenantMst tenantMst;
	BranchMst branchMst;

	public String execute() {
		logger.info(":::Inside CustomerRegSaveAction Execute...SAVING Registration details...");
		String retVal = OmniConstants.INPUT;
		session = request.getSession(false);
		if (request.getSession(false) == null) {
			// Session expired
			errMsg = ErrorCodes.SESSIONEXPIRE;
			retVal = OmniConstants.LOGIN;
			session.invalidate();
		} else {

			
			 * System.out.println(mlvToken + ".........value of mlvToken"); if
			 * (mlvToken == null) { mlvToken = request.getParameter("mlvToken");
			 * } System.out.println(mlvToken +
			 * ".........value of mlvToken after request");
			 * 
			 * String vtkn = (String) session.getAttribute("vToken");
			 * System.out.println(vtkn);
			 * 
			 * if (!mlvToken.equals((String) session.getAttribute("vToken"))) {
			 * // VTOKEN AND SESSION VTOKEN ARE NOT EQUAL THEN BREAK; // THROW
			 * OUT ON LOGIN PAGE; errMsg = ErrorCodes.ILLEGALACCESS; retVal =
			 * Constants.LOGIN; session.invalidate(); } else {
			 
			try {
				tenantCode = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				LoginService loginService = new LoginServiceImpl();
				branchMst = loginService.getBranchName(tenantCode, branchCode);
				tenantMst = loginService.getTenantMst(tenantCode);
				customerMst.setBranchMst(branchMst);
				tenants.add(tenantMst);
				customerMst.setTenants(tenants);

				System.out
						.println("::Inside MemberRegistrationSaveAction Execute...SAVING Registration details");

				*//**
				 * CUSTOMER_ADDRESS table with looping and mlvalues are getting
				 * saved
				 * **//*
				String mlValue = request.getParameter("mlValue");
				System.out.println("mlValue----" + mlValue);
				if ((mlValue != "")) {
					for (String retval : mlValue.split("!")) {

						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						for (int i = 0; i < retval1.length; i++) {
							if (i == 0) {
								addr.setAddressType(retval1[i]);
								System.out.println("Address type is::"
										+ addr.getAddressType());
							}
							if (i == 1) {
								addr.setAddress1(retval1[i]);
								System.out.println("Address1::"
										+ addr.getAddress1());
							}
							if (i == 2) {
								addr.setAddress2(retval1[i]);
								System.out.println("Address2::"
										+ addr.getAddress2());
							}
							if (i == 3) {
								addr.setAddress3(retval1[i]);
								System.out.println("Address3::"
										+ addr.getAddress3());
							}
							if (i == 4) {// village
								addr.setVillageId(Long.parseLong(retval1[i]));
								System.out.println("Village id::"
										+ addr.getVillageId());

							}
							if (i == 5) {// state
								addr.setStateId(Long.parseLong(retval1[i]));
								System.out.println("State id::"
										+ addr.getStateId());
							}
							if (i == 6) {// muncipality
								addr.setMunicipalityId(Long
										.parseLong(retval1[i]));
								System.out.println("Municipality id ::"
										+ addr.getMunicipalityId());
							}
							if (i == 7) {// country
								addr.setCountryId(Long.parseLong(retval1[i]));
								System.out.println("Country id::"
										+ addr.getCountryId());
							}
							if (i == 8) {// district/city
								addr.setCityId(Long.parseLong(retval1[i]));
								System.out.println("City id is::"
										+ addr.getCityId());
							}
							if (i == 9) {// pincode
								addr.setPinCode(retval1[i]);
								System.out.println("Pin code ::"
										+ addr.getPinCode());
							}
						}
						customerAddresses.add(addr);
					}
					customerMst.setCustomerAddresses(customerAddresses);
				}

				*//**
				 * CUSTOMER_ASSET table & CUSTOMER_ASSET_ADDRESS with looping
				 * and mlvalues are getting saved
				 * **//*

				CustomerAsset customerAsset = new CustomerAsset();
				String mlValue1 = request.getParameter("mlValue1");
				System.out.println("mlValue1----" + mlValue1);

				if ((mlValue1 != "")) {
					for (String retval : mlValue1.split("!")) {
						customerAsset = new CustomerAsset();
						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						Address addrAsset = new Address();
						assetAddresses = new ArrayList<Address>();
						for (int i = 0; i < retval1.length; i++) {
							if (i == 0) {
								customerAsset.setRegNumber(retval1[i]);
								System.out
										.println("customerAsset.getRegNumber()..."
												+ customerAsset.getRegNumber());
							}
							if (i == 1) {
								customerAsset.setPlotNumber(retval1[i]);
								System.out
										.println("customerAsset.getPlotNumber()..."
												+ customerAsset.getPlotNumber());
							}
							if (i == 2) {
								addrAsset.setAddress1(retval1[i]);
								System.out.println("addrAsset.getAddress1()..."
										+ addrAsset.getAddress1());
							}
							if (i == 3) {
								addrAsset.setAddress2(retval1[i]);
								System.out
										.println("addrAsset.getAddress2()....."
												+ addrAsset.getAddress2());
							}
							if (i == 4) {
								addrAsset.setAddress3(retval1[i]);
								System.out
										.println("addrAsset.getAddress3()....."
												+ addrAsset.getAddress3());
							}
							if (i == 5) {
								addrAsset.setVillageId(Long
										.parseLong(retval1[i]));
								System.out
										.println("addrAsset.getVillageId()....."
												+ addrAsset.getVillageId());
							}
							if (i == 6) {

								addrAsset.setMunicipalityId(Long
										.parseLong(retval1[i]));
								System.out
										.println("addrAsset.getMunicipalityId()....."
												+ addrAsset.getMunicipalityId());

							}
							if (i == 7) {
								addrAsset.setCityId(Long.parseLong(retval1[i]));
								System.out.println("addrAsset.getCityId()....."
										+ addrAsset.getCityId());
							}
							if (i == 8) {
								addrAsset
										.setStateId(Long.parseLong(retval1[i]));
								System.out
										.println("addrAsset.getStateId()....."
												+ addrAsset.getStateId());

							}
							if (i == 9) {
								customerAsset.setAreaSize(Double
										.parseDouble(retval1[i]));
								System.out
										.println("customerAsset.getAreaSize()....."
												+ customerAsset.getAreaSize());
							}
							if (i == 10) {
								customerAsset.setAreaRate(Double
										.parseDouble(retval1[i]));
								System.out
										.println("customerAsset.getAreaRate()....."
												+ customerAsset.getAreaRate());
							}
							if (i == 11) {
								customerAsset.setApproxMonetaryValue(Double
										.parseDouble(retval1[i]));
								System.out
										.println("customerAsset.getApproxMonetaryValue()....."
												+ customerAsset
														.getApproxMonetaryValue());
							}
							if (i == 12) {
								customerAsset.setRemarks1(retval1[i]);
								System.out
										.println("customerAsset.getRemarks1()..."
												+ customerAsset.getRemarks1());
							}
							if (i == 13) {
								customerAsset.setOsLoanYN(Boolean
										.parseBoolean(retval1[i]));
								System.out
										.println("customerAsset.getOsLoanYN()..."
												+ customerAsset.getOsLoanYN());
							}
							if (i == 14) {
								customerAsset.setOsAmount(Double
										.parseDouble(retval1[i]));
								System.out
										.println("customerAsset.getOsAmount()..."
												+ customerAsset.getOsAmount());
							}
						}
						assetAddresses.add(addrAsset);
						customerAsset.setCustomerMst(customerMst);
						customerAsset.setCustomerAssetAddresses(assetAddresses);
						customerAssets.add(customerAsset);
						customerAsset.setTenantMst(tenantMst);
					}
					customerMst.setCustomerAssets(customerAssets);
				}

				*//**
				 * CUSTOMER BUSINESS table with looping and mlvalues are getting
				 * saved
				 * **//*

				String mlValue2 = request.getParameter("mlValue2");
				System.out.println("mlValue2----" + mlValue2);
				if ((mlValue2 != "")) {
					for (String retval : mlValue2.split("!")) {
						CustomerBusinessDtls businessDtls = new CustomerBusinessDtls();
						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						for (int i = 0; i < retval1.length; i++) {

							if (i == 0) {
								businessDtls.setNoOfStaff(Integer
										.parseInt(retval1[i]));
								System.out
										.println("businessDtls.getNoOfStaff():...."
												+ businessDtls.getNoOfStaff());
							}
							if (i == 1) {
								businessDtls.setRegCode((retval1[i]));
								System.out
										.println(" businessDtls.getRegCode():..."
												+ businessDtls.getRegCode());
							}

						}
						businessDtls.setTenantMst(tenantMst);
						businessDtls.setCustomerMst(customerMst);
						businessDtls.setBranchMst(branchMst);
						customerBusinessDtls.add(businessDtls);
					}
					customerMst.setCustomerBusinessDtls(customerBusinessDtls);
				}

				*//**
				 * CUSTOMER_EMPLOYMENTDTLS & EMPLOMENT_ADDRESS table with
				 * looping and mlvalues are getting saved
				 * **//*

				CustomerEmploymentDtls employmentDtls = new CustomerEmploymentDtls();
				String mlValue3 = request.getParameter("mlValue3");
				System.out.println("mlValue3----" + mlValue3);
				if ((mlValue3 != "")) {
					for (String retval : mlValue3.split("!")) {
						employmentDtls = new CustomerEmploymentDtls();
						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						Address empAddress = new Address();
						employmentAddresses = new ArrayList<Address>();

						for (int i = 0; i < retval1.length; i++) {
							if (i == 0) {
								employmentDtls.setProfessionType(retval1[i]);
								System.out
										.println("employmentDtls.getProfessionType()..."
												+ employmentDtls
														.getProfessionType());
							}
							if (i == 1) {
								empAddress.setAddress1(retval1[i]);
								System.out
										.println("empAddress.getAddress1()..."
												+ empAddress.getAddress1());
							}
							if (i == 2) {
								empAddress.setAddress2(retval1[i]);
								System.out
										.println("empAddress.getAddress2()..."
												+ empAddress.getAddress2());
							}
							if (i == 3) {
								empAddress.setAddress3(retval1[i]);
								System.out
										.println("empAddress.getAddress3()...."
												+ empAddress.getAddress3());
							}
							if (i == 4) {
								empAddress.setStateId(Long
										.parseLong(retval1[i]));
								System.out
										.println("empAddress.getStateId()....."
												+ empAddress.getStateId());
							}
							if (i == 5) {
								empAddress.setCountryId(Long
										.parseLong(retval1[i]));
								System.out
										.println("empAddress.getCountryId()....."
												+ empAddress.getCountryId());
							}
							if (i == 6) {
								empAddress
										.setCityId(Long.parseLong(retval1[i]));
								System.out
										.println("empAddress.getCityId()....."
												+ empAddress.getCityId());
							}
							if (i == 7) {
								employmentDtls.setEmpNumber(retval1[i]);
								System.out
										.println("employmentDtls.getEmpNumber()....."
												+ employmentDtls.getEmpNumber());
							}
							if (i == 8) {
								employmentDtls.setDepartment(retval1[i]);
								System.out
										.println("employmentDtls.getDepartment()....."
												+ employmentDtls
														.getDepartment());
							}
							if (i == 9) {
								employmentDtls.setDOR(retval1[i]);
								System.out.println("employmentDtls.getDOR()..."
										+ employmentDtls.getDOR());
							}

							if (i == 10) {
								employmentDtls.setAnnualIncome(Double
										.parseDouble(retval1[i]));
								System.out
										.println("employmentDtls.getAnnualIncome()..."
												+ employmentDtls
														.getAnnualIncome());
							}
							if (i == 11) {
								employmentDtls.setAccountType(retval1[i]);
								System.out
										.println("employmentDtls.getAccountType()..."
												+ employmentDtls
														.getAccountType());
							}
							if (i == 12) {
								employmentDtls.setBankCode(retval1[i]);
								System.out
										.println("employmentDtls.getBankCode()..."
												+ employmentDtls.getBankCode());
							}
							if (i == 13) {
								employmentDtls.setBankName(retval1[i]);
								System.out
										.println("employmentDtls.getBankName()..."
												+ employmentDtls.getBankName());
							}
							if (i == 14) {
								employmentDtls.setAccountNumber(Long
										.parseLong(retval1[i]));
								System.out
										.println("employmentDtls.getAccountNumber()..."
												+ employmentDtls
														.getAccountNumber());
							}

							if (i == 15) {
								employmentDtls.setYearsInService(Integer
										.parseInt(retval1[i]));
								System.out
										.println("employmentDtls.getYearsInService()..."
												+ employmentDtls
														.getYearsInService());
							}
							if (i == 16) {
								employmentDtls.setDesignation(retval1[i]);
								System.out
										.println("employmentDtls.getDesignation()....."
												+ employmentDtls
														.getDesignation());
							}
						}
						employmentAddresses.add(empAddress);
						employmentDtls.setCustomerMst(customerMst);
						employmentDtls
								.setEmploymentAddresses(employmentAddresses);
						customerEmploymentDtls.add(employmentDtls);
					}
					customerMst
							.setCustomerEmploymentDtls(customerEmploymentDtls);
				}
				*//**
				 * CUSTOMER KYC_DOCS table with looping and mlvalues are getting
				 * saved
				 * **//*

				String mlValue4 = request.getParameter("mlValue4");
				System.out.println("mlValue4----" + mlValue4);
				if ((mlValue4 != "")) {
					for (String retval : mlValue4.split("!")) {

						CustomerKYCDocs customerKYCDoc = new CustomerKYCDocs();
						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						for (int i = 0; i < retval1.length; i++) {
							if (i == 0) {
								customerKYCDoc.setProofType(retval1[i]);
								System.out
										.println("customerKYCDoc.getProofType():..."
												+ customerKYCDoc.getProofType());
							}
							if (i == 1) {
								customerKYCDoc.setKYCType1(retval1[i]);
								System.out
										.println("customerKYCDoc.getKYCType1():...."
												+ customerKYCDoc.getKYCType1());
							}
							if (i == 2) {
								customerKYCDoc.setIdNumber(retval1[i]);
								System.out
										.println("customerKYCDoc.getIdNumber():...."
												+ customerKYCDoc.getIdNumber());
							}
							if (i == 3) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"mm/dd/yyyy");
								Date date1 = null;
								try {
									date1 = sdf.parse(retval1[i]);
								} catch (Exception e) {
									e.printStackTrace();
								}
								customerKYCDoc.setIssuedDate(date1);
								System.out
										.println("memKYCDoc1.getDocRefNo():..."
												+ customerKYCDoc
														.getIssuedDate());
							}
							if (i == 4) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"mm/dd/yyyy");
								Date date1 = null;
								try {
									date1 = sdf.parse(retval1[i]);
								} catch (Exception e) {
									e.printStackTrace();
								}
								customerKYCDoc.setExpiryDate(date1);
								System.out
										.println("customerKYCDoc.getExpiryDate()....."
												+ customerKYCDoc
														.getExpiryDate());
							}
							if (i == 5) {
								customerKYCDoc.setIssuedBy(retval1[i]);
								System.out
										.println("customerKYCDoc.getIssuedBy()..."
												+ customerKYCDoc.getIssuedBy());
							}
							if (i == 6) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"mm/dd/yyyy");
								Date date1 = null;

								try {
									date1 = sdf.parse(retval1[i]);
								} catch (Exception e) {
									e.printStackTrace();
								}
								customerKYCDoc.setRecievedDate(date1);
								System.out.println(""
										+ customerKYCDoc.getRecievedDate());
							}
							if (i == 7) {
								customerKYCDoc.setRemarks(retval1[i]);
								System.out.println(""
										+ customerKYCDoc.getRecievedDate());
							}
							customerKYCDoc.setCustomerMst(customerMst);
							customerKYCDocs.add(customerKYCDoc);
						}
					}
					customerMst.setCustomerKYCDocs(customerKYCDocs);
				}

				*//**
				 * CUSTOMER KYC_FAMILY table with looping and mlvalues are
				 * getting saved
				 * **//*

				String mlValue5 = request.getParameter("mlValue5");
				System.out.println("mlValue5----" + mlValue5);
				if ((mlValue5 != "")) {
					for (String retval : mlValue5.split("!")) {
						CustomerKYCFamily customerKYCFamily = new CustomerKYCFamily();
						String[] retval1 = retval.split("~");
						System.out.println(retval1);
						for (int i = 0; i < retval1.length; i++) {
							if (i == 0) {
								customerKYCFamily
										.setFamilyMemberName(retval1[i]);
								System.out
										.println("customerKYCFamily.getFamilyMemberName():..."
												+ customerKYCFamily
														.getFamilyMemberName());

							}
							if (i == 1) {
								customerKYCFamily.setRelationship1(retval1[i]);
								System.out
										.println("customerKYCFamily.getRelationship1():..."
												+ customerKYCFamily
														.getRelationship1());

							}
							if (i == 2) {
								customerKYCFamily.setGender(retval1[i]);
								System.out
										.println("customerKYCFamily.getGender():..."
												+ customerKYCFamily.getGender());

							}
							if (i == 3) {

								SimpleDateFormat sdf = new SimpleDateFormat(
										"mm/dd/yyyy");
								Date date1 = null;
								try {
									date1 = sdf.parse(retval1[i]);
								} catch (Exception e) {
									e.printStackTrace();
								}
								customerKYCFamily.setDob(date1);
								System.out.println("Date of birth:  "
										+ retval1[i]);
							}
							if (i == 4) {
								customerKYCFamily.setProfession(retval1[i]);
								System.out
										.println("customerKYCFamily.getProfession():..."
												+ customerKYCFamily
														.getProfession());

							}
							if (i == 5) {
								customerKYCFamily.setEducation(retval1[i]);
								System.out
										.println("customerKYCFamily.getEducation():..."
												+ customerKYCFamily
														.getEducation());

							}
							customerKYCFamily.setCustomerMst(customerMst);
							customerKYCFamilys.add(customerKYCFamily);
						}
					}
					customerMst.setCustomerKYCFamilies(customerKYCFamilys);
				}

				*//**
				 * CUSTOMER_CONTACTS table with looping and mlvalues are getting
				 * saved
				 * **//*

				String residencePhone = request.getParameter("residencePhone");
				String mobile1 = request.getParameter("mobile1");
				String mobile2 = request.getParameter("mobile2");
				String emailId1 = request.getParameter("emailId1");
				String emailId2 = request.getParameter("emailId2");
				String faxNo = request.getParameter("faxNo");
				String officePhone1 = request.getParameter("officePhone1");
				String officePhone2 = request.getParameter("officePhone2");

				customerContact.setResidencePhone(residencePhone);
				customerContact.setMobile1(mobile1);
				customerContact.setMobile2(mobile2);
				customerContact.setEmailId1(emailId1);
				customerContact.setEmailId2(emailId2);
				customerContact.setFaxNo(faxNo);
				customerContact.setOfficePhone1(officePhone1);
				customerContact.setOfficePhone2(officePhone2);

				customerContact.setCustomerMst(customerMst);
				customerContacts.add(customerContact);
				customerMst.setCustomerContacts(customerContacts);
				customerMst.setTenants(tenants);

				CustomerServiceImpl customerServiceImpl = new CustomerServiceImpl();
				customerMst = customerServiceImpl
						.createCustomer(customerMst);
			} catch (NumberFormatException e) {

				e.printStackTrace();
			}
			retVal = OmniConstants.SUCCESS;
		}// end else condition , every thing valid
			// }// end else condition after check session expire

		return retVal;
	}

	
	public CustomerMst getModel() {

		return customerMst;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public CustomerMst getCustomerMst() {
		return customerMst;
	}

	public void setCustomerMst(CustomerMst customerMst) {
		this.customerMst = customerMst;
	}

	public Collection<Address> getCustomerAddresses() {
		return customerAddresses;
	}

	public void setCustomerAddresses(Collection<Address> customerAddresses) {
		this.customerAddresses = customerAddresses;
	}

	public Collection<Address> getAssetAddresses() {
		return assetAddresses;
	}

	public void setAssetAddresses(Collection<Address> assetAddresses) {
		this.assetAddresses = assetAddresses;
	}

	public Collection<Address> getEmploymentAddresses() {
		return employmentAddresses;
	}

	public void setEmploymentAddresses(Collection<Address> employmentAddresses) {
		this.employmentAddresses = employmentAddresses;
	}

	public Collection<CustomerAsset> getCustomerAssets() {
		return customerAssets;
	}

	public void setCustomerAssets(Collection<CustomerAsset> customerAssets) {
		this.customerAssets = customerAssets;
	}

	public Collection<CustomerKYCDocs> getCustomerKYCDocs() {
		return customerKYCDocs;
	}

	public void setCustomerKYCDocs(Collection<CustomerKYCDocs> customerKYCDocs) {
		this.customerKYCDocs = customerKYCDocs;
	}

	public Collection<CustomerKYCFamily> getCustomerKYCFamilys() {
		return customerKYCFamilys;
	}

	public void setCustomerKYCFamilys(
			Collection<CustomerKYCFamily> customerKYCFamilys) {
		this.customerKYCFamilys = customerKYCFamilys;
	}

	public Collection<CustomerBusinessDtls> getCustomerBusinessDtls() {
		return customerBusinessDtls;
	}

	public void setCustomerBusinessDtls(
			Collection<CustomerBusinessDtls> customerBusinessDtls) {
		this.customerBusinessDtls = customerBusinessDtls;
	}

	public Collection<CustomerEmploymentDtls> getCustomerEmploymentDtls() {
		return customerEmploymentDtls;
	}

	public void setCustomerEmploymentDtls(
			Collection<CustomerEmploymentDtls> customerEmploymentDtls) {
		this.customerEmploymentDtls = customerEmploymentDtls;
	}

	public Collection<CustomerContact> getCustomerContacts() {
		return customerContacts;
	}

	public void setCustomerContacts(Collection<CustomerContact> customerContacts) {
		this.customerContacts = customerContacts;
	}

	public Collection<TenantMst> getTenants() {
		return tenants;
	}

	public void setTenants(Collection<TenantMst> tenants) {
		this.tenants = tenants;
	}

	public Address getAddr() {
		return addr;
	}

	public void setAddr(Address addr) {
		this.addr = addr;
	}

	public CustomerContact getCustomerContact() {
		return customerContact;
	}

	public void setCustomerContact(CustomerContact customerContact) {
		this.customerContact = customerContact;
	}

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public TenantMst getTenantMst() {
		return tenantMst;
	}

	public void setTenantMst(TenantMst tenantMst) {
		this.tenantMst = tenantMst;
	}

	public BranchMst getBranchMst() {
		return branchMst;
	}

	public void setBranchMst(BranchMst branchMst) {
		this.branchMst = branchMst;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static Logger getLogger() {
		return logger;
	}

}
*/