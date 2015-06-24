------------------------------------------------------------------objInfo---------------------------------------------------      
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'项目计划','projectPlan','{"entity":"com.wonders.frame.iims.model.bo.ProjectPlan"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'流程日志','workflowLog','{"entity":"com.wonders.frame.iims.model.bo.WorkflowLog"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'会议','meeting','{"entity":"com.wonders.frame.iims.model.bo.Meeting"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'网络资源','netResource','{"entity":"com.wonders.frame.iims.model.bo.NetResource"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'账号资源','accountResource','{"entity":"com.wonders.frame.iims.model.bo.AccountResource"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'互联网资源','internetResource','{"entity":"com.wonders.frame.iims.model.bo.InternetResource"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'VPN资源','vpnResource','{"entity":"com.wonders.frame.iims.model.bo.VpnResource"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'无线网络资源','wirelessResource','{"entity":"com.wonders.frame.iims.model.bo.WirelessResource"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'虚拟化资源','virtualResource','{"entity":"com.wonders.frame.iims.model.bo.VirtualResource"}',0 from dual;

insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'网络资源台帐','netResourceBook','{"entity":"com.wonders.frame.iims.model.bo.NetResourceBook"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'账号资源台帐','accountResourceBook','{"entity":"com.wonders.frame.iims.model.bo.AccountResourceBook"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'互联网资源台帐','internetResourceBook','{"entity":"com.wonders.frame.iims.model.bo.InternetResourceBook"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'VPN资源台帐','vpnResourceBook','{"entity":"com.wonders.frame.iims.model.bo.VpnResourceBook"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'虚拟化资源台帐','virtualResourceBook','{"entity":"com.wonders.frame.iims.model.bo.VirtualResourceBook"}',0 from dual;

insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'无线网络资源台账','wirelessResourceBook','{"entity":"com.wonders.frame.iims.model.bo.WirelessResourceBook"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'设备','equipment','{"entity":"com.wonders.frame.iims.model.bo.Equipment"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'赋权','power','{"entity":"com.wonders.frame.iims.model.bo.Power"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'安全定级','securityLevel','{"entity":"com.wonders.frame.iims.model.bo.SecurityLevel"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'安全定级公司','securityLevelCompany','{"entity":"com.wonders.frame.iims.model.bo.SecurityLevelCompany"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'安全自查','securityCheck','{"entity":"com.wonders.frame.iims.model.bo.SecurityCheck"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'正版化','appVersion','{"entity":"com.wonders.frame.iims.model.bo.AppVersion"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'正版化统计','appCount','{"entity":"com.wonders.frame.iims.model.bo.AppCount"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'管理人员','manager','{"entity":"com.wonders.frame.iims.model.bo.Manager"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'管理指标','target','{"entity":"com.wonders.frame.iims.model.bo.Target"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'目标计划','securityPlan','{"entity":"com.wonders.frame.iims.model.bo.SecurityPlan"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'目标计划详细','securityPlanDetail','{"entity":"com.wonders.frame.iims.model.bo.SecurityPlanDetail"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'信息安全事件','securityEvent','{"entity":"com.wonders.frame.iims.model.bo.SecurityEvent"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'信息安全问题','securityIssue','{"entity":"com.wonders.frame.iims.model.bo.SecurityIssue"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'信息安全风险','securityRisk','{"entity":"com.wonders.frame.iims.model.bo.SecurityRisk"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'年度成本','annualCost','{"entity":"com.wonders.frame.iims.model.bo.AnnualCost"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'项目成本','projectCost','{"entity":"com.wonders.frame.iims.model.bo.ProjectCost"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'合同成本','contractCost','{"entity":"com.wonders.frame.iims.model.bo.ContractCost"}',0 from dual;

insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'年度专项','special','{"entity":"com.wonders.frame.iims.model.bo.Special"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'年度专项预算','specialBudget','{"entity":"com.wonders.frame.iims.model.bo.SpecialBudget"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'年度专项项目','specialProject','{"entity":"com.wonders.frame.iims.model.bo.SpecialProject"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'年度专项合同','specialContract','{"entity":"com.wonders.frame.iims.model.bo.SpecialContract"}',0 from dual;

------------------------------------------------------------------importConfig---------------------------------------------------  
insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'dept', '单位', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'deviceNum', '设备编号', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'macAddress', 'mac地址', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appType', '软件类型', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appLevel', '软件级别', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appName', '软件名称', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appVersion', '版本号', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'authorize', '授权情况', 'appVersion_title_1', 1, 0);
------------------------------------------------------------------projectPlan---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='line');
delete from af_ccate where type='line'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'line','线路','线路号/全网字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'allLine','全网','全网' ,1 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line1','一号线','一号线' ,2 from af_ccate where type='line';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line2','二号线','二号线' ,3 from af_ccate where type='line';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line3','三号线','三号线' ,4 from af_ccate where type='line';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line4','四号线','四号线' ,5 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line5','五号线','五号线' ,6 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line6','六号线','六号线' ,7 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line7','七号线','七号线' ,8 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line8','八号线','八号线' ,9 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line9','九号线','九号线' ,10 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line10','十号线','十号线' ,11 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line11','十一号线','十一号线' ,12 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line12','十二号线','十二号线' ,13 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'line13','十三号线','十三号线' ,14 from af_ccate where type='line';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maglev','磁浮线','磁浮线' ,15 from af_ccate where type='line';

delete from af_codes where ccate_id in(select id from af_ccate where type='projectType');
delete from af_ccate where type='projectType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'projectType','项目类别','项目类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'repair','大修','大修' ,1 from af_ccate where type='projectType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'remould','更新改造','更新改造' ,2 from af_ccate where type='projectType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'new','新建','新建' ,3 from af_ccate where type='projectType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,4 from af_ccate where type='projectType';                               

delete from af_codes where ccate_id in(select id from af_ccate where type='projectStatus');
delete from af_ccate where type='projectStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'projectStatus','项目状态','项目状态字典类' from dual;                                                                      
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','部门内部申报','部门内部申报' ,1 from af_ccate where type='projectStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','信息中心审核','信息中心审核' ,2 from af_ccate where type='projectStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'toStore','入储备库','入储备库' ,3 from af_ccate where type='projectStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'toReport','台账','台账' ,4 from af_ccate where type='projectStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='auditStatus');
delete from af_ccate where type='auditStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'auditStatus','审批状态','审批状态字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','draft','草稿','草稿' ,1 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','waitForAudit','部门领导待审核','部门领导待审核' ,2 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','cancel','取消申报','取消申报' ,3 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','turnBack','退回','退回' ,4 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'inDept','finishInnerAudit','内部审核完毕','内部审核完毕' ,5 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','auditorReview','待审核','待审核' ,6 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','auditorPass','审核人审核通过','审核人审核通过' ,6 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','auditorCancel','审核人审核不通过','审核人审核不通过' ,8 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','leaderReview','待领导审核','待领导审核' ,9 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','leaderBack','领导审核退回','领导审核退回' ,10 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','meetingReview','待会议评审','待会议评审' ,11 from af_ccate where type='auditStatus';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'toInfoDept','intoStore','录入储备库','录入储备库' ,12 from af_ccate where type='auditStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityLevel');
delete from af_ccate where type='securityLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityLevel','信息安全级别','信息安全保护级别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level1','一级','一级' ,1 from af_ccate where type='securityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level2','二级','二级' ,2 from af_ccate where type='securityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level3','三级','三级' ,3 from af_ccate where type='securityLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='yearTarget');
delete from af_ccate where type='yearTarget';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'yearTarget','年度推进目标','年度推进目标字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'planOK','完成前期策划','完成前期策划' ,1 from af_ccate where type='yearTarget';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'purchaseOK','完成立项采购','完成立项采购' ,2 from af_ccate where type='yearTarget';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'implementAllOK','完成项目实施（全部）','完成项目实施（全部）' ,3 from af_ccate where type='yearTarget';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'implementPartOK','完成项目实施（部分）','完成项目实施（部分）' ,4 from af_ccate where type='yearTarget';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'initalCheckOK','完成项目初验','完成项目初验' ,4 from af_ccate where type='yearTarget';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finalCheckOK','完成项目终验','完成项目终验' ,6 from af_ccate where type='yearTarget';

delete from af_codes where ccate_id in(select id from af_ccate where type='resourceRequirement');
delete from af_ccate where type='resourceRequirement';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'resourceRequirement','信息化资源需求','信息化资源需求字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'networkResource','网络资源','网络资源' ,1 from af_ccate where type='resourceRequirement';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'storageResource','存储资源','存储资源' ,2 from af_ccate where type='resourceRequirement';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'dataResource','数据资源','数据资源' ,3 from af_ccate where type='resourceRequirement';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'virtualServerNumber','虚拟服务器台数','虚拟服务器台数' ,4 from af_ccate where type='resourceRequirement';

delete from af_codes where ccate_id in(select id from af_ccate where type='businessType');
delete from af_ccate where type='businessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'businessType','业务类别','业务类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'informationService','信息服务','信息服务' ,1 from af_ccate where type='businessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterpriseManage','企业管理','企业管理' ,2 from af_ccate where type='businessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'projectBuild','工程建设','工程建设' ,3 from af_ccate where type='businessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='businessLevel');
delete from af_ccate where type='businessLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'businessLevel','业务层级','业务层级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'basicEquipment','基础设施','基础设施' ,1 from af_ccate where type='businessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'informationSecurity','信息安全','信息安全' ,2 from af_ccate where type='businessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'businessApplication','业务应用','业务应用' ,3 from af_ccate where type='businessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'groupControl','集团管控','集团管控' ,4 from af_ccate where type='businessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produceManage','生产管理','生产管理' ,4 from af_ccate where type='businessLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='suggestImplementDept');
delete from af_ccate where type='suggestImplementDept';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'suggestImplementDept','建议实施主体','建议实施主体字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maintenanceDept ','维保中心','维保中心' ,1 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'informationCenter','信息中心','信息中心' ,2 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maglevCompany','磁浮公司','磁浮公司' ,3 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'operationCenter','运营中心','运营中心' ,4 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'techniqueCenter','技术中心','技术中心' ,5 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'stockCompany','股份公司','股份公司' ,6 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'trainingCenter','培训中心','培训中心' ,7 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'tunnelInstitute','信息中心隧道院','信息中心隧道院' ,8 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'supervisionCenter ','信息中心监管中心','信息中心监管中心' ,9 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'financialDepartment','财务部','财务部' ,10 from af_ccate where type='suggestImplementDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'eachDept','各单位','各单位' ,11 from af_ccate where type='suggestImplementDept';

delete from af_codes where ccate_id in(select id from af_ccate where type='suggestCostType');
delete from af_ccate where type='suggestCostType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'suggestCostType','建议费用类别','建议费用类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'basicBuild','基建','基建' ,1 from af_ccate where type='suggestCostType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'overhaulSpecial ','大修专项','大修专项' ,2 from af_ccate where type='suggestCostType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'costProject','成本类项目','成本类项目' ,3 from af_ccate where type='suggestCostType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'managementExpenses','管理费用','管理费用' ,4 from af_ccate where type='suggestCostType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maintenanceCosts','维护成本','维护成本' ,5 from af_ccate where type='suggestCostType';

delete from af_codes where ccate_id in(select id from af_ccate where type='suggestCostProperty');
delete from af_ccate where type='suggestCostProperty';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'suggestCostProperty','建议费用性质','建议费用性质字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'cost','费用性','费用性' ,1 from af_ccate where type='suggestCostProperty';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'capital','资本性','资本性' ,2 from af_ccate where type='suggestCostProperty';

delete from af_codes where ccate_id in(select id from af_ccate where type='year');
delete from af_ccate where type='year';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'year','年度','年度字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2015','2015','2015' ,1 from af_ccate where type='year';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2014','2014','2014' ,2 from af_ccate where type='year';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2013','2013','2013' ,3 from af_ccate where type='year';

--标记￥￥
delete from af_codes where ccate_id in(select id from af_ccate where type='targetState');
delete from af_ccate where type='targetState';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'targetState','计划状态','计划状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'initial','初始版本','初始版本' ,1 from af_ccate where type='targetState';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'modify','修改版本','修改版本' ,2 from af_ccate where type='targetState';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'final','最终版本','最终版本' ,3 from af_ccate where type='targetState';

------------------------------------------------------------------meeting---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='meetingRoom');
delete from af_ccate where type='meetingRoom';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'meetingRoom','会议室','会议室字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'roomInInfoCenter','信息中心会议室','信息中心会议室' ,1 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room1','1号会议室（100人）','1号会议室（100人）' ,2 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room2','2号会议室（30人）','2号会议室（30人）' ,3 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room3','3号会议室（20人）','3号会议室（20人）' ,4 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room4','4号会议室（20人）','4号会议室（20人）' ,5 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room5','5号会议室（20人）','5号会议室（20人）' ,6 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room17','7号会议室（20人）','7号会议室（20人）' ,7 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'vipRoom','贵宾室','贵宾室' ,8 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'roomInHeadquarters','指挥部会议室','指挥部会议室' ,9 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room1InNO7','7号楼开评标室（1）','7号楼开评标室（1）' ,10 from af_ccate where type='meetingRoom';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'room2InNO7','7号楼开评标室（2）','7号楼开评标室（2）' ,11 from af_ccate where type='meetingRoom';

delete from af_codes where ccate_id in(select id from af_ccate where type='meetingTime');
delete from af_ccate where type='meetingTime';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'meetingTime','会议时间','会议时间' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'09:00:00','09:00','09:00' ,1 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'09:30:00','09:30','09:30' ,2 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'10:00:00','10:00','10:00' ,3 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'10:30:00','10:30','10:30' ,4 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'11:00:00','11:00','11:00' ,5 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'11:30:00','11:30','11:30' ,6 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'12:00:00','12:00','12:00' ,7 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'12:30:00','12:30','12:30' ,8 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'13:00:00','13:00','13:00' ,9 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'13:30:00','13:30','13:30' ,10 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'14:00:00','14:00','14:00' ,11 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'14:30:00','14:30','14:30' ,12 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'15:00:00','15:00','15:00' ,13 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'15:30:00','15:30','15:30' ,14 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'16:00:00','16:00','16:00' ,15 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'16:30:00','16:30','16:30' ,16 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'17:00:00','17:00','17:00' ,17 from af_ccate where type='meetingTime';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'17:30:00','17:30','17:30' ,18 from af_ccate where type='meetingTime';

delete from af_codes where ccate_id in(select id from af_ccate where type='meetingType');
delete from af_ccate where type='meetingType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'meetingType','会议类型','会议类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptMeeting','部门例会','部门例会' ,1 from af_ccate where type='meetingType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'specialMeeting','专项会议','专项会议' ,2 from af_ccate where type='meetingType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,3 from af_ccate where type='meetingType';


------------------------------------------------------------------resource---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='netBusinessType');
delete from af_ccate where type='netBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'netBusinessType','网络资源申请业务类型','网络资源申请业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'addLocal','新增本地管理网信息点','新增本地管理网信息点' ,1 from af_ccate where type='netBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'addCrossLine','新增跨线管理网信息点','新增跨线管理网信息点' ,2 from af_ccate where type='netBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'addCrossNet','新增跨网络信息点','新增跨网络信息点' ,3 from af_ccate where type='netBusinessType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'addInternet','新增互联网信息点','新增互联网信息点' ,4 from af_ccate where type='netBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,5 from af_ccate where type='netBusinessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='netStatus');
delete from af_ccate where type='netStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'netStatus','网络资源状态','网络资源状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'up','UP','UP' ,1 from af_ccate where type='netStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'down','DOWN','DOWN' ,2 from af_ccate where type='netStatus';


delete from af_codes where ccate_id in(select id from af_ccate where type='accountBusinessType');
delete from af_ccate where type='accountBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'accountBusinessType','账号资源申请业务类型','账号资源申请业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'emailAccount','企业邮箱账户','企业邮箱账户' ,1 from af_ccate where type='accountBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'portalAccount','协同平台账户','协同平台账户' ,2 from af_ccate where type='accountBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,3 from af_ccate where type='accountBusinessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='accountPost');
delete from af_ccate where type='accountPost';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'accountPost','账号资源职务类型','账号资源职务类型' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'principal','部门正职（主持工作）','部门正职（主持工作）' ,1 from af_ccate where type='accountPost';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deputy','部门副职','部门副职' ,2 from af_ccate where type='accountPost';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'staff','科员','科员' ,3 from af_ccate where type='accountPost';


delete from af_codes where ccate_id in(select id from af_ccate where type='internetBusinessType');
delete from af_ccate where type='internetBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'internetBusinessType','互联网资源申请业务类型','互联网资源申请业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'groupInternet','集团互联网业务（仅访问官方网站、企业邮箱，默认选项）','集团互联网业务（仅访问官方网站、企业邮箱，默认选项）' ,1 from af_ccate where type='internetBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'commonInternet','访问常用互联网资源（必须描述清楚访问用途和方式）','访问常用互联网资源（必须描述清楚访问用途和方式）' ,2 from af_ccate where type='internetBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'specialInternet','访问特殊互联网资源（有特殊应用需求才可申请）','访问特殊互联网资源（有特殊应用需求才可申请）' ,2 from af_ccate where type='internetBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,4 from af_ccate where type='internetBusinessType';


delete from af_codes where ccate_id in(select id from af_ccate where type='vpnBusinessType');
delete from af_ccate where type='vpnBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'vpnBusinessType','VPN资源申请业务类型','VPN资源申请业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'vpnForInnerNet','集团管理网络VPN帐户，访问集团内部网络','集团管理网络VPN帐户，访问集团内部网络' ,1 from af_ccate where type='vpnBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'vpnForPublishSite','上海地铁官方网站VPN帐户，访问网站发布系统','上海地铁官方网站VPN帐户，访问网站发布系统' ,2 from af_ccate where type='vpnBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,3 from af_ccate where type='vpnBusinessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='netTerminalType');
delete from af_ccate where type='netTerminalType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'netTerminalType','网络接入终端类型','网络接入终端类型' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'desktop','台式机','台式机' ,1 from af_ccate where type='netTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'mobileDevice','移动设备','移动设备' ,2 from af_ccate where type='netTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'specialDevice','专用设备','专用设备' ,3 from af_ccate where type='netTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,4 from af_ccate where type='netTerminalType';

delete from af_codes where ccate_id in(select id from af_ccate where type='resourceApplyType');
delete from af_ccate where type='resourceApplyType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'resourceApplyType','资源申请状态','资源申请状态字典类' from dual;
delete from af_codes where ccate_id in(select id from af_ccate where type='resourceApplyType');
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'apply','申请','申请' ,1 from af_ccate where type='resourceApplyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'cancel','注销','注销' ,2 from af_ccate where type='resourceApplyType';


delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessTerminalType');
delete from af_ccate where type='wirelessTerminalType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'wirelessTerminalType','无线网络终端类型','无线网络终端类型' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'desktop','台式机电脑','台式机电脑' ,1 from af_ccate where type='wirelessTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'notebook','笔记本电脑','笔记本电脑' ,2 from af_ccate where type='wirelessTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'mobile','手机设备','手机设备' ,3 from af_ccate where type='wirelessTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'pad','平板电脑','平板电脑' ,4 from af_ccate where type='wirelessTerminalType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'special','专用设备','专用设备' ,5 from af_ccate where type='wirelessTerminalType';

delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessBusinessType');
delete from af_ccate where type='wirelessBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'wirelessBusinessType','无线网络资源业务类型','无线网络资源业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'special','互联网专用设备接入','互联网专用设备接入' ,1 from af_ccate where type='wirelessBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'mobile','移动设备接入互联网区（限集团员工申请选择）','移动设备接入互联网区（限集团员工申请选择）' ,2 from af_ccate where type='wirelessBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'temp','临时接入互联网区（必须写明开始使用日期和结束使用日期）','临时接入互联网区（必须写明开始使用日期和结束使用日期）' ,3 from af_ccate where type='wirelessBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'manage','无线接入管理网区（仅限特殊需求）','无线接入管理网区（仅限特殊需求）' ,4 from af_ccate where type='wirelessBusinessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessUsePosition');
delete from af_ccate where type='wirelessUsePosition';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'wirelessUsePosition','无线网络资源使用位置','无线网络资源使用位置字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'theUnit','本单位','本单位' ,1 from af_ccate where type='wirelessUsePosition';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'wholeGroup','全集团漫游','全集团漫游' ,2 from af_ccate where type='wirelessUsePosition';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'designatedArea','指定集团内漫游区域','指定集团内漫游区域' ,3 from af_ccate where type='wirelessUsePosition';

delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessUsePosition2');
delete from af_ccate where type='wirelessUsePosition2';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'wirelessUsePosition2','无线网络资源使用位置','无线网络资源使用位置字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'groupCompanyHome','集团公司本部','集团公司本部' ,1 from af_ccate where type='wirelessUsePosition2';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'hengtongBuilding','恒通大厦','恒通大厦' ,2 from af_ccate where type='wirelessUsePosition2';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'assetCompanyHome','资产公司本部','资产公司本部' ,3 from af_ccate where type='wirelessUsePosition2';

delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessApplyType');
delete from af_ccate where type='wirelessApplyType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'wirelessApplyType','无线资源申请状态','无线资源申请状态字典类' from dual;
delete from af_codes where ccate_id in(select id from af_ccate where type='wirelessApplyType');
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'apply','申请','申请' ,1 from af_ccate where type='wirelessApplyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'change','变更','变更' ,2 from af_ccate where type='wirelessApplyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'cancel','注销','注销' ,3 from af_ccate where type='wirelessApplyType';

delete from af_codes where ccate_id in(select id from af_ccate where type='resourceStatus');
delete from af_ccate where type='resourceStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'resourceStatus','资源审批状态','资源审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'innerApproval','待内部审核','待内部审核' ,2 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'innerTurnBack','内部退回','内部退回' ,3 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptApproval','待信息中心审核','待信息中心审核' ,4 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'turnBack','退回','退回' ,5 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'serviceDeptApproval','待维保公司审核','待维保公司审核' ,6 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'serviceDeptBack','维保公司退回','维保公司退回' ,7 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'waitForImplement','待实施','待实施' ,8 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'selfDealWith','自行处理','自行处理' ,9 from af_ccate where type='resourceStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','处理完毕','处理完毕' ,10 from af_ccate where type='resourceStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='virtualStatus');
delete from af_ccate where type='virtualStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'virtualStatus','虚拟资源审批状态','虚拟资源审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderApproval','待部门领导审核','待部门领导审核' ,2 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderBack','部门领导退回','部门领导退回' ,3 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptApproval','待信息中心审核','待信息中心审核' ,4 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','信息中心退回','信息中心退回' ,5 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderApproval','待信息中心领导审核','待信息中心领导审核' ,6 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderBack','信息中心领导退回','信息中心领导退回' ,7 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'waitForImplement','待实施','待实施' ,8 from af_ccate where type='virtualStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','处理完毕','处理完毕' ,9 from af_ccate where type='virtualStatus';

------------------------------------------------------------------equipment---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='equipmentMainType');
delete from af_ccate where type='equipmentMainType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'equipmentMainType','设备主类型','设备主类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'S','服务器','服务器' ,1 from af_ccate where type='equipmentMainType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'C','个人计算机','个人计算机' ,2 from af_ccate where type='equipmentMainType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'P','打印机','打印机' ,3 from af_ccate where type='equipmentMainType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'A','办公外设','办公外设' ,4 from af_ccate where type='equipmentMainType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'N','网络设备','网络设备' ,5 from af_ccate where type='equipmentMainType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'O','其它','其它' ,6 from af_ccate where type='equipmentMainType';

delete from af_codes where ccate_id in(select id from af_ccate where type='equipmentType'); 
delete from af_ccate where type='equipmentType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'equipmentType','设备类型','设备类型字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'S','A','应用服务器','应用服务器' ,1 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'S','S','存储设备','存储设备' ,2 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'S','O','其它','其它' ,3 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'C','L','笔记本','笔记本' ,4 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'C','D','台式机','台式机' ,5 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'C','P','手持终端','手持终端' ,6 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'C','O','其它','其它' ,6 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'P','T','针式打印机','针式打印机' ,8 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'P','I','喷墨打印机','喷墨打印机' ,9 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'P','L','激光打印机','激光打印机' ,10 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'P','A','一体机','一体机' ,11 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'P','O','其它','其它' ,12 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','F','传真机','传真机' ,13 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','D','复印机','复印机' ,14 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','S','扫描仪','扫描仪' ,15 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','P','投影仪','投影仪' ,16 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','H','手写笔','手写笔' ,17 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'A','O','其它','其它' ,18 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','S','交换机','交换机' ,19 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','H','集线器','集线器' ,20 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','A','接入点','接入点' ,21 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','R','路由器','路由器' ,22 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','L','负载均衡','负载均衡' ,23 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','F','防火墙','防火墙' ,24 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','I','防入侵','防入侵' ,25 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'N','O','其它','其它' ,26 from af_ccate where type='equipmentType';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'O','O','其它','其它' ,27 from af_ccate where type='equipmentType';

delete from af_codes where ccate_id in(select id from af_ccate where type='assetCategory');
delete from af_ccate where type='assetCategory';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'assetCategory','资产分类','资产分类字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'networkEquipment','网络设备','网络设备' ,1 from af_ccate where type='assetCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'server','服务器','服务器' ,2 from af_ccate where type='assetCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'switch','交换机','交换机' ,3 from af_ccate where type='assetCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'store','存储','存储' ,4 from af_ccate where type='assetCategory';

delete from af_codes where ccate_id in(select id from af_ccate where type='equipmentImportance');
delete from af_ccate where type='equipmentImportance';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'equipmentImportance','设备重要性','设备重要性字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'veryImportant','非常重要','非常重要' ,1 from af_ccate where type='equipmentImportance';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'important','重要','重要' ,2 from af_ccate where type='equipmentImportance';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'commonly','一般','一般' ,3 from af_ccate where type='equipmentImportance';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,4 from af_ccate where type='equipmentImportance';

delete from af_codes where ccate_id in(select id from af_ccate where type='equipmentMainStatus');
delete from af_ccate where type='equipmentMainStatus'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'equipmentMainStatus','设备主状态','设备主状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'working','运行','运行' ,1 from af_ccate where type='equipmentMainStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'notRunning','未运行','未运行' ,2 from af_ccate where type='equipmentMainStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noBoot','未开机','未开机' ,3 from af_ccate where type='equipmentMainStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'notOnline','未在线','未在线' ,4 from af_ccate where type='equipmentMainStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,5 from af_ccate where type='equipmentMainStatus';

------------------------------------------------------------------securityLevel---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='securityCompany');
delete from af_ccate where type='securityCompany';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityCompany','安全组织','安全组织字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2549','信息中心','信息中心' ,1 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2925','维保中心','维保中心' ,2 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2920','运管中心','运管中心' ,3 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2941','技术中心','技术中心' ,4 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2944','培训中心','培训中心' ,5 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2921','运一公司','运一公司' ,6 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2922','运二公司','运二公司' ,7 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2923','运三公司','运三公司' ,8 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2924','运四公司','运四公司' ,9 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2962','磁浮公司','磁浮公司' ,10 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2946','资产公司','资产公司' ,11 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2943','隧道院','隧道院' ,12 from af_ccate where type='securityCompany';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2945','股份公司','股份公司' ,13 from af_ccate where type='securityCompany';


delete from af_codes where ccate_id in(select id from af_ccate where type='subordinateRelation');
delete from af_ccate where type='subordinateRelation';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'subordinateRelation','隶属关系','隶属关系字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'center','1中央','1中央' ,1 from af_ccate where type='subordinateRelation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'province','2省（自治区、直辖市）','2省（自治区、直辖市）' ,2 from af_ccate where type='subordinateRelation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'city','3地(区、市、州、盟)','3地(区、市、州、盟)' ,3 from af_ccate where type='subordinateRelation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'county','4县（区、市、旗）','4县（区、市、旗）' ,4 from af_ccate where type='subordinateRelation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,5 from af_ccate where type='subordinateRelation';

delete from af_codes where ccate_id in(select id from af_ccate where type='companyType');
delete from af_ccate where type='companyType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'companyType','单位类型','单位类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'partyOrgan','1党委机关','1党委机关' ,1 from af_ccate where type='companyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'governmentOrgan','2政府机关','2政府机关' ,2 from af_ccate where type='companyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'institution','3事业单位','3事业单位' ,3 from af_ccate where type='companyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterprise','4企业','4企业' ,4 from af_ccate where type='companyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,5 from af_ccate where type='companyType';

delete from af_codes where ccate_id in(select id from af_ccate where type='businessCategory');
delete from af_ccate where type='businessCategory';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'businessCategory','行业类别','行业类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'telecommunication','11电信','11电信' ,1 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'broadcasting','12广电','12广电' ,2 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'publicInternet','13经营性公众互联网','13经营性公众互联网' ,3 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'railway','21铁路','21铁路' ,4 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'bank','22银行','22银行' ,5 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'customhouse','23海关','23海关' ,6 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'taxation','24税务','24税务' ,7 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'civilAviation','25民航','25民航' ,8 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'power','26电力','26电力' ,9 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'bond','27证券','27证券' ,10 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'insurance','28保险','28保险' ,11 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'nationalDefense','31国防科技工业','31国防科技工业' ,12 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'police','32公安','32公安' ,13 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'socialSecurity','33人事劳动和社会保障','33人事劳动和社会保障' ,14 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finance','34财政','34财政' ,15 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'audit','35审计','35审计' ,16 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'trade','36商业贸易','36商业贸易' ,17 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'territorialResources','37国土资源','37国土资源' ,18 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'county','38能源','38能源' ,19 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'energy','39交通','39交通' ,20 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'statistics','40统计','40统计' ,21 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'commercialAdministration','41工商行政管理','41工商行政管理' ,22 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'postalService','42邮政','42邮政' ,23 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'education','43教育','43教育' ,24 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'culture','44文化','44文化' ,25 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'sanitation','45卫生','45卫生' ,26 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'agriculture','46农业','46农业' ,27 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'waterConservancy','47水利','47水利' ,28 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'diplomacy','48外交','48外交' ,29 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'developmentReform','49发展改革','49发展改革' ,30 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'technology','50科技','50科技' ,31 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'drumbeating','51宣传','51宣传' ,32 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'qualityAudit','52质量监督检验检疫','52质量监督检验检疫' ,33 from af_ccate where type='businessCategory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','99其他','99其他' ,34 from af_ccate where type='businessCategory';

delete from af_codes where ccate_id in(select id from af_ccate where type='systemType');
delete from af_ccate where type='systemType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'systemType','系统类型','系统类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produceSystem','1生产类系统','1生产类系统' ,1 from af_ccate where type='systemType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'manageSystem','2管理类系统','2管理类系统' ,2 from af_ccate where type='systemType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','3其他','3其他' ,3 from af_ccate where type='systemType';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysNetArea');
delete from af_ccate where type='sysNetArea';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysNetArea','网络区域','网络区域字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produceNetArea','1生产网区','1生产网区' ,1 from af_ccate where type='sysNetArea';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'manageNetArea','2管理网区','2管理网区' ,2 from af_ccate where type='sysNetArea';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'internetArea','3互联网区','3互联网区' ,3 from af_ccate where type='sysNetArea';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','4其他','4其他' ,4 from af_ccate where type='sysNetArea';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysBusinessType');
delete from af_ccate where type='sysBusinessType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysBusinessType','系统承载业务类型','系统承载业务类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produce','1生产作业','1生产作业' ,1 from af_ccate where type='sysBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'command','2指挥调度','2指挥调度' ,2 from af_ccate where type='sysBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'manage','3管理控制','3管理控制' ,3 from af_ccate where type='sysBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'office','4内部办公','4内部办公' ,4 from af_ccate where type='sysBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'publicService','5公共服务','5公共服务' ,5 from af_ccate where type='sysBusinessType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,6 from af_ccate where type='sysBusinessType';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysServeScope');
delete from af_ccate where type='sysServeScope';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysServeScope','系统服务范围','系统服务范围字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'wholeCountry','10全国','10全国' ,1 from af_ccate where type='sysServeScope';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'crossProvince','11跨省（区、市）','11跨省（区、市）' ,2 from af_ccate where type='sysServeScope';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'wholeProvince','20全省（区、市）','20全省（区、市）' ,3 from af_ccate where type='sysServeScope';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'crossCity','21跨地（市、区）','21跨地（市、区）' ,4 from af_ccate where type='sysServeScope';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'inCity','30地（市、区）内','30地（市、区）内' ,5 from af_ccate where type='sysServeScope';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','99其他','99其他' ,6 from af_ccate where type='sysServeScope';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysServeObj');
delete from af_ccate where type='sysServeObj';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysServeObj','系统服务对象','系统服务对象字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'insider','1单位内部人员','1单位内部人员' ,1 from af_ccate where type='sysServeObj';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outsider','2社会公众人员','2社会公众人员' ,2 from af_ccate where type='sysServeObj';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'both','3两者均包括','3两者均包括' ,3 from af_ccate where type='sysServeObj';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,4 from af_ccate where type='sysServeObj';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysNetCover');
delete from af_ccate where type='sysNetCover';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysNetCover','系统网络覆盖范围','系统网络覆盖范围字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'LAN','1局域网','1局域网' ,1 from af_ccate where type='sysNetCover';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'MAN','2城域网','2城域网' ,2 from af_ccate where type='sysNetCover';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'WAN','3广域网','3广域网' ,3 from af_ccate where type='sysNetCover';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,4 from af_ccate where type='sysNetCover';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysNetProperty');
delete from af_ccate where type='sysNetProperty';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysNetProperty','系统网络性质','系统网络性质字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'businessNetwork','1业务专网','1业务专网' ,1 from af_ccate where type='sysNetProperty';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'internet','2互联网','2互联网' ,2 from af_ccate where type='sysNetProperty';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,3 from af_ccate where type='sysNetProperty';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysConnect');
delete from af_ccate where type='sysConnect';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysConnect','系统互联情况','系统互联情况字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'contect2OtherBusinessSys','1与其他行业系统连接','1与其他行业系统连接' ,1 from af_ccate where type='sysConnect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'contect2SameBusinessSys','2与本行业其他单位系统连接','3与本行业其他单位系统连接' ,2 from af_ccate where type='sysConnect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'contect2OwnBusinessSys','3与本单位其他系统连接','3与本单位其他系统连接' ,3 from af_ccate where type='sysConnect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','9其他','9其他' ,4 from af_ccate where type='sysConnect';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysSecurityLevel');
delete from af_ccate where type='sysSecurityLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysSecurityLevel','系统安全级别','系统安全级别' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level1','第一级','第一级' ,1 from af_ccate where type='sysSecurityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level2','第二级','第二级' ,2 from af_ccate where type='sysSecurityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level3','第三级','第三级' ,3 from af_ccate where type='sysSecurityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level4','第四级','第四级' ,4 from af_ccate where type='sysSecurityLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level5','第五级','第五级' ,5 from af_ccate where type='sysSecurityLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='sysDamage');
delete from af_ccate where type='sysDamage';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sysDamage','系统安全损害','系统安全损害字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level1_damage','仅对公民、法人和其他组织的合法权益造成损害','仅对公民、法人和其他组织的合法权益造成损害' ,1 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level2_damage1','对公民、法人和其他组织的合法权益造成严重损害','对公民、法人和其他组织的合法权益造成严重损害' ,2 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level2_damage2','对社会秩序和公共利益造成损害','对社会秩序和公共利益造成损害' ,3 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level3_damage1','对社会秩序和公共利益造成严重损害','对社会秩序和公共利益造成严重损害' ,4 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level3_damage2','对国家安全造成损害','对国家安全造成损害' ,5 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level4_damage1','对社会秩序和公共利益造成特别严重损害','对社会秩序和公共利益造成特别严重损害' ,3 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level4_damage2','对国家安全造成严重损害','对国家安全造成严重损害' ,4 from af_ccate where type='sysDamage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level5_damage','对国家安全造成特别严重损害','对国家安全造成特别严重损害' ,5 from af_ccate where type='sysDamage';

