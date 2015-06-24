package com.wonders.frame.iims.crmmodel.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 该vo作为封装关联实体查询到的数据
 * @author Administrator
 *
 */
public class CrmInfo implements Serializable{
private static final long serialVersionUID = 1L;
	
	// Fields
    //from PcNList、PcNListHis
	private String serialNo;
	private String lineNo;
	private String buildAddress;
	private String address;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String assetOwner;
	private String assetNo;
	private String brand;
	private String styleNo;
	private String computerSn;
	private Date serviceL;
	private String corePro;
	private Double coreFire;
	private String ramStyle;
	private Double ram;
	private Integer hdRev;
	private Integer hdSize;
	private String disSlotType;
	private String disChip;
	private String screenStyle;
	private Integer screenSize;
	private String macAddress;
	private String ipAddress;
	private String wifiMacAddress;
	private String os;
	private String virWare;
	private Date licL;
	private String appL;
	private String ass1;
	private String ass2;
	private String ass3;
	private Date recordTime;
	private String maintainer;
	private String beizhu;
	private String mainDep;
	private String lineNoPro;
	private String proClass;
	private String ass1Port;
	private String ass2Port;
	private String ass3Port;
	private String faciClass;
	private Date firstLogTime;
	
	//from PcNListHis
	private Date endTime;
	
	//来自dep_faci_his、dep_faci_his表
	private String department;
	private String department2;
	
	//来自faci_type表 一级分类
	private String lei1;
	private String name;
	
	//来自faci_type表 二级分类
	private String lei2;
	private String name2;
	
	// Constructors
	/** default constructor */
	public CrmInfo() {}

	/**分页查询CRM信息，显示简表*/
	public CrmInfo(String serialNo,String faciClass,String assetNo,String department,
			String department2,String userName, String userPhone1,
			String brand, String styleNo, Double coreFire,
			Double ram, Integer hdSize, Integer screenSize, String macAddress,
			String ipAddress, String os  ) {
		this.serialNo = serialNo;
		this.userName = userName;
		this.userPhone1 = userPhone1;
		this.assetNo = assetNo;
		this.brand = brand;
		this.styleNo = styleNo;
		this.coreFire = coreFire;
		this.ram = ram;
		this.hdSize = hdSize;
		this.screenSize = screenSize;
		this.macAddress = macAddress;
		this.ipAddress = ipAddress;
		this.os = os;
		this.faciClass = faciClass;
		this.department = department;
		this.department2 = department2;
	}
	
    /**查询指定设备编号CRM信息时使用*/
	public CrmInfo(String serialNo, String lineNo, String buildAddress,
			String address, String userName, String userPhone1,
			String userPhone2, String assetOwner, String assetNo, String brand,
			String styleNo, String computerSn, Date serviceL, String corePro,
			Double coreFire, String ramStyle, Double ram, Integer hdRev,
			Integer hdSize, String disSlotType, String disChip,
			String screenStyle, Integer screenSize, String macAddress,
			String ipAddress, String wifiMacAddress, String os, String virWare,
			Date licL, String appL, String ass1, String ass2, String ass3,
			Date recordTime, String maintainer, String beizhu, String mainDep,
			String lineNoPro, String proClass, String ass1Port,
			String ass2Port, String ass3Port, String faciClass,
			Date firstLogTime,  String department,
			String department2) {
		this.serialNo = serialNo;
		this.lineNo = lineNo;
		this.buildAddress = buildAddress;
		this.address = address;
		this.userName = userName;
		this.userPhone1 = userPhone1;
		this.userPhone2 = userPhone2;
		this.assetOwner = assetOwner;
		this.assetNo = assetNo;
		this.brand = brand;
		this.styleNo = styleNo;
		this.computerSn = computerSn;
		this.serviceL = serviceL;
		this.corePro = corePro;
		this.coreFire = coreFire;
		this.ramStyle = ramStyle;
		this.ram = ram;
		this.hdRev = hdRev;
		this.hdSize = hdSize;
		this.disSlotType = disSlotType;
		this.disChip = disChip;
		this.screenStyle = screenStyle;
		this.screenSize = screenSize;
		this.macAddress = macAddress;
		this.ipAddress = ipAddress;
		this.wifiMacAddress = wifiMacAddress;
		this.os = os;
		this.virWare = virWare;
		this.licL = licL;
		this.appL = appL;
		this.ass1 = ass1;
		this.ass2 = ass2;
		this.ass3 = ass3;
		this.recordTime = recordTime;
		this.maintainer = maintainer;
		this.beizhu = beizhu;
		this.mainDep = mainDep;
		this.lineNoPro = lineNoPro;
		this.proClass = proClass;
		this.ass1Port = ass1Port;
		this.ass2Port = ass2Port;
		this.ass3Port = ass3Port;
		this.faciClass = faciClass;
		this.firstLogTime = firstLogTime;
		this.department = department;
		this.department2 = department2;
	}

