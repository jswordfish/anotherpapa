package com.infrasofttech.omning.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CropTypeParam;
import com.infrasofttech.domain.entities.CurrencyMst;
import com.infrasofttech.domain.entities.FinancialYear;
import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.domain.entities.ModuleMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CropTypeParamService;
import com.infrasofttech.omning.services.CurrencyMstService;
import com.infrasofttech.omning.services.FinancialYearService;
import com.infrasofttech.omning.services.GLMstService;
import com.infrasofttech.omning.services.LookupValueService;
import com.infrasofttech.omning.services.ModuleMstService;
import com.infrasofttech.omning.utils.ErrorCodes;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class CropTypeParamCRUDAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(CropTypeParamCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	@SuppressWarnings("unused")
	private String branchCode="";
	@SuppressWarnings("unused")
	private String loginId="";
	private String languageCode="";
	@SuppressWarnings("unused")
	private String errMsg = "";
	private Date fromDate;
	private Date toDate;
	CropTypeParam cropTypeParam= new CropTypeParam();

	Map<String, String> currencies = new HashMap<String, String>();
	Map<String, String> cropType = new HashMap<String, String>();
	Map<String, String> amount = new HashMap<String, String>();
	Map<Integer, Integer> year = new HashMap<Integer, Integer>();
	Map<String, String> month = new HashMap<String, String>();
	
	
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("CropTypeParamCRUDAction.execute() SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				session = request.getSession();
				tenantId = (String) session.getAttribute("tenantCode");
				
				loginId = (String) session.getAttribute("loginId");
				languageCode = (String) session.getAttribute("languageCode");
				String mode = request.getParameter("mode");
				String cropType = request.getParameter("cropType");
			
				request.setAttribute("mode", mode);
				
				
				
				String dateFrom=request.getParameter("fromDate");
				if(request.getParameter("fromDate") != null
						&& !request.getParameter("fromDate").isEmpty()						
						&& request.getParameter("fromDate") != ""){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String dateFrom1 = (String) request
							.getParameter("fromDate");
					
					
					try {

						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(dateFrom1);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						fromDate=(Date) dateFormat.parse(fromdate1);
						System.out.println("fromDate"+fromDate);
						

					} catch (Exception e) {
						logger.error("Exception in From Date convertion......");
						System.out.println(e.getMessage());
					}

				}
				else if(null==dateFrom||dateFrom.equalsIgnoreCase("-1")){
					fromDate =  new Date();
				}
					
				String dateTo=request.getParameter("toDate");
				if( request.getParameter("toDate") != null && !request.getParameter("toDate").isEmpty()
						
						&& request.getParameter("toDate") != ""){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String dateFrom1 = (String) request
							.getParameter("toDate");
					
					
					try {

						Date date = new SimpleDateFormat("yyyy-MM-dd")
								.parse(dateFrom1);
						String fromdate1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(date);
						toDate=(Date) dateFormat.parse(fromdate1);
						System.out.println("toDate"+toDate);
						

					} catch (Exception e) {
						logger.error("Exception in To Date CropType......");
						System.out.println(e.getMessage());
					}

				}
				else if(null==dateTo||dateFrom.equalsIgnoreCase("-1")){
					toDate =  new Date();
				}
				
				
				
				
				setLookupValues();
				
				CropTypeParam cropTypeParam= new CropTypeParam();
				CropTypeParamService cropTypeParamService = (CropTypeParamService) SpringUtil.getSpringUtil().getService("cropTypeParamService");
				CropTypeParam entity = cropTypeParamService.getUniqueCropTypeParam(tenantId, cropType, fromDate);
				if(null==entity){
					cropTypeParam= new CropTypeParam();
				}else{	// UPDATE, DISABLE, ENABLE
					cropTypeParam = entity;
				}
				

				request.setAttribute("cropTypeParam", cropTypeParam);

				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new OmniNGException();
			
		}finally{
			
		}
		return retVal;
	}

	private void setLookupValues(){
	
		
		cropType = getLookupValues("CROPTYPE",languageCode,tenantId);		
		month =	getLookupValues("MONTHS", languageCode, tenantId);
		
		// Load all Currency of the tenant
		CurrencyMstService currencyMstService = (CurrencyMstService)SpringUtil.getSpringUtil().getService("currencyMstService");
		@SuppressWarnings("unchecked")
		List<CurrencyMst> currencyList = currencyMstService.findAllByTenant(tenantId);
		if(currencyList.size()>0){
		for(CurrencyMst currencyMst : currencyList){
			currencies.put(currencyMst.getCurrencyISOCode() , currencyMst.getCurrencyName());
		}
		}
		else{
			System.out.println("currency list is less than 0");
		}
		


		GregorianCalendar gc = new GregorianCalendar();
		
		int year1 = gc.get(Calendar.YEAR);
		int lastYear = gc.get(Calendar.YEAR)-1;		
		int lastOflastYr = gc.get(Calendar.YEAR)-2;
		int nextYear = gc.get(Calendar.YEAR)+1;
		int nextOfNextYr = gc.get(Calendar.YEAR)+2;
		
		
		year.put(lastYear,lastYear);
		year.put(lastOflastYr,lastOflastYr);
		year.put(year1,year1);
		year.put(nextYear,nextYear);
		year.put(nextOfNextYr,nextOfNextYr);
		
		System.out.println("year ::"+year1 +"last Year: "+lastYear +"lastOfLastYr : "+lastOflastYr +"nextYr:"+nextYear +"nextnextYr"+nextOfNextYr);
		
		
		request.setAttribute("currencies", currencies);
		request.setAttribute("cropType", cropType);
		request.setAttribute("amount", amount);
		request.setAttribute("month", month);
		request.setAttribute("year", year);
	}
	
	private Map<String, String> getLookupValues(String code, String languageCode, String tenantId){
		Map<String, String> keyVal = new HashMap<String, String>();
		
		LookupValueService obj = (LookupValueService)SpringUtil.getSpringUtil().getService("lookupValueService");
		keyVal = obj.getLookupValues(code, languageCode, tenantId);

		return keyVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