delete from af_codes where ccate_id in(select id from af_ccate where type='businessStatus');
delete from af_ccate where type='businessStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'businessStatus','业务状态','业务状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'new','新增','新增' ,1 from af_ccate where type='businessStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'contentChange','内容调整','内容调整' ,2 from af_ccate where type='businessStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'levelChange','等级变更','等级变更' ,3 from af_ccate where type='businessStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityLevelStatus');
delete from af_ccate where type='securityLevelStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityLevelStatus','安全等级状态','安全等级状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderReview','审核中','审核中' ,2 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderBack','审核退回','审核退回' ,3 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptReview','备案审查中','备案审查中' ,4 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','备案审查退回','备案审查退回' ,5 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderReview','信息中心领导审批中','信息中心领导审批中' ,6 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderBack','信息中心领导审批退回','信息中心领导审批退回' ,7 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'policeReview','公安机关送审中','公安机关送审中' ,8 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'policeBack','公安机关送审退回','公安机关送审退回' ,9 from af_ccate where type='securityLevelStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'pass','定级审批通过','定级审批通过' ,10 from af_ccate where type='securityLevelStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='hasOrNot');
delete from af_ccate where type='hasOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'hasOrNot','有无','有无字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','有','有' ,1 from af_ccate where type='hasOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','无','无' ,2 from af_ccate where type='hasOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='yesOrNo');
delete from af_ccate where type='yesOrNo';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'yesOrNo','是否','是否字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','是','是' ,1 from af_ccate where type='yesOrNo';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','否','否' ,2 from af_ccate where type='yesOrNo';

