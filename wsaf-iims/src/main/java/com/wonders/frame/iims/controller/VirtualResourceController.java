package com.wonders.frame.iims.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wonders.frame.core.controller.AbstractGenericController;
import com.wonders.frame.iims.model.bo.VirtualResource;


@Controller
@RequestMapping("/virtualResource")
public class VirtualResourceController extends AbstractGenericController<VirtualResource>{
	
	/****************  虚拟资源申请   *********************************************/
	@RequestMapping(value="/virtualResourceApplyList",method=RequestMethod.GET)
	public String virtualResourceApplyList(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceApplyList";
	}
	@RequestMapping(value="/virtualResourceInnerList",method=RequestMethod.GET)
	public String virtualResourceInnerList(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInnerList";
	}
	@RequestMapping(value="/virtualResourceInfoManageList",method=RequestMethod.GET)
	public String virtualResourceInfoManageList(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInfoManageList";
	}
	@RequestMapping(value="/virtualResourceInfoLeaderList",method=RequestMethod.GET)
	public String virtualResourceInfoLeaderList(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInfoLeaderList";
	}
	@RequestMapping(value="/virtualResourceAdd",method=RequestMethod.GET)
	public String virtualResourceAdd(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceAdd";
	}
	@RequestMapping(value="/virtualResourceInnerAudit",method=RequestMethod.GET)
	public String virtualResourceInnerAudit(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInnerAudit";
	}
	@RequestMapping(value="/virtualResourceInfoManageAudit",method=RequestMethod.GET)
	public String virtualResourceInfoManageAudit(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInfoManageAudit";
	}
	@RequestMapping(value="/virtualResourceInfoLeaderAudit",method=RequestMethod.GET)
	public String virtualResourceInfoLeaderAudit(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceInfoLeaderAudit";
	}
	@RequestMapping(value="/virtualResourceDraft",method=RequestMethod.GET)
	public String virtualResourceDraft(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceDraft";
	}
	@RequestMapping(value="/virtualResourceFinish",method=RequestMethod.GET)
	public String virtualResourceFinish(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceFinish";
	}
	@RequestMapping(value="/virtualResourceWaitForImplement",method=RequestMethod.GET)
	public String virtualResourceWaitForImplement(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceWaitForImplement";
	}
	@RequestMapping(value="/virtualResourceImplementList",method=RequestMethod.GET)
	public String virtualResourceImplementList(Model model,HttpServletRequest request) {	
			 
		 return "common/virtualResourceImplementList";
	}
}
