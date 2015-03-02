/**
 * @author mahesh.laddha
 */
package com.infrasofttech.omning.orch.services.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.infrasofttech.domain.entities.MenuMst;
import com.infrasofttech.domain.entities.SectionMst;
//import com.infrasofttech.omning.AppCachingServlet;

public class CacheUtility {

	private static final Logger logger = Logger.getLogger(CacheUtility.class);

	// HttpServletRequest request = (HttpServletRequest)
	// ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpSession httpSession = null;

	public void cacheAppValues() throws Exception {
		cacheLookupValues();
		cacheRoleSectionMenuz();
		cacheEmailProp();
		//cacheAppConfigData();
		// cacheCountryValues();
		// cacheStateValues();
		// cacheDistrictCityValues();
		// cacheMunicipalityValues();
		// cacheVillageValues();
		// cacheLocationValues();
	}



	@SuppressWarnings("unchecked")
	public void cacheEmailProp() throws Exception {
	}

	/**
	 * @author mahesh.laddha, mahender.kakkerala Caching lookup values to be
	 *         used in drop downs all across the application
	 */
	@SuppressWarnings("unchecked")
	private void cacheLookupValues() {

	}

	private void cacheRoleSectionMenuz() {
	}

	public Map<String, HashSet<MenuMst>> getMapOfSectionMenuList(
			HashSet<MenuMst> menuz) {
		// System.out.println("getMapOfSectionMenuList calling........");
		Map<String, HashSet<MenuMst>> sectionMenuz = new HashMap<String, HashSet<MenuMst>>();
		Set<SectionMst> sectionFromMenuz = new HashSet<SectionMst>();
		// System.out.println("(menuz.size()........."+(menuz.size()));
		// Set<MenuMst> setMenuz = menuz.;
		// System.out.println("MAP="+menuz);

		if (null != menuz && menuz.size() > 0) {
			Iterator<MenuMst> itrMenuz = menuz.iterator();

			while (itrMenuz.hasNext()) {

				MenuMst menuMst = itrMenuz.next();

				// System.out.println("menu Name is..." +
				// menuMst.getMenuName());
				// System.out.println("section Name is..." +
				// menuMst.getSectionMst().getSectionName());
				//sectionFromMenuz.add(menuMst.getSectionMst());
			}

			Iterator<SectionMst> itrSections = sectionFromMenuz.iterator();
			TreeSet<MenuMst> treeset = new TreeSet<MenuMst>();
			while (itrSections.hasNext()) {
				HashSet<MenuMst> onlySectionMenuz = new HashSet<MenuMst>();

				String sectionName = itrSections.next().getSectionName();

				Iterator<MenuMst> itrMenuz1 = menuz.iterator();

				while (itrMenuz1.hasNext()) {
					MenuMst menu = itrMenuz1.next();
//					if (menu.getSectionMst().getSectionName()
//							.equals(sectionName)) {
//
//						// System.out.println("menu Name in list.." +
//						// menu.getMenuName());
//						onlySectionMenuz.add(menu);
//						// onlySectionMenuz.add(itrMenuz1.next());
//					}
				}

				sectionMenuz.put(sectionName, onlySectionMenuz);
			}
		}
		return sectionMenuz;
	}

	public Map<String, String> getLookupValues(String lookupCode,
			String tenantCode, String languageCode) {

		Map<String, Map<String, Map<String, String>>> mapTenant_LanguageKeyValue = new HashMap<String, Map<String, Map<String, String>>>();
		Map<String, Map<String, String>> mapLanguage_KeyValues = new HashMap<String, Map<String, String>>();
		Map<String, String> mapKeyValues = new HashMap<String, String>();

		// mapTenant_LanguageKeyValue =
		// AppCachingServlet.mapLookupCodeValues.get("CI");
		mapLanguage_KeyValues = mapTenant_LanguageKeyValue.get(tenantCode);
		mapKeyValues = mapLanguage_KeyValues.get(languageCode);

		return mapKeyValues;

	}

	private void cacheCountryValues() {

	}

	private void cacheStateValues() {

	}

	private void cacheDistrictCityValues() {

	}

	private void cacheMunicipalityValues() {

	}

	private void cacheVillageValues() {

	}

	private void cacheLocationValues() {

	}

}
