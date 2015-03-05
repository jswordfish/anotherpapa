package com.infrasofttech.omning.action.transaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.ScreenMapper;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.omning.transaction.services.ScreenMapperService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SaveOrUpdateScreenMapper extends ActionSupport implements  ServletRequestAware { 

	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger.getLogger(TxnClientConfigCRUDAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId="";
	private String languageCode="";
	private String branchCode="";
	private String loginId="";
	
	private String errMsg = "";
	
	Map<String, String> branches = new HashMap<String, String>();
	Map<String, String> modules = new HashMap<String, String>();
	Map<String, String> products = new HashMap<String, String>();
	Map<String, String> activities = new HashMap<String, String>();
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		try{
			if (request.getSession(false) == null)
			{ 
				System.out.println("SESSION EXPIRED");
				//Session expired 
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;	
				session.invalidate(); 
				retVal =  OmniConstants.LOGIN;	  
			} else {
				tenantId = (String)request.getSession().getAttribute("tenantCode");
				branchCode = (String)request.getSession().getAttribute("branchCode");
				languageCode = (String)request.getSession().getAttribute("languageCode");
				loginId = (String)request.getSession().getAttribute("loginID");
				
				ScreenMapper screenMapper = (ScreenMapper) request.getSession().getAttribute("screenMapper");
				if(screenMapper != null){
					screenMapper.setTenantId(tenantId);
				}
				
				ScreenMapperService screenMapperService = (ScreenMapperService) SpringUtil.getSpringUtil().getService("screenMapperService");
				String onlyList = request.getParameter("onlyList");
				
				try {
					if(!(onlyList != null && onlyList.contains("yes"))){
							if(screenMapper != null){
								//update screen elements with right selections
								screenMapper = setScreenMapperWithUserSelections(screenMapper);
								screenMapperService.saveOrUpdate(screenMapper);
							}
						
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					logger.error("can not save screen mapper", e);
					retVal = OmniConstants.FAILURE;
					return retVal;
				}
				// Action logic here...
				List<ScreenMapper> mappers = screenMapperService.findAllByTenant(tenantId);
				request.setAttribute("screenMappers", mappers);
				retVal = OmniConstants.SUCCESS;
			}
		}catch(Exception e){
			logger.error("can not save screen mapper", e);
			e.printStackTrace();
			retVal = OmniConstants.FAILURE;
		}finally{

		}
		return retVal;
	}
	
	private ScreenMapper setScreenMapperWithUserSelections(ScreenMapper screenMapper){
		List<ScreenElement> fields = (List<ScreenElement>) request.getSession().getAttribute("fields");
		Map<String, ScreenElement> params = new HashMap<String, ScreenElement>();
			for(ScreenElement field : fields){
				params.put(field.getName(), field);
			}
		
		
		Screen txScreen = screenMapper.getTransactionScreen();
		Screen infoScreen = screenMapper.getInfoScreen();
		Screen balScreen = screenMapper.getBalancesScreen();
		int txRows = txScreen.getRows().size();
		int infoRows = infoScreen.getRows().size();
		int balRows = balScreen.getRows().size();
		
		List<ScreenRow> screenTxRows = new ArrayList<ScreenRow>();
		for(int i=0;i<txRows;i++){
			ScreenRow row = txScreen.getRows().get(i);
			List<ScreenElement> elements = new ArrayList<ScreenElement>();
			String firstCol = request.getParameter("firstTxn"+i);
			String secondCol = request.getParameter("secondTxn"+i);
			ScreenElement element1 = params.get(firstCol);
			ScreenElement element2 = params.get(secondCol);
			elements.add(element1);
			elements.add(element2);
			row.setScreenElements(elements);
			screenTxRows.add(row);
		}
		
		List<ScreenRow> screenInfoRows = new ArrayList<ScreenRow>();
		for(int i=0;i<txRows;i++){
			ScreenRow row = infoScreen.getRows().get(i);
			List<ScreenElement> elements = new ArrayList<ScreenElement>();
			String firstCol = request.getParameter("firstInfo"+i);
			String secondCol = request.getParameter("secondInfo"+i);
			ScreenElement element1 = params.get(firstCol);
			ScreenElement element2 = params.get(secondCol);
			elements.add(element1);
			elements.add(element2);
			row.setScreenElements(elements);
			screenInfoRows.add(row);
		}
		
		List<ScreenRow> screenBalRows = new ArrayList<ScreenRow>();
		for(int i=0;i<balRows;i++){
			ScreenRow row = infoScreen.getRows().get(i);
			List<ScreenElement> elements = new ArrayList<ScreenElement>();
			String firstCol = request.getParameter("firstBal"+i);
			String secondCol = request.getParameter("secondBal"+i);
			ScreenElement element1 = params.get(firstCol);
			ScreenElement element2 = params.get(secondCol);
			elements.add(element1);
			elements.add(element2);
			row.setScreenElements(elements);
			screenBalRows.add(row);
		}
		
		txScreen.setRows(screenTxRows);
		infoScreen.setRows(screenInfoRows);
		balScreen.setRows(screenBalRows);
		return screenMapper;
		
	}
	
	
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
}
