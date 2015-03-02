package com.infrasofttech.omning.services.impl;

import java.util.Date;
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
import com.infrasofttech.domain.entities.LoanInterestMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.ILoanInterestMstDao;
import com.infrasofttech.omning.services.LoanInterestMstService;

@Service("loanInterestMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class LoanInterestMstServiceImpl extends OmniNGServiceImpl<Long, LoanInterestMst>
		implements LoanInterestMstService {
	private static final Logger logger = Logger
			.getLogger(LoanInterestMstServiceImpl.class);

	@Autowired
	protected ILoanInterestMstDao loanInterestMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) loanInterestMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		loanInterestMstDAO.setEntityManager(entityManager);
	}

	public LoanInterestMst getLIMstByUniqueComposition(String tenantId, String productCode,
				String currencyCode, Date effFromDate) throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("productCode", productCode);
		queryParams.put("tenantId", tenantId);
		queryParams.put("currencyCode", currencyCode);
		queryParams.put("effFromDate", effFromDate);

		List<LoanInterestMst> LoanInterestMsts = (List<LoanInterestMst>)findByNamedQueryAndNamedParams("LoanInterestMst.getLoanInterestMst", queryParams);

		if (LoanInterestMsts == null) {
			return null;
		} else if (LoanInterestMsts != null && LoanInterestMsts.size() == 0) {
			return null;
		}
		return LoanInterestMsts.get(0);
	}

	
	
}

