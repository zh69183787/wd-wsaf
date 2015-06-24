package com.wonders.frame.icp.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.icp.model.bo.CpqMain;


@Controller
@RequestMapping("/cpqMain")
public class CpqMainController extends AbstractGenericController<CpqMain>{
    @RequestMapping(value="/cpqMainEdit",method= RequestMethod.GET)
    public String cpqMainEdit(Model model,HttpServletRequest request) {
        return "common/cpqMainEdit";
    }

    @RequestMapping(value="/cpqMainEditV",method= RequestMethod.GET)
    public String cpqMainEditV(Model model,HttpServletRequest request) {
        return "common/cpqMainEditV";
    }


    @RequestMapping(value="/cpqMainDetail",method= RequestMethod.GET)
    public String cpqMainDetail(Model model,HttpServletRequest request) {
        return "common/cpqMainDetail";
    }

    @RequestMapping(value="/cpqMainList",method=RequestMethod.GET)
    public String cpqMainList(Model model,HttpServletRequest request) {
        return "common/cpqMainList";
    }




    @RequestMapping(value="/leaderAssign",method= RequestMethod.GET)
    public String leaderAssign(Model model,HttpServletRequest request) {
        return "common/leaderAssign";
    }

    @RequestMapping(value="/deptUsers",method= RequestMethod.GET)
    public String deptUsers(Model model,HttpServletRequest request) {
        return "common/deptUsers";
    }

    @RequestMapping(value="/deptInfo",method= RequestMethod.GET)
    public String deptInfo(Model model,HttpServletRequest request) {
        return "common/deptInfo";
    }
}