	/**查询指定设备编号的历史记录时使用*/
	public CrmInfo(String serialNo, String lineNo, String buildAddress,
			String address, String userName, String userPhone1,
			String userPhone2, String assetOwner, String assetNo, String brand,
			String styleNo, String computerSn, Date serviceL, String corePro,
			Double coreFire, String ramStyle, Double ram, Integer hdRev,
			Integer hdSize, String disSlotType, String disChip,
			String screenStyle, Integer screenSize, String macAddress,
			String ipAddress, String wifiMacAddress, String os, String virWare,
			Date licL, String appL, String ass1, String ass2, String ass3,
			Date recordTime, String maintainer, String beizhu, String mainDep,
			String lineNoPro, String proClass, String ass1Port,
			String ass2Port, String ass3Port, String faciClass,
			Date firstLogTime, Date endTime, String department,
			String department2) {
		this.serialNo = serialNo;
		this.lineNo = lineNo;
		this.buildAddress = buildAddress;
		this.address = address;
		this.userName = userName;
		this.userPhone1 = userPhone1;
		this.userPhone2 = userPhone2;
		this.assetOwner = assetOwner;
		this.assetNo = assetNo;
		this.brand = brand;
		this.styleNo = styleNo;
		this.computerSn = computerSn;
		this.serviceL = serviceL;
		this.corePro = corePro;
		this.coreFire = coreFire;
		this.ramStyle = ramStyle;
		this.ram = ram;
		this.hdRev = hdRev;
		this.hdSize = hdSize;
		this.disSlotType = disSlotType;
		this.disChip = disChip;
		this.screenStyle = screenStyle;
		this.screenSize = screenSize;
		this.macAddress = macAddress;
		this.ipAddress = ipAddress;
		this.wifiMacAddress = wifiMacAddress;
		this.os = os;
		this.virWare = virWare;
		this.licL = licL;
		this.appL = appL;
		this.ass1 = ass1;
		this.ass2 = ass2;
		this.ass3 = ass3;
		this.recordTime = recordTime;
		this.maintainer = maintainer;
		this.beizhu = beizhu;
		this.mainDep = mainDep;
		this.lineNoPro = lineNoPro;
		this.proClass = proClass;
		this.ass1Port = ass1Port;
		this.ass2Port = ass2Port;
		this.ass3Port = ass3Port;
		this.faciClass = faciClass;
		this.firstLogTime = firstLogTime;
		this.endTime = endTime;
		this.department = department;
		this.department2 = department2;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	public String getBuildAddress() {
		return buildAddress;
	}

	public void setBuildAddress(String buildAddress) {
		this.buildAddress = buildAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone1() {
		return userPhone1;
	}

	public void setUserPhone1(String userPhone1) {
		this.userPhone1 = userPhone1;
	}

	public String getUserPhone2() {
		return userPhone2;
	}

	public void setUserPhone2(String userPhone2) {
		this.userPhone2 = userPhone2;
	}

	public String getAssetOwner() {
		return assetOwner;
	}

	public void setAssetOwner(String assetOwner) {
		this.assetOwner = assetOwner;
	}

	public String getAssetNo() {
		return assetNo;
	}

	public void setAssetNo(String assetNo) {
		this.assetNo = assetNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(String styleNo) {
		this.styleNo = styleNo;
	}

	public String getComputerSn() {
		return computerSn;
	}

	public void setComputerSn(String computerSn) {
		this.computerSn = computerSn;
	}

	public Date getServiceL() {
		return serviceL;
	}

	public void setServiceL(Date serviceL) {
		this.serviceL = serviceL;
	}

	public String getCorePro() {
		return corePro;
	}

	public void setCorePro(String corePro) {
		this.corePro = corePro;
	}

	public Double getCoreFire() {
		return coreFire;
	}

	public void setCoreFire(Double coreFire) {
		this.coreFire = coreFire;
	}

	public String getRamStyle() {
		return ramStyle;
	}

	public void setRamStyle(String ramStyle) {
		this.ramStyle = ramStyle;
	}

	public Double getRam() {
		return ram;
	}

	public void setRam(Double ram) {
		this.ram = ram;
	}

	public Integer getHdRev() {
		return hdRev;
	}

	public void setHdRev(Integer hdRev) {
		this.hdRev = hdRev;
	}

	public Integer getHdSize() {
		return hdSize;
	}

	public void setHdSize(Integer hdSize) {
		this.hdSize = hdSize;
	}

	public String getDisSlotType() {
		return disSlotType;
	}

	public void setDisSlotType(String disSlotType) {
		this.disSlotType = disSlotType;
	}

	public String getDisChip() {
		return disChip;
	}

	public void setDisChip(String disChip) {
		this.disChip = disChip;
	}

	public String getScreenStyle() {
		return screenStyle;
	}

	public void setScreenStyle(String screenStyle) {
		this.screenStyle = screenStyle;
	}

	public Integer getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(Integer screenSize) {
		this.screenSize = screenSize;
	}

	public String getMacAddress() {
		return macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getWifiMacAddress() {
		return wifiMacAddress;
	}

	public void setWifiMacAddress(String wifiMacAddress) {
		this.wifiMacAddress = wifiMacAddress;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getVirWare() {
		return virWare;
	}

	public void setVirWare(String virWare) {
		this.virWare = virWare;
	}

	public Date getLicL() {
		return licL;
	}

	public void setLicL(Date licL) {
		this.licL = licL;
	}

	public String getAppL() {
		return appL;
	}

	public void setAppL(String appL) {
		this.appL = appL;
	}

	public String getAss1() {
		return ass1;
	}

	public void setAss1(String ass1) {
		this.ass1 = ass1;
	}

	public String getAss2() {
		return ass2;
	}

	public void setAss2(String ass2) {
		this.ass2 = ass2;
	}

	public String getAss3() {
		return ass3;
	}

	public void setAss3(String ass3) {
		this.ass3 = ass3;
	}

	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

	public String getMaintainer() {
		return maintainer;
	}

	public void setMaintainer(String maintainer) {
		this.maintainer = maintainer;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getMainDep() {
		return mainDep;
	}

	public void setMainDep(String mainDep) {
		this.mainDep = mainDep;
	}

	public String getLineNoPro() {
		return lineNoPro;
	}

	public void setLineNoPro(String lineNoPro) {
		this.lineNoPro = lineNoPro;
	}

	public String getProClass() {
		return proClass;
	}

	public void setProClass(String proClass) {
		this.proClass = proClass;
	}

	public String getAss1Port() {
		return ass1Port;
	}

	public void setAss1Port(String ass1Port) {
		this.ass1Port = ass1Port;
	}

	public String getAss2Port() {
		return ass2Port;
	}

	public void setAss2Port(String ass2Port) {
		this.ass2Port = ass2Port;
	}

	public String getAss3Port() {
		return ass3Port;
	}

	public void setAss3Port(String ass3Port) {
		this.ass3Port = ass3Port;
	}

	public String getFaciClass() {
		return faciClass;
	}

	public void setFaciClass(String faciClass) {
		this.faciClass = faciClass;
	}

	public Date getFirstLogTime() {
		return firstLogTime;
	}

	public void setFirstLogTime(Date firstLogTime) {
		this.firstLogTime = firstLogTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDepartment2() {
		return department2;
	}

	public void setDepartment2(String department2) {
		this.department2 = department2;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getLei1() {
		return lei1;
	}
	
	public void setLei1(String lei1) {
		this.lei1 = lei1;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getLei2() {
		return lei2;
	}
	
	public void setLei2(String lei2) {
		this.lei2 = lei2;
	}
	
	public String getName2() {
		return name2;
	}
	
	public void setName2(String name2) {
		this.name2 = name2;
	}

	@Override
	public String toString() {
		return "CrmInfo [serialNo=" + serialNo + ", lineNo=" + lineNo
				+ ", buildAddress=" + buildAddress + ", address=" + address
				+ ", userName=" + userName + ", userPhone1=" + userPhone1
				+ ", userPhone2=" + userPhone2 + ", assetOwner=" + assetOwner
				+ ", assetNo=" + assetNo + ", brand=" + brand + ", styleNo="
				+ styleNo + ", computerSn=" + computerSn + ", serviceL="
				+ serviceL + ", corePro=" + corePro + ", coreFire=" + coreFire
				+ ", ramStyle=" + ramStyle + ", ram=" + ram + ", hdRev="
				+ hdRev + ", hdSize=" + hdSize + ", disSlotType=" + disSlotType
				+ ", disChip=" + disChip + ", screenStyle=" + screenStyle
				+ ", screenSize=" + screenSize + ", macAddress=" + macAddress
				+ ", ipAddress=" + ipAddress + ", wifiMacAddress="
				+ wifiMacAddress + ", os=" + os + ", virWare=" + virWare
				+ ", licL=" + licL + ", appL=" + appL + ", ass1=" + ass1
				+ ", ass2=" + ass2 + ", ass3=" + ass3 + ", recordTime="
				+ recordTime + ", maintainer=" + maintainer + ", beizhu="
				+ beizhu + ", mainDep=" + mainDep + ", lineNoPro=" + lineNoPro
				+ ", proClass=" + proClass + ", ass1Port=" + ass1Port
				+ ", ass2Port=" + ass2Port + ", ass3Port=" + ass3Port
				+ ", faciClass=" + faciClass + ", firstLogTime=" + firstLogTime
				+ ", endTime=" + endTime + ", department=" + department
				+ ", department2=" + department2 + ", lei1=" + lei1 + ", name="
				+ name + ", lei2=" + lei2 + ", name2=" + name2 + "]";
	}
	
	
}
