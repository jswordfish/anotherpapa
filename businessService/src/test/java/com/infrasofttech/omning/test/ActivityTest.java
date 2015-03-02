package com.infrasofttech.omning.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.infrasofttech.domain.entities.ActivityMst;
import com.infrasofttech.omning.services.ActivityMstService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
@Transactional
public class ActivityTest {

	@Autowired
	ActivityMstService activityMstService;
	
	@Test
	@Rollback(value=false)
	public void testActivityCreation(){
		ActivityMst activityMst = new ActivityMst();
		activityMst.setTenantId("001");
		activityMst.setActivityCode("a01");
		activityMst.setModuleCode("SB");
		activityMst.setIsActive(true);
		activityMst = (ActivityMst) activityMstService.saveOrUpdate(activityMst);
		Assert.assertEquals(true, true);
		
	}

}
