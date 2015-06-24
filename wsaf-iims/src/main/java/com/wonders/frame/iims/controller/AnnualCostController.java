package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.AnnualCost;


@Controller
@RequestMapping("/annualCost")
public class AnnualCostController extends AbstractGenericController<AnnualCost>{
	@RequestMapping(value="/annualIndex",method=RequestMethod.GET)
	public String annualIndex(Model model,HttpServletRequest request) {	
			 
		 return "common/annualIndex";
	}
	@RequestMapping(value="/annualCostService",method=RequestMethod.GET)
	public String annualCostService(Model model,HttpServletRequest request) {	
			 
		 return "common/annualCostService";
	}
	@RequestMapping(value="/annualCostAddService",method=RequestMethod.GET)
	public String annualCostAddService(Model model,HttpServletRequest request) {	
			 
		 return "common/annualCostAddService";
	}
	@RequestMapping(value="/annualCostAddOrgan",method=RequestMethod.GET)
	public String annualCostAddOrgan(Model model,HttpServletRequest request) {	
			 
		 return "common/annualCostAddOrgan";
	}
	@RequestMapping(value="/annualCostAddOrganOther",method=RequestMethod.GET)
	public String annualCostAddOrganOther(Model model,HttpServletRequest request) {	
			 
		 return "common/annualCostAddOrganOther";
	}
	@RequestMapping(value="/specialService",method=RequestMethod.GET)
	public String specialService(Model model,HttpServletRequest request) {	
			 
		 return "common/specialService";
	}
	@RequestMapping(value="/specialOrganList",method=RequestMethod.GET)
	public String specialOrganList(Model model,HttpServletRequest request) {	
			 
		 return "common/specialOrganList";
	}
	@RequestMapping(value="/specialOrganListOther",method=RequestMethod.GET)
	public String specialOrganListOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialOrganListOther";
	}
	@RequestMapping(value="/specialServiceList",method=RequestMethod.GET)
	public String specialServiceList(Model model,HttpServletRequest request) {	
			 
		 return "common/specialServiceList";
	}
	@RequestMapping(value="/annualIndexOther",method=RequestMethod.GET)
	public String annualIndexOther(Model model,HttpServletRequest request) {	
			 
		 return "common/annualIndexOther";
	}
	@RequestMapping(value="/annualCostAddServiceOther",method=RequestMethod.GET)
	public String annualCostAddServiceOther(Model model,HttpServletRequest request) {	
			 
		 return "common/annualCostAddServiceOther";
	}
	@RequestMapping(value="/specialServiceListOther",method=RequestMethod.GET)
	public String specialServiceListOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialServiceListOther";
	}
	@RequestMapping(value="/specialServiceOther",method=RequestMethod.GET)
	public String specialServiceOther(Model model,HttpServletRequest request) {	
			 
		 return "common/specialServiceOther";
	}
	
	
}
