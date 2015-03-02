package com.infrasofttech.omning.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.PrdAcNoMst;
import com.infrasofttech.domain.entities.PrdAcNumberConfig;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IPrdAcNoMstDAO;
import com.infrasofttech.omning.services.ParamsCheckingAcService;

@Service("prdAcNoMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class PrdAcNoMstServiceImpl extends OmniNGServiceImpl<Long, PrdAcNoMst>
		implements com.infrasofttech.omning.services.PrdAcNoMstService {
	@Autowired
	protected IPrdAcNoMstDAO prdAcNoMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) prdAcNoMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		prdAcNoMstDAO.setEntityManager(entityManager);
	}

	//----------------------------------------

	public PrdAcNoMst getPrdAcNoByUniqueComposite(String tenantId,
			String branchCode, String moduleCode, String productCode,
			String customerNumber, String accountNumber) throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("branchCode", branchCode);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("customerNumber", customerNumber);
		queryParams.put("accountNumber", accountNumber);
		@SuppressWarnings("unchecked")
		List<PrdAcNoMst> prdAcNoz = (List<PrdAcNoMst>)findByNamedQueryAndNamedParams("PrdAcNo.getPrdAcNo", 
				queryParams);
		if (prdAcNoz == null) {
			return null;
		} else if (prdAcNoz != null && prdAcNoz.size() == 0) {
			return null;
		}
		return prdAcNoz.get(0);
	}

	public PrdAcNoMst saveOrUpdate(PrdAcNoMst entity) throws OmniNGException {
		// Find out whether object exists or not
		PrdAcNoMst prdAcNo = getPrdAcNoByUniqueComposite(
				entity.getTenantId(), entity.getBranchCode(), entity.getModuleCode(), 
				entity.getProductCode(), entity.getCustomerNumber(), entity.getAccountNumber());
		if (prdAcNo == null) {
			// create mode
			
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = prdAcNo.getId();
			try{
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, prdAcNo);
			}catch(Exception e){
				e.printStackTrace();
			}
			prdAcNo.setId(id);
			return super.saveOrUpdate(prdAcNo);
		}
	}

	public PrdAcNoMst enablePrdAcNo(String tenantId, String branchCode,
			String moduleCode, String productCode, String customerNumber, String accountNumber)
			throws OmniNGException {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("branchCode", branchCode);
		queryParams.put("moduleCode", moduleCode);
		queryParams.put("productCode", productCode);
		queryParams.put("customerNumber", customerNumber);
		queryParams.put("accountNumber", accountNumber);
		@SuppressWarnings("unchecked")
		List<PrdAcNoMst> prdAcNoz = (List<PrdAcNoMst>)findByNamedQueryAndNamedParams("PrdAcNo.getDisabledPrdAcNo", 
				queryParams);
		if (prdAcNoz == null) {
			throw new OmniNGException(":::Account NOT Found");
		} else {
			// set active to true
			prdAcNoz.get(0).setIsActive(true);
			return super.saveOrUpdate(prdAcNoz.get(0));
		}
	}

	public PrdAcNoMst disablePrdAcNo(String tenantId, String branchCode,
			String moduleCode, String productCode, String customerNumber, String accountNumber)
			throws OmniNGException {
		PrdAcNoMst prdAcNo = getPrdAcNoByUniqueComposite(
				tenantId, branchCode, moduleCode, productCode, customerNumber, accountNumber);
		if (prdAcNo == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			prdAcNo.setIsActive(false);
			return super.saveOrUpdate(prdAcNo);
		}
	}

	public List<PrdAcNoMst> getActivePrdAcNo(String tenantId, String branchCode)
			throws OmniNGException {
		List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
		prdAcNoz = findAllByTenant(tenantId);
		List<PrdAcNoMst> retPrdAcNoz = new ArrayList<PrdAcNoMst>();
		if(prdAcNoz != null && prdAcNoz.size() > 0){
			for(PrdAcNoMst prdAcNoMst: prdAcNoz){
				if(prdAcNoMst.getBranchCode().equalsIgnoreCase(branchCode)){
					retPrdAcNoz.add(prdAcNoMst);
				}
			}
		}
		return retPrdAcNoz;
	}
	public List<PrdAcNoMst> getDisabledPrdAcNo(String tenantId, String branchCode) throws OmniNGException {
		List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
		prdAcNoz = findDisabled(tenantId);
		List<PrdAcNoMst> retPrdAcNoz = new ArrayList<PrdAcNoMst>();

		if(prdAcNoz != null && prdAcNoz.size() > 0){
			for(PrdAcNoMst prdAcNoMst: prdAcNoz){
				if(prdAcNoMst.getBranchCode().equalsIgnoreCase(branchCode)){
					retPrdAcNoz.add(prdAcNoMst);
				}
			}
		}
		return retPrdAcNoz;
	}

	public List<PrdAcNoMst> getActivePrdAcNoPg(String tenantId,
			String branchCode, Integer startFrom, Integer maxResults)
			throws OmniNGException {
		List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
		prdAcNoz = findAllByTenantPg(tenantId, startFrom, maxResults);
		List<PrdAcNoMst> retPrdAcNoz = new ArrayList<PrdAcNoMst>();
		if(prdAcNoz != null && prdAcNoz.size() > 0){
			for(PrdAcNoMst prdAcNoMst: prdAcNoz){
				if(prdAcNoMst.getBranchCode().equalsIgnoreCase(branchCode)){
					retPrdAcNoz.add(prdAcNoMst);
				}
			}
		}
		return retPrdAcNoz;
	}

	public List<PrdAcNoMst> getDisabledPrdAcNoPg(String tenantId,
			String branchCode, Integer startFrom, Integer maxResults)
			throws OmniNGException {
		List<PrdAcNoMst> prdAcNoz = new ArrayList<PrdAcNoMst>();
		prdAcNoz = findDisabledPg(tenantId, startFrom, maxResults);
		List<PrdAcNoMst> retPrdAcNoz = new ArrayList<PrdAcNoMst>();
		if(prdAcNoz != null && prdAcNoz.size() > 0){
			for(PrdAcNoMst prdAcNoMst: prdAcNoz){
				if(prdAcNoMst.getBranchCode().equalsIgnoreCase(branchCode)){
					retPrdAcNoz.add(prdAcNoMst);
				}
			}
		}
		return retPrdAcNoz;
	}
	
	@SuppressWarnings("unused")
	public PrdAcNoMst accountNumberGen(PrdAcNoMst prdAcNoMst , PrdAcNumberConfig prdAcNumberConfig)throws OmniNGException
	{
		Map<Integer , String >  tMap = new TreeMap<Integer, String>();
		Integer RBranch=0;
		Integer RCurrency=0;
		Integer RProduct=0;
		Integer RCustomer=0;
		Integer LBranch=0 ;
		Integer LCurrency=0;
		Integer LProduct =0;
		Integer LCustomer=0;
		Integer LAccount=0;
		Integer RAccount=0;
		String BranchCode = prdAcNoMst.getBranchCode();
		String CurrencyCode = prdAcNoMst.getCurrencyCode();
		String ProductCode = prdAcNoMst.getProductCode();
		String CustomerNumber = prdAcNoMst.getCustomerNumber();
		String accountNumber="";
		String accountLength="";
		Character cust=null;
		Character branch=null;
		Character prod = null;
		Character curren=null;
		String custnum="";
		String branchcode="";
		String prodcode="";
		String currenc="";
		if(prdAcNumberConfig.getBranchRank()!=null&& prdAcNumberConfig.getBranchLen()!=null)
		{
			LBranch=prdAcNumberConfig.getBranchLen();
			RBranch=prdAcNumberConfig.getBranchRank();
			if(LBranch>(BranchCode.length())){
				
				
				Integer b = BranchCode.length();
				Integer c = LBranch - b;
				for(int i=0 ;i<c ;i++){
					String d ="0";
					BranchCode = d+BranchCode;
				}
				tMap.put(RBranch, BranchCode);
			}
			else if(LBranch<(BranchCode.length())){
			
				
				 for ( int i = 0  ; i <LBranch ; i++ )
				 {
			         branch =  BranchCode.charAt(i);
			 branchcode=branchcode+branch;
				System.out.println("branchCode>>>>>>>>"+branchcode);
				 }
				tMap.put(RBranch, branchcode);
			}
			else if(LBranch==BranchCode.length()){
 				
 				
 				
 				
 				BranchCode=prdAcNoMst.getBranchCode();
 				tMap.put(RBranch, BranchCode);
 			}
		}
		if(prdAcNumberConfig.getCurrencyRank()!=null&&prdAcNumberConfig.getCurrencyLen()!=null)
		{
			RCurrency=prdAcNumberConfig.getCurrencyRank();
			LCurrency=prdAcNumberConfig.getCurrencyLen();
			if(LCurrency>(CurrencyCode.length())){
				
				
				Integer e = CurrencyCode.length();
				Integer f= LCurrency - e;
				for(int i=0 ;i<f ;i++){
					String g ="0";
					CurrencyCode = g+CurrencyCode;
				}
				tMap.put(RCurrency, CurrencyCode);
			}
			else if(LCurrency<(CurrencyCode.length())){
				
				
				for ( int i = 0  ; i <LCurrency ; i++ )
			         curren=  CurrencyCode.charAt(i);
				     currenc=currenc+curren;
				System.out.println("currencyCode>>>>>>>>"+currenc);
					tMap.put(RCurrency, currenc);
				}
				
			
			else if(LCurrency==(CurrencyCode.length())){							
												
					CurrencyCode = prdAcNoMst.getCurrencyCode();
						tMap.put(RCurrency, CurrencyCode);
				}
						
		}
		if(prdAcNumberConfig.getProductRank()!=null&& prdAcNumberConfig.getProductLen()!=null)
		{      LProduct=prdAcNumberConfig.getProductLen();
			RProduct=prdAcNumberConfig.getProductRank();
			if(LProduct>(ProductCode.length())){
				
				
				Integer j = ProductCode.length();
				Integer k = LProduct - j;
				for(int i=0 ;i<k ;i++){
					String l ="0";
					ProductCode = l+ProductCode;
				}
				tMap.put(RProduct, ProductCode);
			}else if(LProduct<(ProductCode.length())){
				
				 for ( int i = 0  ; i <LProduct ; i++ )
				 {
					 prod =  ProductCode.charAt(i);
				   prodcode=prodcode+prod;
				System.out.println("ProductCode>>>>>>>>"+prodcode);
				 }
				
				tMap.put(RProduct, prodcode);
			}
			else if(LProduct==(ProductCode.length())){
				
				
				ProductCode=prdAcNoMst.getProductCode();
				
				
				tMap.put(RProduct, ProductCode);
			}
				
		}
		
		if(prdAcNumberConfig.getCustomerRank()!=null&&prdAcNumberConfig.getCustomerLen()!=null)
		{	LCustomer=prdAcNumberConfig.getCustomerLen();
			RCustomer=prdAcNumberConfig.getCustomerRank();
			if(LCustomer>(CustomerNumber.length())){
				
				
				Integer n = CustomerNumber.length();
				Integer o = LCustomer - n;
				for(int i=0 ;i<o ;i++){
					String p ="0";
					CustomerNumber = p+CustomerNumber;
				}
				tMap.put(RCustomer, CustomerNumber);
			}
			else if(LCustomer<(CustomerNumber.length())){
			
				 for ( int i = 0  ; i <LCustomer ; i++ )
				 {
				 cust=CustomerNumber.charAt(i);
			     custnum=custnum+cust;
				System.out.println("CustomerNumber>>>>>>>>"+custnum);
				 }
				tMap.put(RCustomer, custnum);
			}
			else if(LCustomer==(CustomerNumber.length())){
            	
            	   CustomerNumber=prdAcNoMst.getCustomerNumber();
				tMap.put(RCustomer, CustomerNumber);
			}
		}		
		if(prdAcNumberConfig.getAccountLen()!=null&&prdAcNumberConfig.getAccountRank()!=null)
		{	LAccount=prdAcNumberConfig.getAccountLen();
			RAccount=prdAcNumberConfig.getAccountRank();
			 String valu="";
			 int number=9;
			for(int j=0;j<LAccount; j++){
				  valu = valu+number;
				 
				  }
				  Integer value = Integer.parseInt(valu);
				Random r = new Random();
				List<Integer> codes = new ArrayList<Integer>();
				for (int i = 0; i < 10; i++)
				{
				    int x = r.nextInt(value);
				    while (codes.contains(x))
				        x = r.nextInt(value);
				    codes.add(x);
				}
				String accountnumberRandom = String.format("%0"+LAccount+"d", codes.get(0));
			
				 
			tMap.put(RAccount, accountnumberRandom);
			
		}		
			
										
		
		for(Map.Entry<Integer,String> entry : tMap.entrySet()) {
			  Integer key = entry.getKey();
			  String value = entry.getValue();
			  accountNumber = accountNumber+value;
			  System.out.println(key + " => " + value);
			}
		
		prdAcNoMst.setAccountNumber(accountNumber);
		return prdAcNoMst;
		
	}

	
	
}