delete from af_codes where ccate_id in(select id from af_ccate where type='reviewOrNot');
delete from af_ccate where type='reviewOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'reviewOrNot','是否评审','是否评审字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已评审','已评审' ,1 from af_ccate where type='reviewOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未评审','未评审' ,2 from af_ccate where type='reviewOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='approveOrNot');
delete from af_ccate where type='approveOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'approveOrNot','是否审批','是否审批字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已审批','已审批' ,1 from af_ccate where type='approveOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未审批','未审批' ,2 from af_ccate where type='approveOrNot';


------------------------------------------------------------------securityCheck---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='securityCheckStatus');
delete from af_ccate where type='securityCheckStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityCheckStatus','安全自查状态','安全自查状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='securityCheckStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'review','待审核','待审核' ,2 from af_ccate where type='securityCheckStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'pass','审核通过','审核通过' ,3 from af_ccate where type='securityCheckStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'unpass','审核不通过','审核不通过' ,4 from af_ccate where type='securityCheckStatus';


delete from af_codes where ccate_id in(select id from af_ccate where type='staffSecrecyAgree');
delete from af_ccate where type='staffSecrecyAgree';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'staffSecrecyAgree','人员安全保密协议','人员安全保密协议字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'all','全部签订','全部签订' ,1 from af_ccate where type='staffSecrecyAgree';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'part','部分签订','部分签订' ,2 from af_ccate where type='staffSecrecyAgree';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'none','均未签订','均未签订' ,3 from af_ccate where type='staffSecrecyAgree';


