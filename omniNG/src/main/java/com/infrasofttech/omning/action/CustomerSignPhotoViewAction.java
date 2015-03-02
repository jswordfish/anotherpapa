package com.infrasofttech.omning.action;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.infrasofttech.domain.entities.CustomerMst;
import com.infrasofttech.exceptions.OmniNGException;
import com.infrasofttech.omning.services.CustomerService;
import com.infrasofttech.omning.utils.SpringUtil;
import com.infrasofttech.utils.ErrorCodes;
import com.infrasofttech.utils.OmniConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerSignPhotoViewAction extends ActionSupport implements
/* ModelDriven<BranchMst>, */ServletRequestAware {
	private static final long serialVersionUID = -5539422250920232971L;
	private static final Logger logger = Logger
			.getLogger(CustomerSignPhotoViewAction.class);
	HttpSession session = null;
	HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);

	private String retVal = OmniConstants.LOGIN;
	private String tenantId = "";
	private String branchCode = "";
	private String loginId = "";
	private String languageCode = "en";
	private String errMsg = "";
	CustomerMst customerMst = new CustomerMst();

	public String execute() throws Exception {
		try {
			if (request.getSession(false) == null) {
				System.out
						.println("CustomerSignPhotoViewAction.execute() SESSION EXPIRED");
				// Session expired
				logger.info("Session Expired");
				errMsg = ErrorCodes.SESSIONEXPIRE;
				session.invalidate();
				retVal = OmniConstants.LOGIN;
			} else {
				session = request.getSession(false);
				tenantId = (String) session.getAttribute("tenantCode");
				branchCode = (String) session.getAttribute("branchCode");
				loginId = (String) session.getAttribute("loginId");
				String customerCode = request.getParameter("customerCode");
				CustomerService customerService = (CustomerService) SpringUtil
						.getSpringUtil().getService("customerService");
				CustomerMst entity = customerService.getCustomerMstByUniqueComposite(tenantId, "001");
				if (null == entity) {
					customerMst = new CustomerMst();
					
				} else {
					customerMst = entity;
					System.out.println("customerPhoto:"+customerMst.getSignature());
					ByteArrayInputStream bis = new ByteArrayInputStream(customerMst.getSignature());
			        Iterator<?> readers = ImageIO.getImageReadersByFormatName("jpg");
			 
			        //ImageIO is a class containing static methods for locating ImageReaders
			        //and ImageWriters, and performing simple encoding and decoding. 
			 
			        ImageReader reader = (ImageReader) readers.next();
			        Object source = bis; 
			        ImageInputStream iis = ImageIO.createImageInputStream(source); 
			        reader.setInput(iis, true);
			        ImageReadParam param = reader.getDefaultReadParam();
			 
			        Image image = reader.read(0, param);
			        //got an image file
			 
			        BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
			        //bufferedImage is the RenderedImage to be written
			 
			        Graphics2D g2 = bufferedImage.createGraphics();
			        g2.drawImage(image, null, null);
			 
			        File imageFile = new File("C:\\newrose2.jpg");
			        ImageIO.write(bufferedImage, "jpg", imageFile);
			 
			        System.out.println(imageFile.getPath());
			        String imagePath = imageFile.getPath();
			        request.setAttribute("imagePath", imagePath);
					
				}
				request.setAttribute("customerMst", customerMst);
				retVal = OmniConstants.SUCCESS;
			} // END OF ELSE :: SESSION NOT EXPIRE
		} catch (Exception e) {
			e.printStackTrace();
			throw new OmniNGException();
		} finally {

		}
		return retVal;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
