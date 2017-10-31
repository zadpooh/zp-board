package com.dn.spring.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dn.common.utils.ViewUtils;
import com.dn.spring.annotations.RequestProperty;


@Controller
@RequestProperty(title="Main Page", layout="default")
public class MainController {
	
	@RequestMapping(value={"/","/main"})
	public String main(Model model){
		
		return ViewUtils.getView("/main/index");
	}

}
