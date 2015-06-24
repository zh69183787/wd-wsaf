package com.wonders.frame.iims.crmmodel.bo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="pc_n_list_his")
public class PcNListHis implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	// Fields
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
	private Date endTime;
	

	// Constructors
	/** default constructor */
	public PcNListHis() {}

	/** full constructor */
	public PcNListHis(String serialNo, String lineNo, String buildAddress,
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
			Date firstLogTime, Date endTime) {
		super();
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
	}


	
	
	// Property accessors
	@Id
	@Column(name="serial_no",length=50,nullable=false)
	public String getSerialNo() {
		return serialNo;
	}

	
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	@Column(name="line_no",length=50)
	public String getLineNo() {
		return lineNo;
	}

	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}

	@Column(name="build_address",length=50)
	public String getBuildAddress() {
		return buildAddress;
	}

	public void setBuildAddress(String buildAddress) {
		this.buildAddress = buildAddress;
	}

	@Column(name="address",length=50)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name="user_name",length=50)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name="user_phone1",length=20)
	public String getUserPhone1() {
		return userPhone1;
	}

	public void setUserPhone1(String userPhone1) {
		this.userPhone1 = userPhone1;
	}

	@Column(name="user_phone2",length=20)
	public String getUserPhone2() {
		return userPhone2;
	}

	public void setUserPhone2(String userPhone2) {
		this.userPhone2 = userPhone2;
	}

	@Column(name="asset_owner",length=50)
	public String getAssetOwner() {
		return assetOwner;
	}

	public void setAssetOwner(String assetOwner) {
		this.assetOwner = assetOwner;
	}

	@Column(name="asset_no",length=50)
	public String getAssetNo() {
		return assetNo;
	}

	public void setAssetNo(String assetNo) {
		this.assetNo = assetNo;
	}

	@Column(name="brand",length=20)
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Column(name="style_no",length=50)
	public String getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(String styleNo) {
		this.styleNo = styleNo;
	}

	@Column(name="computer_sn",length=50)
	public String getComputerSn() {
		return computerSn;
	}

	public void setComputerSn(String computerSn) {
		this.computerSn = computerSn;
	}

	@Column(name="service_l")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getServiceL() {
		return serviceL;
	}

	public void setServiceL(Date serviceL) {
		this.serviceL = serviceL;
	}

	@Column(name="core_pro",length=20)
	public String getCorePro() {
		return corePro;
	}

	public void setCorePro(String corePro) {
		this.corePro = corePro;
	}

	@Column(name="core_fre")
	public Double getCoreFire() {
		return coreFire;
	}

	public void setCoreFire(Double coreFire) {
		this.coreFire = coreFire;
	}
	
	@Column(name="ram_style",length=20)
	public String getRamStyle() {
		return ramStyle;
	}

	public void setRamStyle(String ramStyle) {
		this.ramStyle = ramStyle;
	}

	@Column(name="ram")
	public Double getRam() {
		return ram;
	}

	public void setRam(Double ram) {
		this.ram = ram;
	}

	@Column(name="hd_rev")
	public Integer getHdRev() {
		return hdRev;
	}

	public void setHdRev(Integer hdRev) {
		this.hdRev = hdRev;
	}

	@Column(name="hd_size")
	public Integer getHdSize() {
		return hdSize;
	}

	public void setHdSize(Integer hdSize) {
		this.hdSize = hdSize;
	}

	@Column(name="dis_slot_type",length=50)
	public String getDisSlotType() {
		return disSlotType;
	}

	public void setDisSlotType(String disSlotType) {
		this.disSlotType = disSlotType;
	}

	@Column(name="dis_chip",length=50)
	public String getDisChip() {
		return disChip;
	}

	public void setDisChip(String disChip) {
		this.disChip = disChip;
	}

	@Column(name="screen_style",length=20)
	public String getScreenStyle() {
		return screenStyle;
	}

	public void setScreenStyle(String screenStyle) {
		this.screenStyle = screenStyle;
	}

	@Column(name="screen_size")
	public Integer getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(Integer screenSize) {
		this.screenSize = screenSize;
	}

	@Column(name="mac_address",length=50)
	public String getMacAddress() {
		return macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	@Column(name="ip_address",length=50)
	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	@Column(name="wifi_mac_address",length=50)
	public String getWifiMacAddress() {
		return wifiMacAddress;
	}

	public void setWifiMacAddress(String wifiMacAddress) {
		this.wifiMacAddress = wifiMacAddress;
	}

	@Column(name="os",length=20)
	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	@Column(name="vir_ware",length=50)
	public String getVirWare() {
		return virWare;
	}

	public void setVirWare(String virWare) {
		this.virWare = virWare;
	}

	@Column(name="lic_l")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLicL() {
		return licL;
	}

	public void setLicL(Date licL) {
		this.licL = licL;
	}

	@Column(name="app_l",length=250)
	public String getAppL() {
		return appL;
	}

	public void setAppL(String appL) {
		this.appL = appL;
	}

	@Column(name="ass_1",length=50)
	public String getAss1() {
		return ass1;
	}

	public void setAss1(String ass1) {
		this.ass1 = ass1;
	}

	@Column(name="ass_2",length=50)
	public String getAss2() {
		return ass2;
	}

	public void setAss2(String ass2) {
		this.ass2 = ass2;
	}

	@Column(name="ass_3",length=50)
	public String getAss3() {
		return ass3;
	}

	public void setAss3(String ass3) {
		this.ass3 = ass3;
	}

	@Column(name="record_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

	@Column(name="maintainer",length=50)
	public String getMaintainer() {
		return maintainer;
	}

	public void setMaintainer(String maintainer) {
		this.maintainer = maintainer;
	}

	@Column(name="beizhu",length=250)
	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	@Column(name="maint_dep",length=50)
	public String getMainDep() {
		return mainDep;
	}

	public void setMainDep(String mainDep) {
		this.mainDep = mainDep;
	}

	@Column(name="line_no_pro",length=50)
	public String getLineNoPro() {
		return lineNoPro;
	}

	public void setLineNoPro(String lineNoPro) {
		this.lineNoPro = lineNoPro;
	}

	@Column(name="pro_class",length=50)
	public String getProClass() {
		return proClass;
	}

	public void setProClass(String proClass) {
		this.proClass = proClass;
	}

	@Column(name="ass_1_port",length=50)
	public String getAss1Port() {
		return ass1Port;
	}

	public void setAss1Port(String ass1Port) {
		this.ass1Port = ass1Port;
	}

	@Column(name="ass_2_port",length=50)
	public String getAss2Port() {
		return ass2Port;
	}

	public void setAss2Port(String ass2Port) {
		this.ass2Port = ass2Port;
	}

	@Column(name="ass_3_port",length=50)
	public String getAss3Port() {
		return ass3Port;
	}

	public void setAss3Port(String ass3Port) {
		this.ass3Port = ass3Port;
	}

	@Column(name="faci_class",length=10)
	public String getFaciClass() {
		return faciClass;
	}

	public void setFaciClass(String faciClass) {
		this.faciClass = faciClass;
	}

	@Column(name="first_log_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getFirstLogTime() {
		return firstLogTime;
	}

	public void setFirstLogTime(Date firstLogTime) {
		this.firstLogTime = firstLogTime;
	}

    public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
    
    @Column(name="end_time")
    @Temporal(TemporalType.TIMESTAMP)
    public Date getEndTime() {
		return endTime;
	}


	@Override
	public String toString() {
		return "PcNListHis [serialNo=" + serialNo + ", lineNo=" + lineNo
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
				+ ", endTime=" + endTime + "]";
	}
}
