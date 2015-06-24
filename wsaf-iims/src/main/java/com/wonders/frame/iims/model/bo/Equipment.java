package com.wonders.frame.iims.model.bo;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.tags.ShowInView.OperateType;

/**
 * IimsEquipment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "IIMS_EQUIPMENT")
@ShowInView(name="设备")
public class Equipment implements java.io.Serializable {
	@ShowInView(noUse=true)
	private static final long serialVersionUID = -7643008531164822967L;
	@ShowInView(name="ID",operateType=OperateType.HIDDEN)
	private Integer id;
	@ShowInView(name="设备编号",operateType=OperateType.SELECT,ccateType="equipmentMainType,equipmentType")
	private String equipmentNum;
	@ShowInView(name="厂商名称")
	private String equipmentName;
	@ShowInView(name="型号")
	private String modelNumber;
	@ShowInView(name="资产分类",operateType=OperateType.SELECT,ccateType="assetCategory")
	private String assetCategory;
	@ShowInView(name="设备重要性",operateType=OperateType.SELECT,ccateType="equipmentImportance")
	private String importance;	
	@ShowInView(name="主状态",operateType=OperateType.SELECT,ccateType="equipmentMainStatus")
	private String mainStatus;
	@ShowInView(name="子状态")
	private String subStatus;
	@ShowInView(name="资产管理员")
	private String equipmentManager;
	@ShowInView(name="使用人")
	private String equipmentUser;
	@ShowInView(name="条码号")
	private String barCode;
	@ShowInView(name="资产等级")
	private String assetLevel;
	@ShowInView(name="财务资产编号")
	private String assetNum;
	@ShowInView(name="物理位置")
	private String physicalLocation;
	@ShowInView(name="IP地址")
	private String ipAddress;
	@ShowInView(name="mac地址")
	private String macAddress;
	@ShowInView(name="主机名")
	private String hostName;
	@ShowInView(name="序列号")
	private String seriesNumber;
	@ShowInView(name="采购时间")
	private Date purchaseTime;
	@ShowInView(name="用途描述")
	private String useDescription;
	@ShowInView(name="CPU")
	private String cpu;
	@ShowInView(name="内存")
	private String memory;
	@ShowInView(name="硬盘")
	private String hardDisk;
	@ShowInView(name="保修期")
	private String warranty;
	@ShowInView(name="尺寸")
	private String dimension;
	@ShowInView(name="备注")
	private String remarks;
	@ShowInView(name="逻辑删除标志位",operateType=OperateType.HIDDEN)
	private Integer removed;

	// Constructors

	/** default constructor */
	public Equipment() {
		this.removed=0;
	}

	/** minimal constructor */
	public Equipment(Integer id, String equipmentNum,
			String equipmentName, String physicalLocation, String ipAddress,
			String macAddress, Integer removed) {
		this.id = id;
		this.equipmentNum = equipmentNum;
		this.equipmentName = equipmentName;
		this.physicalLocation = physicalLocation;
		this.ipAddress = ipAddress;
		this.macAddress = macAddress;
		this.removed = removed;
	}

	/** full constructor */
	public Equipment(Integer id, String equipmentNum,
			String equipmentName, String modelNumber, String assetCategory,
			String importance, String mainStatus, String subStatus,
			String equipmentManager, String equipmentUser, String barCode,
			String assetLevel, String assetNum, String physicalLocation,
			String ipAddress, String macAddress, String hostName,
			String seriesNumber, Date purchaseTime, String useDescription,
			String cpu, String memory, String hardDisk, String warranty,
			String dimension, String remarks, Integer removed) {
		this.id = id;
		this.equipmentNum = equipmentNum;
		this.equipmentName = equipmentName;
		this.modelNumber = modelNumber;
		this.assetCategory = assetCategory;
		this.importance = importance;
		this.mainStatus = mainStatus;
		this.subStatus = subStatus;
		this.equipmentManager = equipmentManager;
		this.equipmentUser = equipmentUser;
		this.barCode = barCode;
		this.assetLevel = assetLevel;
		this.assetNum = assetNum;
		this.physicalLocation = physicalLocation;
		this.ipAddress = ipAddress;
		this.macAddress = macAddress;
		this.hostName = hostName;
		this.seriesNumber = seriesNumber;
		this.purchaseTime = purchaseTime;
		this.useDescription = useDescription;
		this.cpu = cpu;
		this.memory = memory;
		this.hardDisk = hardDisk;
		this.warranty=warranty;
		this.dimension = dimension;
		this.remarks = remarks;
		this.removed = removed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="Generator")   
	@SequenceGenerator(name = "Generator", sequenceName  = "seq_iims_equipment",allocationSize=1)	
	@Column(name = "ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "EQUIPMENT_NUM", nullable = false, length = 20)
	public String getEquipmentNum() {
		return this.equipmentNum;
	}

	public void setEquipmentNum(String equipmentNum) {
		this.equipmentNum = equipmentNum;
	}

	@Column(name = "EQUIPMENT_NAME", nullable = false, length = 200)
	public String getEquipmentName() {
		return this.equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	@Column(name = "MODEL_NUMBER", length = 50)
	public String getModelNumber() {
		return this.modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}

	@Column(name = "ASSET_CATEGORY", length = 50)
	public String getAssetCategory() {
		return this.assetCategory;
	}

	public void setAssetCategory(String assetCategory) {
		this.assetCategory = assetCategory;
	}

	@Column(name = "IMPORTANCE", length = 50)
	public String getImportance() {
		return this.importance;
	}

	public void setImportance(String importance) {
		this.importance = importance;
	}

	@Column(name = "MAIN_STATUS", length = 50)
	public String getMainStatus() {
		return this.mainStatus;
	}

	public void setMainStatus(String mainStatus) {
		this.mainStatus = mainStatus;
	}

	@Column(name = "SUB_STATUS", length = 50)
	public String getSubStatus() {
		return this.subStatus;
	}

	public void setSubStatus(String subStatus) {
		this.subStatus = subStatus;
	}

	@Column(name = "EQUIPMENT_MANAGER", length = 50)
	public String getEquipmentManager() {
		return this.equipmentManager;
	}

	public void setEquipmentManager(String equipmentManager) {
		this.equipmentManager = equipmentManager;
	}

	@Column(name = "EQUIPMENT_USER", length = 50)
	public String getEquipmentUser() {
		return this.equipmentUser;
	}

	public void setEquipmentUser(String equipmentUser) {
		this.equipmentUser = equipmentUser;
	}

	@Column(name = "BAR_CODE", length = 50)
	public String getBarCode() {
		return this.barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	@Column(name = "ASSET_LEVEL", length = 50)
	public String getAssetLevel() {
		return this.assetLevel;
	}

	public void setAssetLevel(String assetLevel) {
		this.assetLevel = assetLevel;
	}

	@Column(name = "ASSET_NUM", length = 50)
	public String getAssetNum() {
		return this.assetNum;
	}

	public void setAssetNum(String assetNum) {
		this.assetNum = assetNum;
	}

	@Column(name = "PHYSICAL_LOCATION", nullable = false, length = 200)
	public String getPhysicalLocation() {
		return this.physicalLocation;
	}

	public void setPhysicalLocation(String physicalLocation) {
		this.physicalLocation = physicalLocation;
	}

	@Column(name = "IP_ADDRESS", nullable = false, length = 20)
	public String getIpAddress() {
		return this.ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	@Column(name = "MAC_ADDRESS", nullable = false, length = 20)
	public String getMacAddress() {
		return this.macAddress;
	}

	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}

	@Column(name = "HOST_NAME", length = 100)
	public String getHostName() {
		return this.hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	@Column(name = "SERIES_NUMBER", length = 100)
	public String getSeriesNumber() {
		return this.seriesNumber;
	}

	public void setSeriesNumber(String seriesNumber) {
		this.seriesNumber = seriesNumber;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PURCHASE_TIME", length = 7)
	public Date getPurchaseTime() {
		return this.purchaseTime;
	}

	public void setPurchaseTime(Date purchaseTime) {
		this.purchaseTime = purchaseTime;
	}

	@Column(name = "USE_DESCRIPTION", length = 1500)
	public String getUseDescription() {
		return this.useDescription;
	}

	public void setUseDescription(String useDescription) {
		this.useDescription = useDescription;
	}

	@Column(name = "CPU", length = 200)
	public String getCpu() {
		return this.cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	@Column(name = "MEMORY", length = 200)
	public String getMemory() {
		return this.memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	@Column(name = "HARD_DISK", length = 200)
	public String getHardDisk() {
		return this.hardDisk;
	}

	public void setHardDisk(String hardDisk) {
		this.hardDisk = hardDisk;
	}

	@Column(name = "WARRANTY", length = 200)
	public String getWarranty() {
		return this.warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	
	@Column(name = "DIMENSION", length = 200)
	public String getDimension() {
		return this.dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	@Column(name = "REMARKS", length = 1500)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "REMOVED", nullable = false, precision = 22, scale = 0)
	public Integer getRemoved() {
		return this.removed;
	}

	public void setRemoved(Integer removed) {
		this.removed = removed;
	}

}