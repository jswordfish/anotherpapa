package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.AuthMatrix;

public interface IAuthMatrixMgmtDAO extends JPADAO<AuthMatrix, Long> {
	public List<AuthMatrix> authMatrixList(String tenantCode);

	public AuthMatrix getId();;
}