delete from af_codes where ccate_id in(select id from af_ccate where type='assetDeviceMaintain');
delete from af_ccate where type='assetDeviceMaintain';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'assetDeviceMaintain','设备维护报废','设备维护报废字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'all','已建立管理制度，且记录完整','已建立管理制度，且记录完整',1 from af_ccate where type='assetDeviceMaintain';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'part','已建立管理制度，但记录不完整','已建立管理制度，但记录不完整' ,2 from af_ccate where type='assetDeviceMaintain';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'none','未建立管理制度','未建立管理制度' ,3 from af_ccate where type='assetDeviceMaintain';


delete from af_codes where ccate_id in(select id from af_ccate where type='netProtectDevice');
delete from af_ccate where type='netProtectDevice';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'netProtectDevice','网络安全防护设备','网络安全防护设备字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'fireWall','防火墙','防火墙',1 from af_ccate where type='netProtectDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'invadeCheck','入侵检测设备','入侵检测设备' ,2 from af_ccate where type='netProtectDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'safeAudit','安全审计设备','安全审计设备' ,3 from af_ccate where type='netProtectDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'antivirusGateway','防病毒网关','防病毒网关',4 from af_ccate where type='netProtectDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'antiAttackDevice','抗拒绝服务攻击设备','抗拒绝服务攻击设备' ,5 from af_ccate where type='netProtectDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其它','其它' ,6 from af_ccate where type='netProtectDevice';


delete from af_codes where ccate_id in(select id from af_ccate where type='safeConfig');
delete from af_ccate where type='safeConfig';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'safeConfig','设备安全策略配置','设备安全策略配置字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'default','使用默认配置','使用默认配置',1 from af_ccate where type='safeConfig';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'config','根据需要配置','根据需要配置' ,2 from af_ccate where type='safeConfig';

