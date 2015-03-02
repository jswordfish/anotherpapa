package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.AuthEvent;

public interface IAuthEventDAO extends JPADAO<AuthEvent, Long> {
	public List<AuthEvent> showInitEventList(String tenantCode);
}
