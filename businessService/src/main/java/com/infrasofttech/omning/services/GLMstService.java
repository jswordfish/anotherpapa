package com.infrasofttech.omning.services;

import java.util.List;

import com.infrasofttech.domain.entities.GLMst;
import com.infrasofttech.exceptions.OmniNGException;

public interface GLMstService extends OmniNGService {
	
	//public GLMst getGLMst(String tenantId, String glCode) throws OmniNGException;
	public GLMst getGLMstByUniqueComposition(String tenantId, String glCode,String fyCode) throws OmniNGException;
	public List<GLMst> getGLList(String tenantCode) throws OmniNGException;
	public GLMst saveOrUpdate(GLMst glMst)throws OmniNGException;
	public GLMst enableGL(String tenantId, String glCode,String fyCode ) throws OmniNGException;
	public GLMst disableGL(String tenantId, String glCode,String fyCode ) throws OmniNGException;
}