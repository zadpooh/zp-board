package com.dn.spring.user;

import com.dn.common.utils.ViewUtils;
import com.dn.spring.annotations.RequestProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/dnmanager/user")
@RequestProperty(title="Dashboard", layout="default")
public class UserManagerController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login")
	@RequestProperty(layout="blank")
	public String login(Model model
				,String target
			){
		
		model.addAttribute("target",target);
		
		return ViewUtils.view();
	}

}

