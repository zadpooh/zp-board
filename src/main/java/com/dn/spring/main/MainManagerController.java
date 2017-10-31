package com.dn.spring.main;

import com.dn.common.utils.ViewUtils;
import com.dn.spring.annotations.RequestProperty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestProperty(title = "Manager Page", layout = "default")
@RequestMapping(value = "/dnmanager")
public class MainManagerController {

    @RequestMapping(value = {"/", "", "/main"})
    public String main(Model model) {
        return ViewUtils.getManagerView("/main/index");
    }

    @RequestMapping(value ="/main/config")
    public String mainConfig(Model model) {
        return ViewUtils.getManagerView("/main/config");
    }

}
