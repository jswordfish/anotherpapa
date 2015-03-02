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
import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IHolidayMstDAO;

@Service("holidayMstService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class HolidayMstServiceImpl extends OmniNGServiceImpl<Long, HolidayMst>
		implements com.infrasofttech.omning.services.HolidayMstService {
	@Autowired
	protected IHolidayMstDAO holidayMstDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) holidayMstDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		holidayMstDAO.setEntityManager(entityManager);
	}

	// --------------------------

	public HolidayMst getHolidayMstByUniqueComposite(String tenantId,
			String holidayCode) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("holidayCode", holidayCode);
		@SuppressWarnings("unchecked")
		List<HolidayMst> holidays = (List<HolidayMst>) findByNamedQueryAndNamedParams(
				"HolidayMst.getHolidayMst", queryParams);
		if (holidays == null) {
			return null;
		} else if (holidays != null && holidays.size() == 0) {
			return null;
		}
		return holidays.get(0);
	}

	public HolidayMst saveOrUpdate(HolidayMst entity) throws OmniNGException {
		// Find out whether object exists or not
		HolidayMst holidayMst = getHolidayMstByUniqueComposite(
				entity.getTenantId(), entity.getHolidayCode());
		if (holidayMst == null) {
			// create mode
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = holidayMst.getId();
			try {
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, holidayMst);
			} catch (Exception e) {
				e.printStackTrace();
			}
			holidayMst.setId(id);
			entity.setIsActive(true);
			return super.saveOrUpdate(holidayMst);
		}
	}

	public HolidayMst enableHoliday(String tenantId, String holidayCode)
			throws OmniNGException {

		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("holidayCode", holidayCode);
		@SuppressWarnings("unchecked")
		List<HolidayMst> holidays = (List<HolidayMst>) findByNamedQueryAndNamedParams(
				"HolidayMst.getEnabledHoliday", queryParams);

		if (holidays == null || holidays.size() == 0) {
			throw new OmniNGException(":::Holiday NOT Found");
		} else {
			// set active to true
			HolidayMst holidayMst = holidays.get(0);
			holidayMst.setIsActive(true);
			return saveOrUpdate(holidayMst);
		}
	}

	public HolidayMst disableHoliday(String tenantId, String holidayCode)
			throws OmniNGException {
		HolidayMst holidayMst = getHolidayMstByUniqueComposite(tenantId,
				holidayCode);
		if (holidayMst == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			holidayMst.setIsActive(false);
			return super.saveOrUpdate(holidayMst);
		}
	}
}
