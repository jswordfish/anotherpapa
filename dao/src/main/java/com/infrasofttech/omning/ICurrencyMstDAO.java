package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.CurrencyMst;

public interface ICurrencyMstDAO extends JPADAO<CurrencyMst, Long> {
	public List<CurrencyMst> showInitCurrencyList();

	public List<CurrencyMst> listUserById(Long[] id);
}
