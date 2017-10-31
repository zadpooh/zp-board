package com.dn.common;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
public class CustomErrorController implements ErrorController {

    private static final String PATH = "/error";

    @RequestMapping(value = PATH)
    public String error(HttpServletResponse response
    		, HttpStatus httpStatus) {
    	
    	switch (response.getStatus()) {
    		case 404 :
    			return "common/error/"+HttpStatus.NOT_FOUND;
    		case 403 : 
    			return "common/error/"+HttpStatus.FORBIDDEN;
    		case 500 : 
    			return "common/error/"+HttpStatus.INTERNAL_SERVER_ERROR;
    		default : 
    			return "common/error/"+HttpStatus.NOT_FOUND;
    	}
    }

    @Override
    public String getErrorPath() {
    	return "common/error/";
    }

}