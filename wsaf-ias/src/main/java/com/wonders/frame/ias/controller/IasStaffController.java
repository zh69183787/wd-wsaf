package com.wonders.frame.ias.controller;


import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.ias.model.bo.IasStaff;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/staff")
public class IasStaffController extends AbstractGenericController<IasStaff>{
    @RequestMapping(value="/edit",method= RequestMethod.GET)
    public String staffEdit(Model model,HttpServletRequest request) {
        return "common/staffEdit";
    }

    @RequestMapping(value="/detail",method= RequestMethod.GET)
    public String staffDetail(Model model,HttpServletRequest request) {
        return "common/staffDetail";
    }

    @RequestMapping(value="/staffList",method=RequestMethod.GET)
    public String staffList(Model model,HttpServletRequest request) {
        return "common/staffList";
    }

}
