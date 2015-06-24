package com.wonders.frame.ias.controller;


import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.ias.model.bo.IasAttendance;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/attendance")
public class IasAttendanceController extends AbstractGenericController<IasAttendance>{
    @RequestMapping(value="/edit",method= RequestMethod.GET)
    public String attendanceEdit(Model model,HttpServletRequest request) {
        return "common/attendanceEdit";
    }

    @RequestMapping(value="/detail",method= RequestMethod.GET)
    public String attendanceDetail(Model model,HttpServletRequest request) {
        return "common/attendanceDetail";
    }

    @RequestMapping(value="/attendanceList",method=RequestMethod.GET)
    public String attendanceList(Model model,HttpServletRequest request) {
        return "common/attendanceList";
    }

}