delete from af_codes where ccate_id in(select id from af_ccate where type='visitLog');
delete from af_ccate where type='visitLog';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'visitLog','网络访问日志','网络访问日志字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'hasLog','留存日志','留存日志',1 from af_ccate where type='visitLog';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noLog','未留存日志','未留存日志' ,2 from af_ccate where type='visitLog';

delete from af_codes where ccate_id in(select id from af_ccate where type='cloudDevice');
delete from af_ccate where type='cloudDevice';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'cloudDevice','云计算服务设施位置','云计算服务设施位置字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未使用','未使用',1 from af_ccate where type='cloudDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'innerSide','本单位','本单位' ,2 from af_ccate where type='cloudDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outerSide','外部单位','外部单位' ,3 from af_ccate where type='cloudDevice';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'foreign','境外','境外',4 from af_ccate where type='cloudDevice';

delete from af_codes where ccate_id in(select id from af_ccate where type='epibolyDataCommit');
delete from af_ccate where type='epibolyDataCommit';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'epibolyDataCommit','外包服务过程中数据提交','外包服务过程中数据提交字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未提交','未提交',1 from af_ccate where type='epibolyDataCommit';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outerSide','外部单位','外部单位' ,2 from af_ccate where type='epibolyDataCommit';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'foreign','境外机构','境外机构' ,3 from af_ccate where type='epibolyDataCommit';

delete from af_codes where ccate_id in(select id from af_ccate where type='remoteControl');
delete from af_ccate where type='remoteControl';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'remoteControl','系统远程控制/维护','系统远程控制/维护字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','无','无',1 from af_ccate where type='remoteControl';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outerSide','外部单位','外部单位' ,2 from af_ccate where type='remoteControl';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'foreign','境外机构','境外机构' ,3 from af_ccate where type='remoteControl';

delete from af_codes where ccate_id in(select id from af_ccate where type='routerUse');
delete from af_ccate where type='routerUse';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'routerUse','无线路由器用途','无线路由器用途字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'visitInternet','访问互联网','访问互联网',1 from af_ccate where type='routerUse';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'visitBusinessNet','访问业务/办公网络','访问业务/办公网络' ,2 from af_ccate where type='routerUse';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityDefense');
delete from af_ccate where type='securityDefense';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityDefense','安全防护策略','安全防护策略字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'idDefense','采取身份鉴别措施','采取身份鉴别措施',1 from af_ccate where type='securityDefense';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ipDefense','采取地址过滤措施','采取地址过滤措施' ,2 from af_ccate where type='securityDefense';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noDefense','未设置安全防护策略','未设置安全防护策略' ,3 from af_ccate where type='securityDefense';

delete from af_codes where ccate_id in(select id from af_ccate where type='leakScan');
delete from af_ccate where type='leakScan';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'leakScan','漏洞扫描','漏洞扫描字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'regular','定期扫描','定期扫描',1 from af_ccate where type='leakScan';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'irregular','不定期','不定期' ,2 from af_ccate where type='leakScan';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noScan','未进行','未进行' ,3 from af_ccate where type='leakScan';

delete from af_codes where ccate_id in(select id from af_ccate where type='sitePublish');
delete from af_ccate where type='sitePublish';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'sitePublish','信息发布管理','信息发布管理字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'all','已建立审核制度，且记录完整','已建立审核制度，且记录完整',1 from af_ccate where type='sitePublish';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'part','已建立审核制度，但记录不完整','已建立审核制度，但记录不完整' ,2 from af_ccate where type='sitePublish';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'none','未建立审核制度','未建立审核制度' ,3 from af_ccate where type='sitePublish';

delete from af_codes where ccate_id in(select id from af_ccate where type='siteMaintain');
delete from af_ccate where type='siteMaintain';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'siteMaintain','运维方式','运维方式字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'self','自行运维','自行运维',1 from af_ccate where type='siteMaintain';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'thirdParty','委托第三方运维','委托第三方运维' ,2 from af_ccate where type='siteMaintain';

delete from af_codes where ccate_id in(select id from af_ccate where type='emailBuild');
delete from af_ccate where type='emailBuild';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emailBuild','电子邮件建设方式','电子邮件建设方式字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'self','自行建设','自行建设',1 from af_ccate where type='emailBuild';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'thirdParty','使用第三方服务','使用第三方服务' ,2 from af_ccate where type='emailBuild';

delete from af_codes where ccate_id in(select id from af_ccate where type='emailRegister');
delete from af_ccate where type='emailRegister';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emailRegister','电子邮件注册管理','电子邮件注册管理字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'mustAudit','须经审批','须经审批',1 from af_ccate where type='emailRegister';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'anyRegister','任意注册','任意注册' ,2 from af_ccate where type='emailRegister';

delete from af_codes where ccate_id in(select id from af_ccate where type='eamilPwd');
delete from af_ccate where type='eamilPwd';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'eamilPwd','电子邮件口令管理','电子邮件口令管理字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'technicalControl','使用技术措施控制口令强度','使用技术措施控制口令强度',1 from af_ccate where type='eamilPwd';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noTechnicalControl','没有采取技术措施控制口令强度','没有采取技术措施控制口令强度' ,2 from af_ccate where type='eamilPwd';

delete from af_codes where ccate_id in(select id from af_ccate where type='emailProtect');
delete from af_ccate where type='emailProtect';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emailProtect','电子邮件安全防护','电子邮件安全防护字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'antivirus','采取病毒木马防护措施','采取病毒木马防护措施',1 from af_ccate where type='emailProtect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'fireWall','部署防火墙、入侵检测等设备','部署防火墙、入侵检测等设备' ,2 from af_ccate where type='emailProtect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'antiJunkMail','采取反应垃圾邮件措施','采取反应垃圾邮件措施',3 from af_ccate where type='emailProtect';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其他','其他' ,4 from af_ccate where type='emailProtect';

delete from af_codes where ccate_id in(select id from af_ccate where type='terminalManage');
delete from af_ccate where type='terminalManage';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'terminalManage','终端计算机安全管理','终端计算机安全管理字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'unifiedManage','集中统一管理','集中统一管理',1 from af_ccate where type='terminalManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'decentralizedManage','分散管理','分散管理' ,2 from af_ccate where type='terminalManage';

delete from af_codes where ccate_id in(select id from af_ccate where type='unifiedManage');
delete from af_ccate where type='unifiedManage';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'unifiedManage','终端计算机集中统一管理','终端计算机集中统一管理字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'appInstall','规范软硬件安装','规范软硬件安装',1 from af_ccate where type='unifiedManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'patchInstall','统一补丁升级','统一补丁升级' ,2 from af_ccate where type='unifiedManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'antivirus','统一病毒防护','统一病毒防护',3 from af_ccate where type='unifiedManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'safeAudit','统一安全审计','统一安全审计' ,4 from af_ccate where type='unifiedManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'UDIskControl','对移动存储介质接入实施控制','对移动存储介质接入实施控制' ,5 from af_ccate where type='unifiedManage';	 

delete from af_codes where ccate_id in(select id from af_ccate where type='terminalLink');
delete from af_ccate where type='terminalLink';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'terminalLink','终端计算机接入安全控制','终端计算机接入安全控制字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'hasControl','有控制措施（如实名接入、绑定计算机IP和MAC地址等）','有控制措施（如实名接入、绑定计算机IP和MAC地址等）',1 from af_ccate where type='terminalLink';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noControl','无控制措施','无控制措施' ,2 from af_ccate where type='terminalLink';


delete from af_codes where ccate_id in(select id from af_ccate where type='storageManage');
delete from af_ccate where type='storageManage';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'storageManage','移动存储介质管理方式','移动存储介质管理方式字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'unifiedManage','集中管理，统一登记、配发、收回、维修、报废、销毁','集中管理，统一登记、配发、收回、维修、报废、销毁',1 from af_ccate where type='storageManage';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noUnifiedManage','未采取集中管理方式','未采取集中管理方式' ,2 from af_ccate where type='storageManage';

delete from af_codes where ccate_id in(select id from af_ccate where type='storageDestory');
delete from af_ccate where type='storageDestory';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'storageDestory','移动存储介质信息销毁','移动存储介质信息销毁字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'hasDestoryDevice','已配备信息消除和销毁设备','已配备信息消除和销毁设备',1 from af_ccate where type='storageDestory';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noDestoryDevice','未配备信息消除和销毁设备','未配备信息消除和销毁设备' ,2 from af_ccate where type='storageDestory';

delete from af_codes where ccate_id in(select id from af_ccate where type='emergencyTrain');
delete from af_ccate where type='emergencyTrain';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emergencyTrain','应急演练','应急演练字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'trainThisYear','本年度已开展','已配备信息消除和销毁设备',1 from af_ccate where type='emergencyTrain';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noTrainThisYear','本年度未开展','未配备信息消除和销毁设备' ,2 from af_ccate where type='emergencyTrain';

delete from af_codes where ccate_id in(select id from af_ccate where type='emergencyTrain');
delete from af_ccate where type='emergencyTrain';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emergencyTrain','应急演练','应急演练字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'trainThisYear','本年度已开展','已配备信息消除和销毁设备',1 from af_ccate where type='emergencyTrain';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noTrainThisYear','本年度未开展','未配备信息消除和销毁设备' ,2 from af_ccate where type='emergencyTrain';


delete from af_codes where ccate_id in(select id from af_ccate where type='emergencyDataback');
delete from af_ccate where type='emergencyDataback';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emergencyDataback','灾难数据备份','灾难数据备份字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'hasDataBack','采取备份措施','采取备份措施',1 from af_ccate where type='emergencyDataback';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'noDataBack','未采取备份措施','未采取备份措施' ,2 from af_ccate where type='emergencyDataback';

delete from af_codes where ccate_id in(select id from af_ccate where type='databackPeriod');
delete from af_ccate where type='databackPeriod';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'databackPeriod','灾难数据备份','灾难数据备份字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'inTime','实时','实时',1 from af_ccate where type='databackPeriod';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'day','日','日' ,2 from af_ccate where type='databackPeriod';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'week','周','周',3 from af_ccate where type='databackPeriod';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'month','月','月' ,4 from af_ccate where type='databackPeriod';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'aperiodicity','不定期','不定期' ,5 from af_ccate where type='databackPeriod';

delete from af_codes where ccate_id in(select id from af_ccate where type='emergencyTeam');
delete from af_ccate where type='emergencyTeam';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'emergencyTeam','应急技术队伍','应急技术队伍字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'innerSider','本部门所属','本部门所属',1 from af_ccate where type='emergencyTeam';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outerSider','外部服务机构','外部服务机构' ,2 from af_ccate where type='emergencyTeam';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','无','无',3 from af_ccate where type='emergencyTeam';

