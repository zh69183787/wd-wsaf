/** 
* @Title: DateFormatUtil.java 
* @Package com.wonders.frame.core.utils 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/** 
 * @ClassName: DateFormatUtil 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 */
public class DateFormatUtil {
	private final static Logger logger=LoggerFactory.getLogger(DateFormatUtil.class);
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	
	public static final String TIME_FORMAT = "HH:mm:ss";	

	public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";	
	
	public static final String DATETIME_FORMAT_TZ = "yyyy-MM-dd'T'HH:mm:ss";	
	
	public static final String FILE_DATETIME_FORMAT = "yyyyMMddHHmmss";		
	
	
	public static String getCurrentDate() {
		return timeFormat(DATE_FORMAT,new Date());
	}	
	
	public static String getCurrentTime() {
		return timeFormat(TIME_FORMAT,new Date());
	}	
	
	public static String getCurrentDateTime() {
		return timeFormat(DATETIME_FORMAT,new Date());
	}	
	public static String getFileDateTime() {
		return timeFormat(FILE_DATETIME_FORMAT,new Date());
	}	
	
	
	public static String formatDateTime(String s) {
		 Date date=timeParse(DATETIME_FORMAT_TZ,s);
		 if(date==null){
			 date=timeParse(TIME_FORMAT,s);
		 }
		 if(date==null){
			 return s;
		 }else{
			 return timeFormat(TIME_FORMAT,date);
		 }
	}	
	
	public static String timeFormat(String format,Date day) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			String date = sdf.format(day);
			return date;
		} catch (Exception e) {
			logger.error("Exception Throwable", e);
		}
		return null;
	}
	
	public static Date timeParse(String format,String time) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			Date date = sdf.parse(time);
			return date;
		} catch (Exception e) {
			logger.error("Exception Throwable", e);
		}
		return null;
	}
		
	public static String getDay(int num) {	
		Date date=new Date();
		if(num!=0){
			Calendar calendar = Calendar.getInstance();		
			calendar.setTime(date);		
			calendar.add(Calendar.DAY_OF_MONTH, num);		
			date = calendar.getTime();		
		}
		SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
		String day=formatter.format(date);

		return day;
	}
	
	public static String getTime(String interval) {	
		Date date=new Date();
		String timeInterval=interval.toUpperCase();
		int intervalType;
		if(timeInterval.endsWith("H")){
			interval=timeInterval.replace("H", "");
			intervalType=Calendar.HOUR;
		}else if(timeInterval.endsWith("M")){
			interval=timeInterval.replace("M", "");
			intervalType=Calendar.MINUTE;
		}else{
			interval=timeInterval.replace("S", "");	
			intervalType=Calendar.SECOND;
		}
		if(!interval.equals("")){
			Calendar calendar = Calendar.getInstance();		
			calendar.setTime(date);					
			calendar.add(intervalType, Integer.parseInt(interval));					
			date = calendar.getTime();		
		}
		SimpleDateFormat formatter = new SimpleDateFormat(TIME_FORMAT);
		String time=formatter.format(date);

		return time;
	}	
}
