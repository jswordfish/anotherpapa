package com.infrasofttech.omning.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.infrasofttech.domain.entities.VoucherMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IVoucherMstDAO;

@Service("voucherMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class VoucherMstServiceImpl extends OmniNGServiceImpl<Long, VoucherMst> implements
com.infrasofttech.omning.services.VoucherMstService {
@Autowired
protected IVoucherMstDAO voucherMstDAO;

	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) voucherMstDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		voucherMstDAO.setEntityManager(entityManager);
	}
	
	public VoucherMst getUniqueVoucherMstNormal(String tenantId, String branchCode, String entryDate, String batchCode, Long setNo, Long scrollNo){
		return voucherMstDAO.getUniqueVoucherMstNormal(tenantId, branchCode, entryDate, batchCode, setNo, scrollNo);
	}

	
	public VoucherMst getUniqueVoucherMst(String tenantId, String branchCode, String entryDate, String batchCode, Long setNo, Long scrollNo){
		
		if(setNo == 0 || setNo == null || scrollNo == null || scrollNo == 0){
			return null;//create
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenantId", tenantId);
		params.put("branchCode", branchCode);
		params.put("entryDate", entryDate);
		params.put("batchCode", batchCode);
		params.put("setNo", setNo);
		params.put("scrollNo", scrollNo);
		String qryName = "VoucherMst.getUniqueVoucherMst";
		List<VoucherMst> vouchers = super.findByNamedQueryAndNamedParams(qryName, params);
		if(vouchers.size() == 0){
			return null;
		}
		else if(vouchers.size() == 1){
			return vouchers.get(0);
		}
		else{
			throw new OmniNGException("Some thing really wrong");
		}
	}

	public VoucherMst saveOrUpdate(VoucherMst voucherMst)
			throws OmniNGException {
		VoucherMst voucherMstDb = getUniqueVoucherMst(voucherMst.getTenantId(), voucherMst.getBranchCode(), voucherMst.getEntryDate(), voucherMst.getBatchCode(), voucherMst.getSetNo(), voucherMst.getScrollNo());
		if(voucherMstDb == null){
			//create mode.
			//Add scroll num
			//Long scrollNo = System.currentTimeMillis();//we will get this from action class
			//voucherMst.setScrollNo(scrollNo);
			voucherMst = (VoucherMst) super.saveOrUpdate(voucherMst);
		}
		else {
			//updae mode
			Mapper mapper = new DozerBeanMapper();
			voucherMst.setId(voucherMstDb.getId());
			mapper.map(voucherMst, voucherMstDb);
			voucherMst = (VoucherMst) super.saveOrUpdate(voucherMstDb);
		}
		
		
		return voucherMst;
	}



}