delete from af_codes where ccate_id in(select id from af_ccate where type='afterWinXpStop');
delete from af_ccate where type='afterWinXpStop';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'afterWinXpStop','WinXP停止服务措施','WinXP停止服务措施字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'uninstallApp','卸载与工作无关的应用程序','卸载与工作无关的应用程序',1 from af_ccate where type='afterWinXpStop';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'closeService','关闭不必要服务和端口','关闭不必要服务和端口' ,2 from af_ccate where type='afterWinXpStop';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'useThirdPartyPatch','采取第三方安全补丁更新','采取第三方安全补丁更新',3 from af_ccate where type='afterWinXpStop';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'isolateInternet','与互联网隔离','与互联网隔离',4 from af_ccate where type='afterWinXpStop';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'other','其他','其他' ,5 from af_ccate where type='afterWinXpStop';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未加固','未加固',6 from af_ccate where type='afterWinXpStop';

delete from af_codes where ccate_id in(select id from af_ccate where type='epibolyOrgan');
delete from af_ccate where type='epibolyOrgan';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'epibolyOrgan','外包服务机构','外包服务机构字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'nature','state','国有单位','国有单位',1 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'nature','private','民营企业','民营企业' ,2 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'nature','foreign','外资企业','外资企业',3 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','integration','系统集成','系统集成',1 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','maintain','系统运维','系统运维' ,2 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','risk','风险评估','风险评估',3 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','check','安全检测','安全检测',4 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','fasten','安全加固','安全加固' ,5 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','support','应急支持','应急支持',6 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','store','数据存储','数据存储',7 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','backup','灾难备份','灾难备份' ,8 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'service','other','其他','其他',9 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'protocol','yes','已签订','已签订',1 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'protocol','no','未签订','未签订' ,2 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'ce','yes','已通过认证','已通过认证',1 from af_ccate where type='epibolyOrgan';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'ce','no','未通过认证','未通过认证' ,2 from af_ccate where type='epibolyOrgan';


delete from af_codes where ccate_id in(select id from af_ccate where type='useOrNot');
delete from af_ccate where type='useOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'useOrNot','是否采用','是否采用字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已采用','已采用' ,1 from af_ccate where type='useOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未采用','未采用' ,2 from af_ccate where type='useOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='existOrNot');
delete from af_ccate where type='existOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'existOrNot','是否存在','是否存在字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已存在','已存在' ,1 from af_ccate where type='existOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未存在','未存在' ,2 from af_ccate where type='existOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='draftOrNot');
delete from af_ccate where type='draftOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'draftOrNot','是否制定','是否制定字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已制定','已制定' ,1 from af_ccate where type='draftOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未制定','未制定' ,2 from af_ccate where type='draftOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='editOrNot');
delete from af_ccate where type='editOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'editOrNot','是否修订','是否修订字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','修订','修订' ,1 from af_ccate where type='editOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未修订','未修订' ,2 from af_ccate where type='editOrNot';

delete from af_codes where ccate_id in(select id from af_ccate where type='buildOrNot');
delete from af_ccate where type='buildOrNot';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'buildOrNot','是否建立','是否建立字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','已建立','修订' ,1 from af_ccate where type='buildOrNot';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','未建立','未建立' ,2 from af_ccate where type='buildOrNot';

------------------------------------------------------------------appVersion---------------------------------------------------

delete from af_codes where ccate_id in(select id from af_ccate where type='appDept');
delete from af_ccate where type='appDept';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'appDept','软件使用部门','软件使用部门字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2551','上海轨道交通建设管理中心','上海轨道交通建设管理中心',1 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2920','上海轨道交通运营管理中心','上海轨道交通运营管理中心',2 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2925','上海轨道交通维护保障中心','上海轨道交通维护保障中心',3 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2941','上海轨道交通技术管理中心','上海轨道交通技术管理中心',4 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2944','上海轨道交通培训中心','上海轨道交通培训中心',6 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2921','上海地铁运营第一有限公司','上海地铁运营第一有限公司',7 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2922','上海地铁运营第二有限公司','上海地铁运营第二有限公司',8 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2923','上海地铁运营第三有限公司','上海地铁运营第三有限公司',9 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2924','上海地铁运营第四有限公司','上海地铁运营第四有限公司',10 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2946','上海申通地铁资产经营管理有限公司','上海申通地铁资产经营管理有限公司',11 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2959','上海黄浦江大桥建设有限公司','上海黄浦江大桥建设有限公司',12 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2943','上海市隧道工程轨道交通设计研究院','上海市隧道工程轨道交通设计研究院',13 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2962','上海磁浮交通发展有限公司','上海磁浮交通发展有限公司',14 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2945','上海申通地铁股份有限公司','上海申通地铁股份有限公司',15 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2502','集团-党委办公室','集团-党委办公室',16 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2503','集团-工会','集团-工会',17 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2504','集团-团委','集团-团委',18 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2505','集团-纪委监察室','集团-纪委监察室',19 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2506','集团-总体规划部','集团-总体规划部',20 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2509','集团-投资管理部','集团-投资管理部',21 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2507','集团-财务部','集团-财务部',22 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2508','集团-合约管理部','集团-合约管理部',23 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2510','集团-行政办公室','集团-行政办公室',24 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2512','集团-组织人事部','集团-组织人事部',25 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2513','集团-审计室','集团-审计室',26 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2514','集团-保卫部','集团-保卫部',27 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2518','集团-企业管理发展部','集团-企业管理发展部',28 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2519','集团-运营安全监察室','集团-运营安全监察室',29 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2549','集团-信息管理中心','集团-信息管理中心',30 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2953','项目公司-9号线','项目公司-9号线',31 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2949','项目公司-10号线','项目公司-10号线',32 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2954','项目公司-11号线','项目公司-11号线',33 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2951','项目公司-12号线','项目公司-12号线',34 from af_ccate where type='appDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2952','项目公司-13号线','项目公司-13号线',35 from af_ccate where type='appDept';



delete from af_codes where ccate_id in(select id from af_ccate where type='appType');
delete from af_ccate where type='appType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'appType','软件类型','软件类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'opsys','操作系统','操作系统',1 from af_ccate where type='appType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'oa','办公软件','办公软件',2 from af_ccate where type='appType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'app','应用软件','应用软件' ,3 from af_ccate where type='appType';


delete from af_codes where ccate_id in(select id from af_ccate where type='appLevel');
delete from af_ccate where type='appLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'appLevel','软件等级','软件等级字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'oa','basic','基础','基础',1 from af_ccate where type='appLevel';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'oa','senior','高级','高级' ,2 from af_ccate where type='appLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='appName');
delete from af_ccate where type='appName';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'appName','软件名称','软件名称字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'opsys','windows','Windows','Windows',1 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'basic','office','Office','Office' ,2 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'basic','wps','WPS','WPS',3 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'senior','project','Project','Project' ,4 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'senior','visio','VISIO','VISIO',5 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','autocad','AutoCAD','AutoCAD' ,6 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','photoshop','Photoshop','Photoshop',7 from af_ccate where type='appName';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','acrobat','acrobat','acrobat' ,8 from af_ccate where type='appName';

delete from af_codes where ccate_id in(select id from af_ccate where type='appVersion');
delete from af_ccate where type='appVersion';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'appVersion','软件版本','软件版本字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'windows','XP','XP','XP',1 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'windows','7','7','7',2 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'windows','8','8','8',3 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'office','2007','2007','2007' ,4 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'office','2010','2010','2010' ,5 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'office','2013','2013','2013' ,6 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'wps','2012','2012','2012',7 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'wps','2013','2013','2013',8 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'project','2007','2007','2007' ,9 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'project','2010','2010','2010' ,10 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'project','2013','2013','2013' ,11 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'visio','2007','2007','2007',12 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'visio','2010','2010','2010',13 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'visio','2013','2013','2013',14 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'autocad','2012','2012','2012' ,15 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'autocad','other','其他','其他' ,16 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'photoshop','CS6','CS6','CS6',17 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'photoshop','other','其他','其他',18 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'acrobat','11','11','11' ,19 from af_ccate where type='appVersion';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'acrobat','other','其他','其他' ,20 from af_ccate where type='appVersion';


delete from af_codes where ccate_id in(select id from af_ccate where type='authorize');
delete from af_ccate where type='authorize';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'authorize','授权情况','授权情况字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已授权','已授权',1 from af_ccate where type='authorize';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未授权','未授权' ,2 from af_ccate where type='authorize';

delete from af_codes where ccate_id in(select id from af_ccate where type='managerRole');
delete from af_ccate where type='managerRole';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'managerRole','信息安全角色','信息安全角色字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'principal','信息安全责任人','信息安全责任人',1 from af_ccate where type='managerRole';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'producePrincipal','生产信息安全工作负责人','生产信息安全工作负责人',2 from af_ccate where type='managerRole';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterprisePrincipal','企业信息安全工作负责人','企业信息安全工作负责人',3 from af_ccate where type='managerRole';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'linkmanA','信息安全工作联络人（A角）','信息安全工作联络人（A角）' ,4 from af_ccate where type='managerRole';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'linkmanB','信息安全工作联络人（B角）','信息安全工作联络人（B角）' ,5 from af_ccate where type='managerRole';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'member','信息安全工作组成员','信息安全工作组成员' ,6 from af_ccate where type='managerRole';



------------------------------------------------------------------securityPlan---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='planYear');
delete from af_ccate where type='planYear';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planYear','计划年度','计划年度字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2014','2014','2014' ,1 from af_ccate where type='planYear';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2015','2015','2015' ,2 from af_ccate where type='planYear';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2016','2016','2016' ,3 from af_ccate where type='planYear';

