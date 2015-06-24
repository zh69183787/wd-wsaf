package com.wonders.frame.ias.controller;


import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.ias.model.bo.IasWorkflow;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/workflow")
public class IasWorkflowController extends AbstractGenericController<IasWorkflow>{
    @RequestMapping(value="/edit",method= RequestMethod.GET)
    public String workflowEdit(Model model,HttpServletRequest request) {
        return "common/workflowEdit";
    }

    @RequestMapping(value="/detail",method= RequestMethod.GET)
    public String workflowDetail(Model model,HttpServletRequest request) {
        return "common/workflowDetail";
    }

    @RequestMapping(value="/workflowList",method=RequestMethod.GET)
    public String workflowList(Model model,HttpServletRequest request) {
        return "common/workflowList";
    }

}
