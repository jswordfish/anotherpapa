package com.infrasofttech.omning.action.transaction;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.infrasofttech.domain.entities.transaction.ScreenElement;
import com.infrasofttech.domain.entities.transaction.runtime.D009622;
import com.infrasofttech.domain.entities.transaction.runtime.D030003;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.transaction.services.D009622Service;
import com.infrasofttech.omning.transaction.services.D030003Service;
import com.infrasofttech.omning.utils.SpringUtil;

public class TransactionUtil {
	
	static D009622Service d009622Service = (D009622Service) SpringUtil.getSpringUtil().getService("d009622Service");
	static D030003Service d030003Service = (D030003Service) SpringUtil.getSpringUtil().getService("d030003Service");
	
	public static java.util.List<ScreenElement> populateDerivedFieldsFromSource(java.util.List<ScreenElement> elements, String accountIdentifier)throws OmniNGException{
		D009622 d009622 = null;
		D030003 d030003 = null;
		for(ScreenElement element : elements){
			String source = element.getSourceDerivedField();
			String identifier = element.getDerivedFieldIdentifier();
			String identifierValue = element.getDerivedFieldIdentifierValue();//doesn't make sene to capture at element level - is is runtime.
			String entity = source.substring(0, source.indexOf("."));
			String sourceAttr = source.substring(source.indexOf(".") + 1, source.length());
			Character c = sourceAttr.charAt(0);
			c = Character.toUpperCase(c);
			sourceAttr = sourceAttr.substring(1, sourceAttr.length());
			String method = "get"+c+sourceAttr;
			if(entity.equals("D009622")){
				if(d009622 == null){
					d009622 = d009622Service.getD009622ByProductAccId(accountIdentifier);
					
					if(d009622 == null){
						d009622 = new D009622();
					}
				}
				Object val = new Object();
				try {
					Method meth = d009622.getClass().getMethod(method, null);
					String value = ""+meth.invoke(d009622, null);
					
					element.setValue(value);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new OmniNGException("Wrong mapping of the field");
				} 
			}
			else if(entity.equals("D030003")){
				if(d030003 == null){
					d030003 = d030003Service.getD030003ByProductAccId(accountIdentifier);
					if(d030003== null){
						d030003 = new D030003();
					}
				}
				
				Object val = new Object();
				try {
					Method meth = d030003.getClass().getMethod(method, null);
					String value = ""+meth.invoke(d030003, null);
					//String v = val.toString();
					element.setValue(value);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new OmniNGException("Wrong mapping of the field");
				} 
			}
		}
		
		
		return elements;
	}
	
	static class SourceService{
		
		private String identifier;
		
		private java.util.List<String> params = new ArrayList<String>();

		public String getIdentifier() {
			return identifier;
		}

		public void setIdentifier(String identifier) {
			this.identifier = identifier;
		}

		public java.util.List<String> getParams() {
			return params;
		}

		public void setParams(java.util.List<String> params) {
			this.params = params;
		}
		
		
	}


}