delete from af_codes where ccate_id in(select id from af_ccate where type='planBusinessStatus');
delete from af_ccate where type='planBusinessStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planBusinessStatus','目标计划业务状态','目标计划业务状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'new','新增','新增',1 from af_ccate where type='planBusinessStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'underway','进行中','进行中',2 from af_ccate where type='planBusinessStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'change','计划变更','计划变更',3 from af_ccate where type='planBusinessStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','完成','完成' ,4 from af_ccate where type='planBusinessStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityPlanStatus');
delete from af_ccate where type='securityPlanStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityPlanStatus','目标计划审批状态','目标计划审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿',1 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'principalAudit','工作负责人审核中','工作负责人审核中',2 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'principalBack','工作负责人退回','工作负责人退回',3 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptAudit','信息管理中心审查中','信息管理中心审查中' ,4 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','信息管理中心审查退回','信息管理中心审查退回',5 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderAudit','信息管理中心领导审批中','信息管理中心领导审批中',6 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptLeaderBack','信息管理中心领导审批退回','信息管理中心领导审批退回' ,7 from af_ccate where type='securityPlanStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'pass','审批通过','审批通过' ,8 from af_ccate where type='securityPlanStatus';


delete from af_codes where ccate_id in(select id from af_ccate where type='planType');
delete from af_ccate where type='planType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planType','计划类型','计划类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'levelReview','等保测评','等保测评',1 from af_ccate where type='planType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'securityCheck','技术检测','技术检测',2 from af_ccate where type='planType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoTrain','安全培训','安全培训',3 from af_ccate where type='planType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'emergencyPlan','应急演练','应急演练' ,4 from af_ccate where type='planType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'securityRectify','专项整改','专项整改',5 from af_ccate where type='planType';


delete from af_codes where ccate_id in(select id from af_ccate where type='planSystemLevel');
delete from af_ccate where type='planSystemLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planSystemLevel','系统等级','系统等级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level0','无','无' ,1 from af_ccate where type='planSystemLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level1','第一级','第一级' ,2 from af_ccate where type='planSystemLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level2','第二级','第二级' ,3 from af_ccate where type='planSystemLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level3','第三级','第三级' ,4 from af_ccate where type='planSystemLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level4','第四级','第四级' ,5 from af_ccate where type='planSystemLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'level5','第五级','第五级' ,6 from af_ccate where type='planSystemLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='planBusinessLevel');
delete from af_ccate where type='planBusinessLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planBusinessLevel','计划业务层级','计划业务层级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'none','无','无',1 from af_ccate where type='planBusinessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterpriseSecurity','企业信息安全','企业信息安全',2 from af_ccate where type='planBusinessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produceSecurity','生产信息安全','生产信息安全',3 from af_ccate where type='planBusinessLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'bothSecurity','企业/生产信息安全','企业/生产信息安全' ,4 from af_ccate where type='planBusinessLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='planImplement');
delete from af_ccate where type='planImplement';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'planImplement','计划业务层级','计划业务层级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'none','无','无',1 from af_ccate where type='planImplement';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'self','自测','自测',2 from af_ccate where type='planImplement';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'thirdParty','第三方','第三方',3 from af_ccate where type='planImplement';

------------------------------------------------------------------securityEvent---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='securityEventCate');
delete from af_ccate where type='securityEventCate';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityEventCate','安全事件业务分类','安全事件业务分类字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterprise','企业','企业',1 from af_ccate where type='securityEventCate';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produce','生产','生产',2 from af_ccate where type='securityEventCate';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'both','企业/生产','企业/生产',3 from af_ccate where type='securityEventCate';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityEventSource');
delete from af_ccate where type='securityEventSource';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityEventSource','安全事件信息来源','安全事件信息来源字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'inner','内部','内部',1 from af_ccate where type='securityEventSource';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'outer','外部','外部',2 from af_ccate where type='securityEventSource';


delete from af_codes where ccate_id in(select id from af_ccate where type='securityEventType');
delete from af_ccate where type='securityEventType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityEventType','安全事件类型','安全事件类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'badCode','有害程序事件','有害程序事件',1 from af_ccate where type='securityEventType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'netAttack','网络攻击事件','网络攻击事件',2 from af_ccate where type='securityEventType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDestory','信息破坏事件','信息破坏事件',3 from af_ccate where type='securityEventType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'systemAttack','工业控制系统攻击事件','工业控制系统攻击事件',4 from af_ccate where type='securityEventType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deviceBreak','设备设施故障事件','设备设施故障事件',5 from af_ccate where type='securityEventType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'disaster','灾害性事件 ','灾害性事件',6 from af_ccate where type='securityEventType';


delete from af_codes where ccate_id in(select id from af_ccate where type='securityEventLevel');
delete from af_ccate where type='securityEventLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityEventLevel','安全事件等级','安全事件等级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'lv1','特别重大事件（Ⅰ级）','特别重大事件（Ⅰ级）',1 from af_ccate where type='securityEventLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'lv2','重大事件（Ⅱ级）','重大事件（Ⅱ级）',2 from af_ccate where type='securityEventLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'lv3','较大事件（Ⅲ级）','较大事件（Ⅲ级）',3 from af_ccate where type='securityEventLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'lv4','一般事件（Ⅳ级）','一般事件（Ⅳ级）',4 from af_ccate where type='securityEventLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'lv5','一般以下事件（V级）','一般以下事件（V级）',5 from af_ccate where type='securityEventLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityEventStatus');
delete from af_ccate where type='securityEventStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityEventStatus','安全事件审批状态','安全事件审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿',1 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'businessReview','业务负责人审核','业务负责人审核',2 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'businessBack','业务负责人退回','业务负责人退回',3 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderReview','部门安全负责人审核','部门安全负责人审核',4 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'deptLeaderBack','部门安全负责人退回','部门安全负责人退回',5 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptReview','信息中心安全负责人审核','信息中心安全负责人审核',6 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','信息中心安全负责人退回','信息中心安全负责人退回',7 from af_ccate where type='securityEventStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','审核通过','审核通过',8 from af_ccate where type='securityEventStatus';

------------------------------------------------------------------securityIssue---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='securityIssueCate');
delete from af_ccate where type='securityIssueCate';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityIssueCate','安全问题业务类别','安全问题业务类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterprise','企业','企业',1 from af_ccate where type='securityIssueCate';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produce','生产','生产',2 from af_ccate where type='securityIssueCate';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'both','企业/生产','企业/生产',3 from af_ccate where type='securityIssueCate';


delete from af_codes where ccate_id in(select id from af_ccate where type='securityIssueSubject');
delete from af_ccate where type='securityIssueSubject';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityIssueSubject','安全问题科目','安全问题科目字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'physical','物理安全','物理安全',1 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'network','网络安全','网络安全',2 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'system','系统安全','系统安全',3 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'app','应用安全','应用安全',4 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'data','数据安全','数据安全',5 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'termial','终端安全','终端安全',6 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'rule','安全管理制度','安全管理制度',7 from af_ccate where type='securityIssueSubject';	
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'organ','组织机构管理','组织机构管理',8 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'staff','人员安全管理','人员安全管理',9 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'build','建设安全管理','建设安全管理',10 from af_ccate where type='securityIssueSubject';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','运维安全管理','运维安全管理',11 from af_ccate where type='securityIssueSubject';	

delete from af_codes where ccate_id in(select id from af_ccate where type='securityIssueItem');
delete from af_ccate where type='securityIssueItem';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityIssueItem','安全问题科目子类','安全问题科目子类字典类' from dual;
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','1','机房人员及设备出入管理','机房人员及设备出入管理',1 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','2','机房消防安全','机房消防安全' ,2 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','3','温湿度控制','温湿度控制',3 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','4','防盗窃和防破坏','防盗窃和防破坏',4 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','5','防水防潮','防水防潮' ,5 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','6','电力供应','电力供应' ,6 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','7','设备管理','设备管理',7 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'physical','8','电磁防护','电磁防护',8 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','11','网络隔离','网络隔离' ,9 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','12','网络边界防护','网络边界防护',10 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','13','无线网络安全','无线网络安全',11 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','14','网络安全审计','网络安全审计',12 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','15','网络设备防护','网络设备防护',13 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','16','VPN安全管控','VPN安全管控',14 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','17','网络资源审批','网络资源审批' ,15 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'network','18','网络安全管理','网络安全管理',16 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','21','身份鉴别机制','身份鉴别机制' ,17 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','22','访问控制','访问控制',18 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','23','安全审计','安全审计' ,19 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','24','入侵防护','入侵防护',20 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','25','恶意代码防范','恶意代码防范',21 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','26','漏洞扫描','漏洞扫描' ,22 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','27','移动存储介质','移动存储介质',23 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'system','28','系统安全管理','系统安全管理',24 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','31','身份鉴别机制','身份鉴别机制' ,25 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','32','访问控制','访问控制',26 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','33','安全审计','安全审计',27 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','34','漏洞扫描','漏洞扫描' ,28 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','35','门户网站防护','门户网站防护',29 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','36','电子邮件防护','电子邮件防护',30 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','37','应用安全管理','应用安全管理' ,31 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'app','38','网络安全管理','网络安全管理',32 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'data','41','数据备份与恢复','数据备份与恢复' ,33 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'data','42','数据存储安全','数据存储安全' ,34 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'data','43','数据传输安全','数据传输安全',35 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'data','44','系统冗余','系统冗余',36 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'termial','51','终端安全管控','终端安全管控' ,37 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'termial','52','终端安全管控','终端安全管控' ,38 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'rule','61','责任制落实情况','责任制落实情况',39 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'rule','62','信息安全总体方针','信息安全总体方针',40 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'rule','63','年度目标计划','年度目标计划' ,41 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'rule','64','信息安全管理制度','信息安全管理制度',42 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'organ','71','责任制落实情况','责任制落实情况',43 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'organ','72','信息安全专员','信息安全专员' ,44 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'organ','73','人员配备','人员配备',45 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'organ','74','授权审批','授权审批',46 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'organ','75','审核和检查','审核和检查' ,47 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'staff','81','人员录用','人员录用',48 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'staff','82','人员离岗','人员离岗' ,49 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'staff','83','人员考核','人员考核',50 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'staff','84','信息安全教育培训','信息安全教育培训' ,51 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'staff','85','人员惩处','人员惩处',52 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'build','91','系统定级','系统定级',53 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'build','92','采购管理','采购管理' ,54 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'build','93','外包管理','外包管理',55 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'build','94','测试验收','测试验收',56 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'build','95','系统交付','系统交付' ,57 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','101','资产管理','资产管理',58 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','102','介质管理','介质管理',59 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','103','经费保障','经费保障' ,60 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','104','设备管理','设备管理',61 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','105','变更管理','变更管理',62 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','106','安全事件处置','安全事件处置' ,63 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','107','应急管理','应急管理',64 from af_ccate where type='securityIssueItem';
insert into af_codes(id,ccate_id,pcode,code,display,description,orders) select seq_af_codes.nextval,id,'maintain','108','等级测评','等级测评' ,65 from af_ccate where type='securityIssueItem';




