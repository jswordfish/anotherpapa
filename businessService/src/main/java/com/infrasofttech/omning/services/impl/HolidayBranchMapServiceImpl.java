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
import com.infrasofttech.domain.entities.HolidayBranchMap;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.IHolidayBranchMapDAO;

@Service("holidayBranchMapService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class HolidayBranchMapServiceImpl extends
		OmniNGServiceImpl<Long, HolidayBranchMap> implements
		com.infrasofttech.omning.services.HolidayBranchMapService {
	@Autowired
	protected IHolidayBranchMapDAO holidayBranchMapDAO;

	@PostConstruct
	public void init() throws Exception {
		super.setDAO((JPADAO) holidayBranchMapDAO);
	}

	@PreDestroy
	public void destroy() {
	}

	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		holidayBranchMapDAO.setEntityManager(entityManager);
	}

	// --------------------------

	public HolidayBranchMap getHolidayBranchMapByUniqueComposite(
			String tenantId, String branchCode, String holidayDate,
			String holidayCode) {
		Map<String, String> queryParams = new HashMap<String, String>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("branchCode", branchCode);
		queryParams.put("holidayDate", holidayDate);
		queryParams.put("holidayCode", holidayCode);

		@SuppressWarnings("unchecked")
		List<HolidayBranchMap> holidayBranchMaps = (List<HolidayBranchMap>) findByNamedQueryAndNamedParams(
				"HolidayBranchMap.getHolidayBranchMap", queryParams);
		if (holidayBranchMaps == null) {
			return null;
		} else if (holidayBranchMaps != null && holidayBranchMaps.size() == 0) {
			return null;
		}
		return holidayBranchMaps.get(0);
	}

	public HolidayBranchMap saveOrUpdate(HolidayBranchMap entity)
			throws OmniNGException {
		// Find out whether object exists or not
		HolidayBranchMap holidayBranchMap = getHolidayBranchMapByUniqueComposite(
				entity.getTenantId(), entity.getBranchCode(),
				entity.getHolidayDate(), entity.getHolidayCode());
		if (holidayBranchMap == null) {
			// create mode
			entity.setIsActive(true);
			return super.saveOrUpdate(entity);
		} else {
			// update
			Long id = holidayBranchMap.getId();
			try {
				Mapper mapper = new DozerBeanMapper();
				mapper.map(entity, holidayBranchMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			holidayBranchMap.setId(id);
			entity.setIsActive(true);
			return super.saveOrUpdate(holidayBranchMap);
		}
	}

	public List<HolidayBranchMap> getHolidayBranchMapBysetNo(String tenantId,
			Long setNo) throws OmniNGException {

		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("setNo", setNo);

		@SuppressWarnings("unchecked")
		List<HolidayBranchMap> holidayBranchMaps = (List<HolidayBranchMap>) findByNamedQueryAndNamedParams(
				"HolidayBranchMap.getHolidayBranchMapBySetNo", queryParams);
		if (holidayBranchMaps == null) {

			return null;
		} else if (holidayBranchMaps != null && holidayBranchMaps.size() == 0) {

			return null;
		}

		return holidayBranchMaps;
	}

	public HolidayBranchMap enableHolidayBranchMap(String tenantId,
			String branchCode, String holidayDate, String holidayCode)
			throws OmniNGException {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("tenantId", tenantId);
		queryParams.put("branchCode", branchCode);
		queryParams.put("holidayDate", holidayDate);
		queryParams.put("holidayCode", holidayCode);
		@SuppressWarnings("unchecked")
		List<HolidayBranchMap> holidayBranchMaps = (List<HolidayBranchMap>) findByNamedQueryAndNamedParams(
				"HolidayBranchMap.getEnabledHolidayBranchMap", queryParams);

		if (holidayBranchMaps == null || holidayBranchMaps.size() == 0) {
			throw new OmniNGException(":::Holiday Branch NOT Found");
		} else {
			// set active to true
			HolidayBranchMap holidayBranchMap = holidayBranchMaps.get(0);
			holidayBranchMap.setIsActive(true);
			return saveOrUpdate(holidayBranchMap);
		}

	}

	public HolidayBranchMap disableHolidayBranchMap(String tenantId,
			String branchCode, String holidayDate, String holidayCode)
			throws OmniNGException {
		HolidayBranchMap holidayBranchMap = getHolidayBranchMapByUniqueComposite(
				tenantId, branchCode, holidayDate, holidayCode);
		if (holidayBranchMap == null) {
			throw new OmniNGException();
		} else {
			// set active to false
			holidayBranchMap.setIsActive(false);
			return super.saveOrUpdate(holidayBranchMap);
		}

	}

}
