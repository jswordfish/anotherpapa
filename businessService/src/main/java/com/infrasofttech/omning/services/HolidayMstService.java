package com.infrasofttech.omning.services;

import com.infrasofttech.domain.entities.HolidayMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface HolidayMstService extends OmniNGService {

	public HolidayMst getHolidayMstByUniqueComposite(String tenantId,
			String holidayCode);

	public HolidayMst saveOrUpdate(HolidayMst entity) throws OmniNGException;

	public HolidayMst enableHoliday(String tenantId, String holidayCode)
			throws OmniNGException;

	public HolidayMst disableHoliday(String tenantId, String holidayCode)
			throws OmniNGException;

}
