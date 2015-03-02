package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.HolidayBranchMap;
import com.infrasofttech.exceptions.OmniNGException;

public interface HolidayBranchMapService extends OmniNGService {

	public HolidayBranchMap getHolidayBranchMapByUniqueComposite(
			String tenantId, String branchCode, String holidayDate,
			String holidayCode);

	public HolidayBranchMap saveOrUpdate(HolidayBranchMap entity)
			throws OmniNGException;

	public List<HolidayBranchMap> getHolidayBranchMapBysetNo(String tenantId,
			Long setNo) throws OmniNGException;

	public HolidayBranchMap enableHolidayBranchMap(String tenantId,
			String branchCode, String holidayDate, String holidayCode)
			throws OmniNGException;

	public HolidayBranchMap disableHolidayBranchMap(String tenantId,
			String branchCode, String holidayDate, String holidayCode)
			throws OmniNGException;
}
