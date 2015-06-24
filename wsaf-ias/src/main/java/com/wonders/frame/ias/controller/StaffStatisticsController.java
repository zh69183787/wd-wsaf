package com.wonders.frame.ias.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.utils.ExcelUtil;

@Controller
@RequestMapping("/staffStatistics")
public class StaffStatisticsController {
	
	private static final String STAFF_STATISTICS_EXPORT_DATA = "staff_statistics_export_data";
	
	/**
	 * @see 按人员统计
	 * @return
	 */
	@RequestMapping(value="/make")
	public String make(Model model,HttpServletRequest request){
		 return "common/staffStatistics";
	}
	
	@ResponseBody
	@RequestMapping(value="/sendExportData")
	public void  sendExportData(HttpServletRequest request,String data){
		request.getSession().setAttribute(STAFF_STATISTICS_EXPORT_DATA, data);
	}
	
	
	@RequestMapping(value="/export")
	public void export(HttpServletRequest request,HttpServletResponse response){
		String data = (String) request.getSession().getAttribute(STAFF_STATISTICS_EXPORT_DATA);
		String [] rows = data.split(";");
		String [] head = rows[0].split(",");
		
		
		LinkedHashMap <String, String> headMap = new LinkedHashMap<String, String>();
		for(int i = 0 ; i < head.length ; i ++){
			headMap.put(i + "", head[i]);
		}
		
		
		List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
		for(int i = 1 ; i < rows.length ; i ++){
			HashMap<String,String > m = new HashMap<String, String>();
			String [] row = rows[i].split(",");
			for(int j = 0 ; j < row.length ; j ++){
				m.put(j + "", row[j]);
			}
			list.add(m);
		}

		ExcelUtil.createWorkBook("Attendance_List",list,headMap,response);
	}
	



	
}
