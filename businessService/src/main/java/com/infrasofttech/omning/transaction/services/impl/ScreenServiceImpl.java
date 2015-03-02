package com.infrasofttech.omning.transaction.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;

import org.apache.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.dao.basic.JPADAO;
import com.infrasofttech.domain.entities.transaction.Screen;
import com.infrasofttech.domain.entities.transaction.ScreenRow;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.impl.OmniNGServiceImpl;
import com.infrasofttech.omning.transaction.IScreenDAO;
import com.infrasofttech.omning.transaction.services.ScreenService;

@Service("screenService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = OmniNGException.class)
public class ScreenServiceImpl extends OmniNGServiceImpl<Long, Screen>
implements ScreenService {

	private static final Logger logger = Logger
		.getLogger(ScreenService.class);
	@Autowired
	protected IScreenDAO screenDAO;
	
	@PostConstruct
	public void init() throws Exception {
	super.setDAO((JPADAO) screenDAO);
	}
	
	@PreDestroy
	public void destroy() {
	}
	
	@Override
	public void setEntityManagerOnDao(EntityManager entityManager) {
		screenDAO.setEntityManager(entityManager);
	}

	public Screen saveOrUpdate(Screen screen) throws OmniNGException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("screenName", screen.getScreenName());
		params.put("tenantId", screen.getTenantId());
		params.put("active", screen.getActive());
		String qry = "Screen.getScreenByName";
		List<Screen> screens = super.findByNamedQueryAndNamedParams(qry, params);
		if(screens.size() == 0) {
			//create mode
			return super.saveOrUpdate(screen);
		}
		else if(screens.size() == 1) {
			//update mode
			List<ScreenRow> rows = screen.getRows();
			Screen screenFromDb = screens.get(0);
			long id = screenFromDb.getId();
			screen.setRows(null);
			Mapper mapper = new DozerBeanMapper();
			mapper.map(screen, screenFromDb);
			screenFromDb.setRows(rows);
			screenFromDb.setId(id);
			super.saveOrUpdate(screenFromDb);
		}
		else {
			//this scenario shouldnt come
			throw new OmniNGException("multiple screens by same name");
		}
		return null;
	}
}

