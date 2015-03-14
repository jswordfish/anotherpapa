package com.infrasofttech.omning.transaction.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenRowTransaction;
import com.infrasofttech.domain.entities.transaction.runtime.ScreenTransaction;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.VoucherMstService;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenTransactionDAO;
import com.infrasofttech.omning.transaction.services.ScreenTransactionService;
@Service("screenTransactionService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenTransactionServiceImpl extends OmniNGServiceImpl<Long, ScreenTransaction>
implements ScreenTransactionService {

	private static final Logger logger = Logger
		.getLogger(ScreenTransactionService.class);
	@Autowired
	protected IScreenTransactionDAO screenTransactionDAO;
	
	@Autowired
	VoucherMstService voucherMstService;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) screenTransactionDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		screenTransactionDAO.setEntityManager(entityManager);
	}

	public ScreenTransaction findUniqueScreenTransaction(String tenantId, String tNum){
		if(tNum == null){
			return null;
		}
		
		Long transactionNumber = new Long(tNum);
		if(transactionNumber == 0 || transactionNumber == null){
			return null; //not present - new transaction.
		}
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenantId", tenantId);
		params.put("transactionNumber", tNum);
		String qryName = "ScreenTransaction.getScreenTransaction";
		List<ScreenTransaction> transactions = super.findByNamedQueryAndNamedParams(qryName, params);
		if(transactions.size() == 0){
			return null;//not present - new transaction.
		}
		else if(transactions.size() == 1){
			return transactions.get(0);
		}
		else{
			throw new OmniNGException("Should not have occurred");
		}
		
	}
	
	public ScreenTransaction saveOrUpdate(ScreenTransaction screenTransaction, VoucherMst newVoucher) throws OmniNGException {
		ScreenTransaction tn = findUniqueScreenTransaction(screenTransaction.getTenantId(), screenTransaction.getTransactionNumber());
		
		screenTransaction.setRowTransactions(new ArrayList<ScreenRowTransaction>());
		screenTransaction.getVouchers().add(newVoucher);
		
		
		List<VoucherMst> vouchers = screenTransaction.getVouchers();
		List<VoucherMst> voucherMsts = new ArrayList<VoucherMst>();
		for(VoucherMst voucherMst : vouchers){
			VoucherMst voucher = null;
			if(!(voucherMst.getScrollNo() == null || voucherMst.getScrollNo() == 0 || voucherMst.getSetNo() == 0)){
				//voucher = voucherMstService.getUniqueVoucherMst(voucherMst.getTenantId(), voucherMst.getBranchCode(), voucherMst.getEntryDate(), voucherMst.getBatchCode(), voucherMst.getSetNo(), voucherMst.getScrollNo());
				voucher = voucherMstService.getUniqueVoucherMst(voucherMst.getTenantId(), voucherMst.getBranchCode(), voucherMst.getEntryDate(), voucherMst.getBatchCode(), voucherMst.getSetNo(), voucherMst.getScrollNo());
			}
			
			if(voucher == null){
				//new voucher to create
				voucher = voucherMstService.saveOrUpdate(voucherMst);
				voucherMsts.add(voucher);
			}
			else{
				//voucher already existing. No need to update.
				voucherMsts.add(voucher);
			}
		}
		//step 2 - Associate vouchers with screen transaction
		if(tn == null){
			//Long transactionNo = System.currentTimeMillis();//do it from action class. Set set and scroll num from action in voucher as well.
			screenTransaction.setVouchers(voucherMsts);
			tn = super.saveOrUpdate(screenTransaction);
			return tn;
		}
		else{
			tn.setRowTransactions(new ArrayList<ScreenRowTransaction>());
			tn.setVouchers(voucherMsts);
			tn = super.saveOrUpdate(tn);
			return tn;
		}
		
		
		
		
		 
	}
}

