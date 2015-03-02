package com.infrasofttech.omning.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringUtil {

	private ApplicationContext applicationContext;;
	private static SpringUtil springUtil = new SpringUtil();

	private SpringUtil() {
		try {
			applicationContext = new ClassPathXmlApplicationContext("appContext.xml");
		} catch (BeansException e) {
			e.printStackTrace();
			throw e;
		}
	}

	public Object getService(String service) {
		return applicationContext.getBean(service);
	}

	public static SpringUtil getSpringUtil() {
		if (springUtil == null) {
			synchronized (SpringUtil.class) {

				springUtil = new SpringUtil();
			}
		}
		return springUtil;
	}
}