delete from af_codes where ccate_id in(select id from af_ccate where type='rectifyPlan');
delete from af_ccate where type='rectifyPlan';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'rectifyPlan','整改方案','整改方案字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已制定','已制定',1 from af_ccate where type='rectifyPlan';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未制定','未制定',2 from af_ccate where type='rectifyPlan';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ing','制定中','制定中',3 from af_ccate where type='rectifyPlan';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'doNot','无需制定','无需制定',4 from af_ccate where type='rectifyPlan';

delete from af_codes where ccate_id in(select id from af_ccate where type='actualSituation');
delete from af_ccate where type='actualSituation';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'actualSituation','整改情况','整改情况字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已整改','已整改',1 from af_ccate where type='actualSituation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未整改','未整改',2 from af_ccate where type='actualSituation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ing','整改中','整改中',3 from af_ccate where type='actualSituation';


delete from af_codes where ccate_id in(select id from af_ccate where type='checkSituation');
delete from af_ccate where type='checkSituation';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'checkSituation','复核情况','复核情况字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','通过','通过',1 from af_ccate where type='checkSituation';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未通过','未通过',2 from af_ccate where type='checkSituation';

	
delete from af_codes where ccate_id in(select id from af_ccate where type='securityIssueStatus');
delete from af_ccate where type='securityIssueStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityIssueStatus','安全问题审批状态','安全问题审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿',1 from af_ccate where type='securityIssueStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptReview','信息中心安全负责人审核','信息中心安全负责人审核',2 from af_ccate where type='securityIssueStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','信息中心安全负责人退回','信息中心安全负责人退回',3 from af_ccate where type='securityIssueStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','审核通过','审核通过',4 from af_ccate where type='securityIssueStatus';


------------------------------------------------------------------securityRisk---------------------------------------------------

delete from af_codes where ccate_id in(select id from af_ccate where type='securityRiskType');
delete from af_ccate where type='securityRiskType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityRiskType','安全风险类别','安全风险类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'enterprise','企业','企业',1 from af_ccate where type='securityRiskType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'produce','生产','生产',2 from af_ccate where type='securityRiskType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'both','企业/生产','企业/生产',3 from af_ccate where type='securityRiskType';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityRiskLevel');
delete from af_ccate where type='securityRiskLevel';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityRiskLevel','安全风险等级','安全风险等级字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'1','高','高',1 from af_ccate where type='securityRiskLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2','中','中',2 from af_ccate where type='securityRiskLevel';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'3','低','低',3 from af_ccate where type='securityRiskLevel';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityRiskHandle');
delete from af_ccate where type='securityRiskHandle';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityRiskHandle','风险处置方案','风险处置方案字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已制定','已制定',1 from af_ccate where type='securityRiskHandle';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未制定','未制定',2 from af_ccate where type='securityRiskHandle';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ing','制定中','制定中',3 from af_ccate where type='securityRiskHandle';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'doNot','无需制定','无需制定',4 from af_ccate where type='securityRiskHandle';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityRiskTrace');
delete from af_ccate where type='securityRiskTrace';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityRiskTrace','处理跟踪情况','处理跟踪情况字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已整改','已整改',1 from af_ccate where type='securityRiskTrace';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未整改','未整改',2 from af_ccate where type='securityRiskTrace';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ing','整改中','整改中',3 from af_ccate where type='securityRiskTrace';

delete from af_codes where ccate_id in(select id from af_ccate where type='securityRiskStatus');
delete from af_ccate where type='securityRiskStatus';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'securityRiskStatus','安全风险审批状态','安全风险审批状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿',1 from af_ccate where type='securityRiskStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptReview','信息中心安全负责人审核','信息中心安全负责人审核',2 from af_ccate where type='securityRiskStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'infoDeptBack','信息中心安全负责人退回','信息中心安全负责人退回',3 from af_ccate where type='securityRiskStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','审核通过','审核通过',4 from af_ccate where type='securityRiskStatus';


------------------------------------------------------------------annualCost---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='annualCostType');
delete from af_ccate where type='annualCostType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'annualCostType','年度成本类型','年度成本类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'serviceDept','维保公司','维保公司',1 from af_ccate where type='annualCostType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'groupUnit','集团本部','集团本部',2 from af_ccate where type='annualCostType';

------------------------------------------------------------------specialProject---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='replyType');
delete from af_ccate where type='replyType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'replyType','批复状态','批复状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已批复','已批复',1 from af_ccate where type='replyType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未批复','未批复',2 from af_ccate where type='replyType';
------------------------------------------------------------------specialContract---------------------------------------------------
delete from af_codes where ccate_id in(select id from af_ccate where type='signType');
delete from af_ccate where type='signType';
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'signType','签订状态','签订状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','已签订','已签订',1 from af_ccate where type='signType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未签订','未签订',2 from af_ccate where type='signType';

------------------------------------------------------------------import_config--------------------------------------------------------
insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'dept', '单位', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'deviceNum', '设备编号', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'macAddress', 'mac地址', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appType', '软件类型', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appLevel', '软件级别', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appName', '软件名称', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'appVersion', '版本号', 'appVersion_title_1', 1, 0);

insert into af_import_config (ID, ENTITY, ENTITY_FIELD, EXCEL_FIELD, TYPE, HAS_TITLE, REMOVED)
values (seq_af_import_config.nextval, 'appVersion', 'authorize', '授权情况', 'appVersion_title_1', 1, 0);

------------------------------------------------------------------power--------------------------------------------------------
insert into iims_power (ID, USERS, MODULES, ALLOW_OPERATE, OPERATOR, OPERATE_TIME, REMOVED)
values (seq_iims_power.nextval, 'G002000000332549,G020001000492549,G001000002232549,G001000001612549', 'equipment', 'add,del,update,query', 'G003', sysdate, 0);
------------------------------------------------------------------target--------------------------------------------------------
truncate table iims_target;
---------------------------------------信息安全------------------------------
------------------------安全计划目标:safePlanTarget
------等保测评:dbcp
------1、等保测评计划数：dbcp_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','dbcp_planNum',29,null);
------2、等保测评完成数：dbcp_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','dbcp_finishNum',29,null);

-----技术检测:jsjc
-----1、技术检测计划数：jsjc_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','jsjc_planNum',7,null);
-----2、技术检测完成数：jsjc_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','jsjc_finishNum',6,null);

-----教育培训：jypx
-----1、教育培训计划数：jypx_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','jypx_planNum',17,null);
-----2、教育培训完成数:jypx_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','jypx_finishNum',14,null);

-----应急演练：yjyl
-----1、应急演练计划数：yjyl_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','yjyl_planNum',12,null);
-----2、应急演练完成数：yjyl_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','yjyl_finishNum',11,null);

-----专项整改：zxzg
-----1、专项整改计划数：zxzg_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','zxzg_planNum',8,null);
-----2、专项整改完成数：zxzg_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'safePlanTarget','zxzg_finishNum',5,null);

------------------------风险防控管理:riskManagement
-----安全风险总数：aqfx_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','aqfx_total',424,null);
-----风险消除情况：fxxcqk_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','fxxcqk_total',208,null);
-----风险本月新增:fxbyxz_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','fxbyxz_total',0,null);
-----安全问题总数:aqwt_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','aqwt_total',422,null);
-----问题整改情况:wtzgqk_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','wtzgqk_total',209,null);
-----问题本月新增:wtbyxz_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'riskManagement','wtbyxz_total',2,null);

------------------------安全事件管理:securityEventManagement
-----年度安全事件总数:ndaqsj_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'securityEventManagement','ndaqsj_total',44,null);
-----年度较大安全事件总数:ndjdaqsj_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'securityEventManagement','ndjdaqsj_total',0,null);
-----当月事件发生总数:dysjfs_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'securityEventManagement','dysjfs_total',4,null);


---------------------------------------信息化项目------------------------------
------------------------项目计划指标：projectPlanTarget
-----前期策划:qqce
-----1、前期策划计划数：qqce_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','qqce_planNum',3,null);
-----2、前期策划完成数：qqce_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','qqce_finishNum',3,null);

-----立项：lx
-----1、立项计划数：lx_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','lx_planNum',1,null);
-----2、立项完成数：lx_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','lx_finishNum',1,null);

-----合同:ht
-----1、合同计划数：ht_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','ht_planNum',1,null);
-----2、合同完成数：ht_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','ht_finishNum',1,null);

-----初验（阶段实施）:cyjdss
-----1、初验计划数：cyjdss_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','cyjdss_planNum',8,null);
-----2、初验完成数：cyjdss_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','cyjdss_finishNum',8,null);

-----验收:ys
-----1、验收计划数：ys_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','ys_planNum',6,null);    
-----2、验收完成数：ys_finishNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectPlanTarget','ys_finishNum',6,null);  

------------------------项目动态:projectDynamic
------年度项目计划数：ndxm_planNum
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectDynamic','ndxm_planNum',19,null); 
------正常开展项目数：zckzxm_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectDynamic','zckzxm_total',19,null); 
------项目严重延迟数：xmyzyc_total
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'projectDynamic','xmyzyc_total',0,null); 


---------------------------------------资源管理及运维质量------------------------------
------------------------资源申请及办理情况:resourceApplyAndHandle
------资源申请数量:zysq_total
------1、资源申请数量-年度
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'resourceApplyAndHandle','zysq_total',1032,'year'); 
------1、资源申请数量-当月
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'resourceApplyAndHandle','zysq_total',247,'curMonth'); 

------已办结:ybj_total
------1、已办结-年度
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'resourceApplyAndHandle','ybj_total',1027,'year'); 
------2、已办结-当月
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'resourceApplyAndHandle','ybj_total',242,'curMonth'); 

------------------------运维情况：operationSituation
------故障接报数：gzjb_total
------1、故障接报数-年度
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'operationSituation','gzjb_total',6234,'year'); 
------2、故障接报数-当月
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'operationSituation','gzjb_total',534,'curMonth');

------完成数量：wc_total
------1、完成数量-年度
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'operationSituation','wc_total',6215,'year'); 
------2、完成数量-当月
insert into IIMS_TARGET(ID,TYPE,KEY,VALUE,TIME)
values(SEQ_IIMS_TARGET.nextval,'operationSituation','wc_total',515,'curMonth');


