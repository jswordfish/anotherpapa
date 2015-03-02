package com.infrasofttech.omning;

import java.util.List;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.AppConfig;

public interface IAppConfigDAO extends JPADAO<AppConfig, Long> {
	public List<AppConfig> getAllAppConfigList() ;
	public void create(List<AppConfig> appConfigz) throws Exception;
	public AppConfig findById(Long id);
}
