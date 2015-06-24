package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.Equipment;


@Controller
@RequestMapping("/equipment")
public class EquipmentController extends AbstractGenericController<Equipment>{
	
	@RequestMapping(value="/EquipmentList",method=RequestMethod.GET)
	public String EquipmentmanagementList(Model model,HttpServletRequest request) {	
			 
		 return "common/EquipmentmanagementList";
	}
	
	@RequestMapping(value="/terminalList",method=RequestMethod.GET)
	public String TerminalList(Model model,HttpServletRequest request) {	
			 
		 return "common/terminalList";
	}
	
	@RequestMapping(value="/EquipmentMonitorView",method=RequestMethod.GET)
	public String MonitorView(Model model,HttpServletRequest request) {	
			 
		 return "common/equipmentMonitorView";
	}
	
}
