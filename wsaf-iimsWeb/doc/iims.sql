/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2014-9-24 17:23:40                           */
/*==============================================================*/
drop sequence SEQ_IIMS_PROJECT_PLAN;

drop sequence SEQ_IIMS_WORKFLOW_LOG;

drop sequence SEQ_IIMS_MEETING;

drop sequence SEQ_IIMS_NET_RESOURCE;

drop sequence SEQ_IIMS_NET_RESOURCE_B;

drop sequence SEQ_IIMS_ACCOUNT_RESOURCE;

drop sequence SEQ_IIMS_ACCOUNT_RESOURCE_B;

drop sequence SEQ_IIMS_INTERNET_RESOURCE;

drop sequence SEQ_IIMS_INTERNET_RESOURCE_B;

drop sequence SEQ_IIMS_VPN_RESOURCE;

drop sequence SEQ_IIMS_VPN_RESOURCE_B;

drop sequence SEQ_IIMS_WIRELESS_RESOURCE;

drop sequence SEQ_IIMS_WIRELESS_RESOURCE_B;

drop sequence SEQ_IIMS_VIRTUAL_RESOURCE;

drop sequence SEQ_IIMS_VIRTUAL_RESOURCE_B;

drop sequence SEQ_IIMS_EQUIPMENT;

drop sequence SEQ_IIMS_POWER;

drop sequence SEQ_IIMS_SECURITY_LEVEL;

drop sequence SEQ_IIMS_SECURITY_LEVEL_C;

drop sequence SEQ_IIMS_SECURITY_CHECK;

drop sequence SEQ_IIMS_APP_VERSION;

drop sequence SEQ_IIMS_APP_COUNT;

drop sequence SEQ_IIMS_MANAGER;

drop sequence SEQ_IIMS_TARGET;

drop sequence SEQ_IIMS_SECURITY_PLAN;

drop sequence SEQ_IIMS_SECURITY_PLAN_D;

drop sequence SEQ_IIMS_SECURITY_EVENT;

drop sequence SEQ_IIMS_SECURITY_ISSUE;

drop sequence SEQ_IIMS_SECURITY_RISK;

drop sequence SEQ_IIMS_ANNUAL_COST;

drop sequence SEQ_IIMS_PROJECT_COST;

drop sequence SEQ_IIMS_CONTRACT_COST;

drop sequence SEQ_IIMS_SPECIAL;

drop sequence SEQ_IIMS_SPECIAL_BUDGET;

drop sequence SEQ_IIMS_SPECIAL_PROJECT;

drop sequence SEQ_IIMS_SPECIAL_CONTRACT;

drop table IIMS_PROJECT_PLAN cascade constraints;

drop table IIMS_WORKFLOW_LOG cascade constraints;

drop table IIMS_MEETING cascade constraints;

drop table IIMS_NET_RESOURCE cascade constraints;

drop table IIMS_NET_RESOURCE_BOOK cascade constraints;

drop table IIMS_ACCOUNT_RESOURCE cascade constraints;

drop table IIMS_ACCOUNT_RESOURCE_BOOK cascade constraints;

drop table IIMS_INTERNET_RESOURCE cascade constraints;

drop table IIMS_INTERNET_RESOURCE_BOOK cascade constraints;

drop table IIMS_VPN_RESOURCE cascade constraints;

drop table IIMS_VPN_RESOURCE_BOOK cascade constraints;

drop table IIMS_WIRELESS_RESOURCE cascade constraints;

drop table IIMS_WIRELESS_RESOURCE_BOOK cascade constraints;

drop table IIMS_VIRTUAL_RESOURCE cascade constraints;

drop table IIMS_VIRTUAL_RESOURCE_BOOK cascade constraints;

drop table IIMS_EQUIPMENT cascade constraints;

drop table IIMS_POWER cascade constraints;

drop table IIMS_SECURITY_LEVEL cascade constraints;

drop table IIMS_SECURITY_LEVEL_COMPANY cascade constraints;

drop table IIMS_SECURITY_CHECK cascade constraints;

drop table IIMS_APP_VERSION cascade constraints;

drop table IIMS_APP_COUNT cascade constraints;

drop table IIMS_MANAGER cascade constraints;

drop table IIMS_TARGET cascade constraints;

drop table IIMS_SECURITY_PLAN cascade constraints;

drop table IIMS_SECURITY_PLAN_DETAIL cascade constraints;

drop table IIMS_SECURITY_EVENT cascade constraints;

drop table IIMS_SECURITY_ISSUE cascade constraints;

drop table IIMS_SECURITY_RISK cascade constraints;

drop table IIMS_ANNUAL_COST cascade constraints;
drop table IIMS_PROJECT_COST cascade constraints;
drop table IIMS_CONTRACT_COST cascade constraints;
drop table IIMS_SPECIAL cascade constraints;
drop table IIMS_SPECIAL_BUDGET cascade constraints;
drop table IIMS_SPECIAL_PROJECT cascade constraints;
drop table IIMS_SPECIAL_CONTRACT cascade constraints;

/*==============================================================*/
/* SEQUENCE OF IIMS                                                 */
/*==============================================================*/

create sequence SEQ_IIMS_PROJECT_PLAN
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_IIMS_WORKFLOW_LOG
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_MEETING
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_NET_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_IIMS_ACCOUNT_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_INTERNET_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_VPN_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_WIRELESS_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_VIRTUAL_RESOURCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_IIMS_WIRELESS_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_NET_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_ACCOUNT_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_INTERNET_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_VPN_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_IIMS_VIRTUAL_RESOURCE_B
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_EQUIPMENT
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_POWER 
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_SECURITY_LEVEL 
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_SECURITY_LEVEL_C 
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_SECURITY_CHECK 
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_APP_VERSION 
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_APP_COUNT
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_MANAGER
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_TARGET
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SECURITY_PLAN
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IIMS_SECURITY_PLAN_D
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SECURITY_EVENT
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SECURITY_ISSUE
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SECURITY_RISK
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_ANNUAL_COST
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_PROJECT_COST
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_CONTRACT_COST
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SPECIAL
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SPECIAL_BUDGET
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SPECIAL_PROJECT
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_IIMS_SPECIAL_CONTRACT
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;
/*==============================================================*/
/* Table: IIMS_PROJECT_PLAN(项目计划)                                          */
/*==============================================================*/
create table IIMS_PROJECT_PLAN 
(
   ID                   INTEGER              not null,
   PROJECT_NUM          VARCHAR2(20),
   REPORT_UNIT          VARCHAR2(50),
   REPORT_UNIT_ID       VARCHAR2(10),
   YEAR                 VARCHAR2(4) not null,
   LINE                 VARCHAR2(50),
   PROJECT_NAME         VARCHAR2(100) not null,
   MAIN_CONTENT         VARCHAR2(1500) not null,
   PLANNING_PART        VARCHAR2(50),
   YEAR_TARGET          VARCHAR2(50),
   YEAR_TARGET_REASON   VARCHAR2(500),   
   TOTAL_INVEST_ESTIMATE NUMBER(8, 2) not null,
   LINE_BUDGET          VARCHAR2(200),
   PROJECT_TYPE         VARCHAR2(50),
   ASSET_CATEGORY1      VARCHAR2(50),
   ASSET_CATEGORY2      VARCHAR2(50),
   ASSET_CATEGORY3      VARCHAR2(50),
   INVITE_BID           VARCHAR2(50),
   DESIGN               VARCHAR2(50),
   SUPERVISION          VARCHAR2(50),
   RESOURCE_REQUIREMENT VARCHAR2(1000),
   SECURITY_LEVEL       VARCHAR2(20) not null,
   PLAN_START_DATE      Date not null,
   PLAN_END_DATE        Date not null,
   FUND_PLAN1           NUMBER(8, 2),
   FUND_PLAN2           NUMBER(8, 2),
   FUND_PLAN3           NUMBER(8, 2),
   FUND_PLAN4           NUMBER(8, 2),
   FUND_PLAN_ALL        NUMBER(8, 2),
   REMARKS              VARCHAR2(1500),
   APPLYER            VARCHAR2(200) not null,
   APPLYER_LOGINNAME  VARCHAR2(200) not null,   
   APPLY_TIME        DATE not null,   
   INITIATOR            VARCHAR2(200) not null,
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,
   INITIATE_TIME        DATE not null,
   SUGGESTION           VARCHAR2(1500),
   HANDLER              VARCHAR2(200),
   HANDLER_LOGINNAME    VARCHAR2(200),
   PROJECT_STATUS       VARCHAR2(20) not null,
   STATUS               VARCHAR2(20) not null,
   REMOVED              INTEGER default 0  not null,
   constraint PK_IIMS_PROJECT_PLAN primary key (ID)
);
alter table IIMS_PROJECT_PLAN add BUSINESS_TYPE VARCHAR2(50);
alter table IIMS_PROJECT_PLAN add BUSINESS_LEVEL VARCHAR2(50);
alter table IIMS_PROJECT_PLAN add IMPLEMENT_CONTENT VARCHAR2(1000);
alter table IIMS_PROJECT_PLAN add SUGGEST_IMPLEMENT_UNIT VARCHAR2(50);
alter table IIMS_PROJECT_PLAN add SUGGEST_COST_PROPERTY VARCHAR2(50);
alter table IIMS_PROJECT_PLAN add SUGGEST_COST_TYPE VARCHAR2(50);


comment on column IIMS_PROJECT_PLAN.PROJECT_TYPE is
'新建项目/系统完善/应用推进';

comment on column IIMS_PROJECT_PLAN.ASSET_CATEGORY1 is
'新建项目：21(信息系统设备)';

comment on column IIMS_PROJECT_PLAN.ASSET_CATEGORY2 is
'01(硬件设备)/02(软件)/99(其他信息系统设备)';

comment on column IIMS_PROJECT_PLAN.ASSET_CATEGORY3 is
'中类为01(硬件设备):01(主机),02(外设),03(网络),04(存储设备),99(其他);中类为02(软件):01(系统软件),02(应用软件),99(其他);中类为99(其他信息系统设备):小类可不填';

comment on column IIMS_PROJECT_PLAN.INVITE_BID is
'招标/非招标';

comment on column IIMS_PROJECT_PLAN.DESIGN is
'是/否';

comment on column IIMS_PROJECT_PLAN.SUPERVISION is
'是/否';

comment on column IIMS_PROJECT_PLAN.SECURITY_LEVEL is
'一级/二级/三级';

comment on column IIMS_PROJECT_PLAN.STATUS is
'草稿/部门领导待审核/退回/内部审核完毕';

comment on column IIMS_PROJECT_PLAN.PROJECT_STATUS is
'部门内部申报/信息中心审核/入储备库/台账';

/*==============================================================*/
/* Table: IIMS_WORKFLOW_LOG（流转日志）                                          */
/*==============================================================*/
create table IIMS_WORKFLOW_LOG 
(
   ID                   INTEGER not null,
   P_TYPE          		VARCHAR2(50) not null,
   P_ID          		INTEGER not null,
   INITIATOR       		VARCHAR2(200) not null,
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,
   INITIATE_TIME        DATE not null,
   SUGGESTION        	VARCHAR2(1500),
   HANDLER         		VARCHAR2(200),
   HANDLER_LOGINNAME    VARCHAR2(200),
   HANDLE_TIME     		DATE,
   STATUS        		VARCHAR2(50) not null,
   TODO_ITEM_ID         VARCHAR2(50),
   REMOVED              INTEGER default 0  not null,
   constraint PK_IIMS_WORKFLOW_LOG primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_MEETING（会议）                                          */
/*==============================================================*/
create table IIMS_MEETING 
(
   ID                   INTEGER not null,
   MEETING_NUM          VARCHAR2(50),
   MEETING_TYPE         VARCHAR2(50),
   TITLE          		VARCHAR2(500) not null,
   START_DATE       	DATE not null,   
   START_TIME       	VARCHAR2(20),
   END_TIME       		VARCHAR2(20),   
   MEETING_ROOM  		VARCHAR2(50),
   TOPIC        		VARCHAR2(1000),
   MASTER        		VARCHAR2(50),
   PRESENT_MEMBERS      VARCHAR2(500),
   APPLYER        		VARCHAR2(50),
   REMARKS              VARCHAR2(1500),
   REMOVED              INTEGER default 0  not null,
   constraint PK_IIMS_MEETING primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_NET_RESOURCE(网络资源)                                          */
/*==============================================================*/
create table IIMS_NET_RESOURCE 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--位置
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:netBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--用途
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：netTerminalType  
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   IMPLEMENT_PLACE 		VARCHAR2(500),			--开通位置         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--审批状态:resourceStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_NET_RESOURCE primary key (ID)
);

alter table IIMS_NET_RESOURCE add POST VARCHAR2(50);--职务
alter table IIMS_NET_RESOURCE add SWITCH_DEVICE_CODE VARCHAR2(100);--交换机设备编号
alter table IIMS_NET_RESOURCE add PORT VARCHAR2(10);--端口  
alter table IIMS_NET_RESOURCE add VLAN VARCHAR2(50);--VLAN    
alter table IIMS_NET_RESOURCE add NET_STATUS VARCHAR2(50);--业务状态：netStatus(UP/DOWN)
alter table IIMS_NET_RESOURCE add INTERFACE_INFO VARCHAR2(100);--接口信息
alter table IIMS_NET_RESOURCE add IP VARCHAR2(50);--IP/掩码
alter table IIMS_NET_RESOURCE add MAC VARCHAR2(50);--MAC地址
alter table IIMS_NET_RESOURCE add GATEWAY VARCHAR2(20);--网关
alter table IIMS_NET_RESOURCE add SYS_NAME VARCHAR2(100);--系统名
/*==============================================================*/
/* Table: IIMS_ACCOUNT_RESOURCE(账户资源)                                          */
/*==============================================================*/
create table IIMS_ACCOUNT_RESOURCE 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   DEPT       			VARCHAR2(100),	--部门
   POST       			VARCHAR2(50),	--职务
   LOGIN_NAME       	VARCHAR2(50),	--员工工号
   SYS_NAME       		VARCHAR2(100),	--系统名
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:accountBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--办理时间
   ACCOUNT_NAME 		VARCHAR2(100),			--账户名称         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--状态:resourceStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_ACCOUNT_RESOURCE primary key (ID)
);

alter table IIMS_ACCOUNT_RESOURCE add PLACE VARCHAR2(200);--开通位置


/*==============================================================*/
/* Table: IIMS_INTERNET_RESOURCE(互联网资源)                                          */
/*==============================================================*/
create table IIMS_INTERNET_RESOURCE 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--位置
   DEPT       			VARCHAR2(100),	--部门
   POST       			VARCHAR2(50),	--职务
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：netTerminalType  
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   IMPLEMENT_PLACE 		VARCHAR2(500),			--开通位置         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--状态:resourceStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_INTERNET_RESOURCE primary key (ID)
);
alter table IIMS_INTERNET_RESOURCE add APPLY_BUSINESS_TYPE VARCHAR2(50);--申请业务类型:internetBusinessType（集团互联网业务（仅访问官方网站、企业邮箱，默认选项）/访问常用互联网资源（必须描述清楚访问用途和方式）/访问特殊互联网资源（有特殊应用需求才可申请）/其它）

/*==============================================================*/
/* Table: IIMS_VPN_RESOURCE(VPN资源)                                          */
/*==============================================================*/
create table IIMS_VPN_RESOURCE 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:vpnBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   ACCOUNT_NAME 		VARCHAR2(100),			--帐户名称         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:wirelessApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--状态:resourceStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_VPN_RESOURCE primary key (ID)
);
alter table IIMS_VPN_RESOURCE add POST VARCHAR2(50);--职务
alter table IIMS_VPN_RESOURCE add PERMISSIONS VARCHAR2(100);--访问权限  
alter table IIMS_VPN_RESOURCE add USER_GROUP VARCHAR2(100);--用户组   
/*==============================================================*/
/* Table: IIMS_WIRELESS_RESOURCE(无线网络资源)                                          */
/*==============================================================*/
create table IIMS_WIRELESS_RESOURCE 
(
   ID                   INTEGER not null,
   BUSINESS_CODE        VARCHAR2(50),	--编号  
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--用途
   USER_POST 			VARCHAR2(50),			--职务     
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--业务类型:wirelessBusinessType
   START_DATE  			DATE,	--开始使用日期
   END_DATE 			DATE,	--结束使用日期
   COMPANY_NAME  		VARCHAR2(200),	--单位名称
   STAFF_CARD_ID  		VARCHAR2(50),	--员工证号
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   USE_POSITION        	VARCHAR2(100),			--使用位置选择:wirelessUsePosition
   USE_POSITION2        VARCHAR2(100),			--使用位置选择2:wirelessUsePosition2
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   ACCOUNT_NAME 		VARCHAR2(100),			--帐户名称       
   MAC_ADDRESS 			VARCHAR2(50),			--MAC地址            
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：wirelessTerminalType      
   HANDLED_CONDITION 	VARCHAR2(1500),			--开通办理情况       
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:wirelessApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--状态:resourceStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0 not null,--逻辑删除标志位
   constraint PK_IIMS_WIRELESS_RESOURCE primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_VIRTUAL_RESOURCE(虚拟化资源)                                          */
/*==============================================================*/
create table IIMS_VIRTUAL_RESOURCE 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   PROJECT_ID			INTEGER,				--所属项目ID
   PROJECT_NAME			VARCHAR2(200),			--所属项目
   PROJECT_PRINCIPAL	VARCHAR2(200),			--项目负责人
   VIRTUAL_SERVER  		VARCHAR2(10) ,	--虚拟服务器
   MEMORY  		VARCHAR2(10) ,	--内存
   CPU  		VARCHAR2(10) ,	--CPU
   HARD_DISK  	VARCHAR2(10) ,	--硬盘
   OPSYS  		VARCHAR2(10) ,	--操作系统
   OPSYS_DESCRIPTION  		VARCHAR2(10) ,	--操作系统描述
   MIDDLEWARE  		VARCHAR2(10) ,	--中间件
   MIDDLEWARE_DESCRIPTION  		VARCHAR2(10) ,	--中间件描述
   DB  		VARCHAR2(10) ,	--数据库
   DB_DESCRIPTION  		VARCHAR2(10) ,	--数据库描述
   APPLY_TYPE       	VARCHAR2(50),	--申请类型:resourceApplyType
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   INITIATOR            VARCHAR2(200) not null,	--提交人
   INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交人时间
   SUGGESTION           VARCHAR2(1500),			--意见&建议
   HANDLER              VARCHAR2(200),			--处理人
   HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   STATUS 				VARCHAR2(50),			--状态:virtualStatus
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_VIRTUAL_RESOURCE primary key (ID)
);

alter table IIMS_VIRTUAL_RESOURCE add SYS_NAME VARCHAR2(100);--系统名
alter table IIMS_VIRTUAL_RESOURCE add HOST_NAME VARCHAR2(100);--主机名
alter table IIMS_VIRTUAL_RESOURCE add IP VARCHAR2(20);--IP地址   
alter table IIMS_VIRTUAL_RESOURCE add SOFTWARE VARCHAR2(200);--安装软件     
alter table IIMS_VIRTUAL_RESOURCE add IMPLEMENT_USER VARCHAR2(100);--办理人
alter table IIMS_VIRTUAL_RESOURCE add IMPLEMENT_TIME DATE;--办理时间

/*==============================================================*/
/* Table: IIMS_NET_RESOURCE_BOOK(网络资源台帐)                                          */
/*==============================================================*/
create table IIMS_NET_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--位置
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:netBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--用途
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：netTerminalType  
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   IMPLEMENT_PLACE 		VARCHAR2(500),			--开通位置         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   POST 				VARCHAR2(50),			--职务
   SWITCH_DEVICE_CODE 	VARCHAR2(100),			--交换机设备编号
   PORT 				VARCHAR2(10),			--端口  
   VLAN 				VARCHAR2(50),			--VLAN    
   NET_STATUS 			VARCHAR2(50),			--业务状态：netStatus(UP/DOWN)
   INTERFACE_INFO 		VARCHAR2(100),			--接口信息
   IP 					VARCHAR2(50),			--IP/掩码
   MAC 					VARCHAR2(50),			--MAC地址
   GATEWAY 				VARCHAR2(20),			--网关
   SYS_NAME 			VARCHAR2(100),			--系统名
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_NET_RESOURCE_BOOK primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_ACCOUNT_RESOURCE_BOOK(账户资源台帐)                                          */
/*==============================================================*/
create table IIMS_ACCOUNT_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   DEPT       			VARCHAR2(100),	--部门
   POST       			VARCHAR2(50),	--职务
   LOGIN_NAME       	VARCHAR2(50),	--员工工号
   SYS_NAME       		VARCHAR2(100),	--系统名
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:accountBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--办理时间
   ACCOUNT_NAME 		VARCHAR2(100),			--账户名称         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   PLACE                VARCHAR2(200),			--开通位置
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_ACCOUNT_RESOURCE_BOOK primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_INTERNET_RESOURCE_BOOK(互联网资源台帐)                                          */
/*==============================================================*/
create table IIMS_INTERNET_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--位置
   DEPT       			VARCHAR2(100),	--部门
   POST       			VARCHAR2(50),	--职务
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：netTerminalType  
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   IMPLEMENT_PLACE 		VARCHAR2(500),			--开通位置         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:resourceApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   APPLY_BUSINESS_TYPE  VARCHAR2(50),			--申请业务类型:internetBusinessType
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_INTERNET_RESOURCE_BOOK primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_VPN_RESOURCE_BOOK(VPN资源台帐)                                          */
/*==============================================================*/
create table IIMS_VPN_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--申请业务类型:vpnBusinessType
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   ACCOUNT_NAME 		VARCHAR2(100),			--帐户名称         
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:wirelessApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   POST 				VARCHAR2(50),			--职务
   PERMISSIONS 			VARCHAR2(100),			--访问权限  
   USER_GROUP			 VARCHAR2(100),			--用户组   
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_VPN_RESOURCE_BOOK primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_WIRELESS_RESOURCE_BOOK(无线网络资源台账)                                          */
/*==============================================================*/
create table IIMS_WIRELESS_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   BUSINESS_CODE        VARCHAR2(50),	--编号  
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   USE_PLACE       		VARCHAR2(500) not null,	--用途
   USER_POST 			VARCHAR2(50),			--职务     
   APPLY_BUSINESS_TYPE  VARCHAR2(50) not null,	--业务类型:wirelessBusinessType
   START_DATE  			DATE,	--开始使用日期
   END_DATE 			DATE,	--结束使用日期
   COMPANY_NAME  		VARCHAR2(200),	--单位名称
   STAFF_CARD_ID  		VARCHAR2(50),	--员工证号
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   APPLY_REASON        	VARCHAR2(1000),			--业务申请原因
   USE_POSITION        	VARCHAR2(100),			--使用位置选择:wirelessUsePosition
   USE_POSITION2        VARCHAR2(100),			--使用位置选择:wirelessUsePosition2
   IMPLEMENT_ENGINEER 	VARCHAR2(50),			--实施工程师
   IMPLEMENT_USER 	    VARCHAR2(50),			--用户
   IMPLEMENT_TIME 		DATE,					--开通时间
   ACCOUNT_NAME 		VARCHAR2(100),			--帐户名称       
   MAC_ADDRESS 			VARCHAR2(50),			--MAC地址      
   SYS_NAME 			VARCHAR2(100),			--系统名      
   EQUIPMENT_TYPE 		VARCHAR2(50),			--设备类型 ：wirelessTerminalType       
   HANDLED_CONDITION 	VARCHAR2(1500),			--开通办理情况       
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLY_TYPE       	VARCHAR2(50) not null,	--申请类型:wirelessApplyType
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0 not null,--逻辑删除标志位
   constraint PK_IIMS_WIRELESS_RESOURCE_BOOK primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_VIRTUAL_RESOURCE_BOOK(虚拟化资源台帐)                                          */
/*==============================================================*/
create table IIMS_VIRTUAL_RESOURCE_BOOK 
(
   ID                   INTEGER not null,
   USER_NAME          	VARCHAR2(50) not null,	--使用人姓名
   APPLY_USE_TIME       DATE not null,			--申请使用时间
   CONTACT_PHONE        VARCHAR2(50) not null ,	--联系电话
   PROJECT_ID			INTEGER,				--所属项目ID
   PROJECT_NAME			VARCHAR2(200),			--所属项目
   PROJECT_PRINCIPAL	VARCHAR2(200),			--项目负责人
   VIRTUAL_SERVER  		VARCHAR2(10) ,	--虚拟服务器
   MEMORY  		VARCHAR2(10) ,	--内存
   CPU  		VARCHAR2(10) ,	--CPU
   HARD_DISK  	VARCHAR2(10) ,	--硬盘
   OPSYS  		VARCHAR2(10) ,	--操作系统
   OPSYS_DESCRIPTION  		VARCHAR2(10) ,	--操作系统描述
   MIDDLEWARE  		VARCHAR2(10) ,	--中间件
   MIDDLEWARE_DESCRIPTION  		VARCHAR2(10) ,	--中间件描述
   DB  		VARCHAR2(10) ,	--数据库
   DB_DESCRIPTION  		VARCHAR2(10) ,	--数据库描述
   APPLY_TYPE       	VARCHAR2(50),	--申请类型:resourceApplyType
   APPLY_DEPT      		VARCHAR2(50) not null,	--申请部门
   APPLY_DEPT_ID      	VARCHAR2(50) not null,	--申请部门ID
   APPLYER            	VARCHAR2(200) not null,	--申请人
   APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   APPLY_TIME        	DATE not null,   		--申请时间
   SYS_NAME 			VARCHAR2(100),			--系统名
   HOST_NAME 			VARCHAR2(100),			--主机名
   IP 					VARCHAR2(20),			--IP地址   
   SOFTWARE 			VARCHAR2(200),			--安装软件     
   IMPLEMENT_USER 		VARCHAR2(100),			--办理人
   IMPLEMENT_TIME 		DATE,					--办理时间
   REMARKS              VARCHAR2(1500),			--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   constraint PK_IIMS_VIRTUAL_RESOURCE_BOOK primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_EQUIPMENT(设备)                                          */
/*==============================================================*/
create table IIMS_EQUIPMENT 
(
   ID                   INTEGER not null,
   EQUIPMENT_NUM        VARCHAR2(20) not null,	--编号
   EQUIPMENT_NAME       VARCHAR2(200) not null,	--名称
   MODEL_NUMBER       	VARCHAR2(50),			--型号
   ASSET_CATEGORY  		VARCHAR2(50),			--资产分类
   IMPORTANCE        	VARCHAR2(50),			--设备重要性
   MAIN_STATUS        	VARCHAR2(50),			--主状态
   SUB_STATUS 			VARCHAR2(50),			--子状态
   EQUIPMENT_MANAGER 	VARCHAR2(50), 			--设备管理人
   EQUIPMENT_USER  		VARCHAR2(50),			--使用人         
   BAR_CODE      		VARCHAR2(50),			--条码号
   ASSET_LEVEL      	VARCHAR2(50),			--资产等级
   ASSET_NUM       		VARCHAR2(50),			--财务资产编号
   PHYSICAL_LOCATION    VARCHAR2(200) not null,	--物理地址
   IP_ADDRESS  			VARCHAR2(20) not null,  --IP地址
   MAC_ADDRESS        	VARCHAR2(20) not null,  --Mac地址
   HOST_NAME            VARCHAR2(100),			--主机名
   SERIES_NUMBER  		VARCHAR2(100),			--序列号
   PURCHASE_TIME        DATE,					--采购时间
   USE_DESCRIPTION      VARCHAR2(1500),			--用途描述
   CPU              	VARCHAR2(200),			--CPU
   MEMORY    			VARCHAR2(200),			--内存
   HARD_DISK 			VARCHAR2(200),			--硬盘
   WARRANTY 			VARCHAR2(200),			--保修期
   DIMENSION 			VARCHAR2(200),			--尺寸
   REMARKS              VARCHAR2(1500),
   REMOVED              INTEGER default 0  not null,
   constraint PK_IIMS_EQUIPMENT primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_POWER(权限)                                          */
/*==============================================================*/
create table IIMS_POWER
(
   ID                   INTEGER not null,
   USERS        		VARCHAR2(500) not null,	--用户
   MODULES       		VARCHAR2(1000) not null,	--模块
   ALLOW_OPERATE       	VARCHAR2(50),			--允许操作(add,del,update,query,grant)
   OPERATOR  			VARCHAR2(50),			--操作人
   OPERATE_TIME        	DATE,			--操作时间
   REMOVED              INTEGER default 0  not null,
   constraint IIMS_PRIVILEGE primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_SECURITY_LEVEL_COMPANY(安全定级单位)                                          */
/*==============================================================*/
create table IIMS_SECURITY_LEVEL_COMPANY 
(
     ID                   INTEGER not null,    
   	COMPANY_ID      	VARCHAR2(10) not null,	--单位ID  	       
   	COMPANY      		VARCHAR2(50) not null,	--单位名称：securityCompany
     COMPANY_PROVINCE  VARCHAR2(50),  --单位所在省(自治区、直辖市)
     COMPANY_CITY  VARCHAR2(50),  --单位所在地(区、市、州、盟)
     COMPANY_COUNTY  VARCHAR2(50),  --单位所在县(区、市、旗)
     ZIP_CODE          VARCHAR2(50),  --邮政编码
     ADDRESS_CODE        VARCHAR2(50),  --行政区划代码
     LEADER_NAME  VARCHAR2(50),  --单位负责人姓名
     LEADER_POST  VARCHAR2(50),  --单位负责人职务
     LEADER_PHONE  VARCHAR2(50),  --单位负责人办公电话
     LEADER_EMAIL  VARCHAR2(50),  --单位负责人电子邮件
     LEADER_MOBILE  VARCHAR2(50),  --单位负责人移动电话
     SUBORDINATE_RELATION  VARCHAR2(50),  --隶属关系：subordinateRelation
     SUBORDINATE_RELATION_OTHER  VARCHAR2(100),  --隶属关系：其他
     COMPANY_TYPE  VARCHAR2(50),  --单位类型：companyType
     COMPANY_TYPE_OTHER  VARCHAR2(50),  --单位类型：其他
     BUSINESS_CATEGORY  VARCHAR2(50),  --行业类别
     BUSINESS_CATEGORY_OTHER  VARCHAR2(100),  --行业类别:其他
     TOTAL_SYS_NUM  INTEGER,  --信息系统总数
     LEVEL1_SYS_NUM  INTEGER,  --第一级信息系统数
     LEVEL2_SYS_NUM  INTEGER,  --第二级信息系统数
    LEVEL3_SYS_NUM  INTEGER,  --第三级信息系统个数
     LEVEL4_SYS_NUM  INTEGER,  --第四级信息系统个数
     LEVEL5_SYS_NUM  INTEGER,  --第五级信息系统个数
   	REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_LEVEL_COMPANY primary key (ID)
);
--alter table IIMS_SECURITY_LEVEL_COMPANY add LEVEL1_SYS_NUM INTEGER;
/*==============================================================*/
/* Table: IIMS_SECURITY_LEVEL(安全定级)                                          */
/*==============================================================*/
create table IIMS_SECURITY_LEVEL 
(
   	ID                   INTEGER not null,    
   	COMPANY_ID      	VARCHAR2(10) not null,	--单位ID  	  
   	COMPANY      		VARCHAR2(50) not null,	--单位名称：securityCompany
   	COMPANY_PROVINCE	VARCHAR2(50),	--单位所在省(自治区、直辖市)
   	COMPANY_CITY	VARCHAR2(50),	--单位所在地(区、市、州、盟)
   	COMPANY_COUNTY	VARCHAR2(50),	--单位所在县(区、市、旗)
   	ZIP_CODE      		VARCHAR2(50),	--邮政编码
   	ADDRESS_CODE      	VARCHAR2(50),	--行政区划代码
   	LEADER_NAME	VARCHAR2(50),	--单位负责人姓名
   	LEADER_POST	VARCHAR2(50),	--单位负责人职务
   	LEADER_PHONE	VARCHAR2(50),	--单位负责人办公电话
   	LEADER_EMAIL	VARCHAR2(50),	--单位负责人电子邮件
   	LEADER_MOBILE	VARCHAR2(50),	--单位负责人移动电话
   	SUBORDINATE_RELATION	VARCHAR2(50),	--隶属关系：subordinateRelation
   	SUBORDINATE_RELATION_OTHER	VARCHAR2(100),	--隶属关系：其他
   	COMPANY_TYPE	VARCHAR2(50),	--单位类型：companyType
   	COMPANY_TYPE_OTHER	VARCHAR2(50),	--单位类型：其他
   	BUSINESS_CATEGORY	VARCHAR2(50),	--行业类别：businessCategory
   	BUSINESS_CATEGORY_OTHER	VARCHAR2(100),	--行业类别:其他
   	TOTAL_SYS_NUM	INTEGER,	--信息系统总数
   	LEVEL1_SYS_NUM	INTEGER,	--第一级信息系统数
   	LEVEL2_SYS_NUM	INTEGER,	--第二级信息系统数
  	LEVEL3_SYS_NUM	INTEGER,	--第三级信息系统个数
   	LEVEL4_SYS_NUM	INTEGER,	--第四级信息系统个数
   	LEVEL5_SYS_NUM	INTEGER,	--第五级信息系统个数

   	DUTY_DEPT VARCHAR2(200),	--责任部门
   	DUTY_DEPT_LINKMAN_NAME VARCHAR2(50),	--责任部门联系人姓名	
   	DUTY_DEPT_LINKMAN_POST VARCHAR2(50),	--责任部门联系人职务	
   	DUTY_DEPT_LINKMAN_PHONE  VARCHAR2(50),	--责任部门联系人办公电话	
   	DUTY_DEPT_LINKMAN_EMAIL VARCHAR2(50),	--责任部门联系人电子邮件
   	SYSTEM_TYPE  VARCHAR2(50),	--系统类型：systemType
   	SYSTEM_TYPE_OTHER VARCHAR2(100),	--系统类型：其他
   	SYS_NET_AREA  VARCHAR2(50),	--所在网络区域：sysNetArea
   	SYS_NET_AREA_OTHER VARCHAR2(100),	--所在网络区域：其他

	SYSTEM_NAME  VARCHAR2(200),	--系统名称
	SYSTEM_NUM VARCHAR2(50),	--系统编号
	SYS_BUSINESS_TYPE  VARCHAR2(50),	--系统承载业务类型：sysBusinessType
	SYS_BUSINESS_TYPE_OTHER VARCHAR2(100),	--系统承载业务类型：其他
	SYS_BUSINESS_DESCRIPTION VARCHAR2(1000),	--系统承载业务描述
	SYS_SERVE_SCOPE  VARCHAR2(50),	--系统服务范围：sysServeScope
	SYS_SERVE_SCOPE_OTHER VARCHAR2(100),	--系统服务范围：其他
	SYS_SERVE_SCOPE_CROSS_P  INTEGER,	--系统服务范围：跨省数量
	SYS_SERVE_SCOPE_CROSS_C  INTEGER,	--系统服务范围：跨地数量
	SYS_SERVE_OBJ  VARCHAR2(50),	--系统服务对象：sysServeObj
	SYS_SERVE_OBJ_OTHER VARCHAR2(100),	--系统服务对象：其他
	SYS_NET_COVER  VARCHAR2(50),	--系统网络覆盖范围：sysNetCover
	SYS_NET_COVER_OTHER VARCHAR2(100),	--系统网络覆盖范围：其他
	SYS_NET_PROPERTY  VARCHAR2(50),	--系统网络性质：sysNetProperty
	SYS_NET_PROPERTY_OTHER VARCHAR2(100),	--系统网络性质：其他
	SYS_CONNECT  VARCHAR2(50),	--系统互联情况：sysConnect
	SYS_CONNECT_OTHER  VARCHAR2(100),	--系统互联情况：其他
	KEY_PRODUCTS  VARCHAR2(1000),	--关键产品使用情况：json格式{security:{num:x,use:all/none/part,percent:90},net,opsys,db,server,other:{name:xxxx,num:x,use:all/none/part,percent:90}}
	SYS_SERVICES VARCHAR2(1000),	--系统采用服务情况：json格式{level:{has:yes/no,responsibleParty:own/internal/foreign},risk,recovery,urgent,integration, advisory,train,other:{name:xxxx,responsibleParty:own/internal/foreign}}
	REVIEW_COMPANY VARCHAR2(200),	--等级测评单位名称
	START_USER_DATE DATE,--何时投入运行使用
	IS_OPERATION_OUTSOURCE VARCHAR2(50),--系统运维是否委外[yes：是/no：否]
	OUTSOURCE_COMPANY VARCHAR2(200),--委外单位名称
	IS_SUBSYSTEM VARCHAR2(50),--系统是否分系统[yes：是/no：否]
	MAIN_SYSTEM VARCHAR2(200),--上级系统名称
	MAIN_SYSTEM_COMPANY VARCHAR2(200),--上级系统所属单位名称

	BUSINESS_SECURITY_LEVEL VARCHAR2(50),--业务信息安全保护等级（根据损害程度自动选定）：sysSecurityLevel
	BUSINESS_SECURITY_DAMAGE VARCHAR2(100),--业务信息安全保护等级-损害程度：（复选）sysDamage
	SERVICE_SECURITY_LEVEL VARCHAR2(50),--系统服务安全保护等级（根据损害程度自动选定)：sysSecurityLevel
	SYS_SECURITY_DAMAGE VARCHAR2(100),--系统服务安全保护等级-损害程度：（复选）sysDamage
	SYS_SECURITY_LEVEL VARCHAR2(50),--信息系统安全保护等级（根据业务信息安全等级和系统服务安全等级中，级别高的确定）：sysSecurityLevel
	LEVEL_CONFIRM_DATE DATE,--定级时间
	EXPERT_REVIEW VARCHAR2(50),--专家评审情况：[yes:已评审/no:未评审]
	HAS_DEPT_INCHARGE VARCHAR2(50),--是否有主管部门：[yes:有/no:无]
	DEPT_INCHARGE VARCHAR2(200),--主管部门名称
	DEPT_INCHARGE_REVIEW VARCHAR2(50),--主管部门审批定级情况：[yes:已审批/no:未审批]
	HAS_SYS_LEVEL_FILE VARCHAR2(50),--系统定级报告：[yes:有/no:无]

	HAS_SYS_TIPOLOGY_FILE VARCHAR2(50),--系统拓扑结构及说明：[yes:有/no:无]
	HAS_SYS_SECURITY_ORGAN_FILE VARCHAR2(50),--系统安全组织结构及管理机制：[yes:有/no:无]
	HAS_SYS_PROTECT_FILE VARCHAR2(50),--系统安全保护设施设计实施方案或改建实施方案：[yes:有/no:无]
	HAS_SYS_PRODUCTS_FILE VARCHAR2(50),--系统使用的安全产品清单及认证、销售许可证明：[yes:有/no:无]
	HAS_SYS_LEVEL_REVIEW_FILE VARCHAR2(50),--系统等级测评报告：[yes:有/no:无]
	SYS_LEVEL_REVIEW_DATE DATE default sysdate,--系统等级测评时间
	HAS_EXPERT_REVIEW_FILE VARCHAR2(50),--专家评审情况：[yes:有/no:无]
	HAS_DEPT_INCHARGE_REVIEW_FILE VARCHAR2(50),--上级主管部门审批意见：[yes:有/no:无]
   	NODIFY_DEPT_LEADER 				VARCHAR2(50),	--提醒部门领导[yes：是/no：否]
   	BUSINESS_STATUS 				VARCHAR2(50),	--业务状态：businessStatus
   	APPLYER            	VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        	DATE not null,   		--申请时间
   	INITIATOR            VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME        DATE not null,			--提交人时间
   	SUGGESTION           VARCHAR2(1500),			--意见&建议
   	HANDLER              VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   	STATUS 				VARCHAR2(50),			--状态:securityLevelStatus
   	REMARKS              VARCHAR2(1500),			--备注
	ISHISTORY            INTEGER default 0 not null,			--是否是历史记录
   	REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_LEVEL primary key (ID)
);


/*==============================================================*/
/* Table: IIMS_SECURITY_CHECK(安全自查)                                          */
/*==============================================================*/
create table IIMS_SECURITY_CHECK
(
     ID                   		INTEGER not null,      
   	COMPANY_ID      	VARCHAR2(10) not null,	--单位ID 
     COMPANY          			VARCHAR2(50) not null,  --单位名称
	LEADER_NAME					VARCHAR2(50) ,--分管安全工作领导姓名
	LEADER_POST					VARCHAR2(50) ,--分管安全工作领导职务
	OFFICE_NAME 			VARCHAR2(100) ,--网络安全管理机构名称
	OFFICE_LEADER 		VARCHAR2(50) ,--网络安全管理机构负责人
	OFFICE_LEADER_POST 	VARCHAR2(50) ,--网络安全管理机构负责人职务
	OFFICE_LINKMAN 		VARCHAR2(50) ,--网络安全管理机构联系人
	OFFICE_PHONE 		VARCHAR2(50) ,--网络安全管理机构办公电话
	OFFICE_MOBILE 		VARCHAR2(50) ,--网络安全管理机构移动电话
	JOB_OFFICE_NAME 			VARCHAR2(100) ,--网络安全专职工作机构名称
	JOB_OFFICE_LEADER 			VARCHAR2(50) ,--网络安全专职工作机构负责人
	JOB_OFFICE_PHONE 			VARCHAR2(50) ,--网络安全专职工作机构办公电话
	JOB_OFFICE_MOBILE 			VARCHAR2(50) ,--网络安全专职工作机构移动电话

	INFO_SYS_SUMMARY 			VARCHAR2(200) ,--信息系统情况：json格式:{"count":"20","internet":"3","noInternet":"17","public":"15","checkPass":"11"}
	INTERNET_ACCESS 			VARCHAR2(200) ,--互联网接入情况：json格式:{"count":"20","unicom":{"num":"3","bw":"100"},"mobile":{"num":"17","bw":"120"},"other":{"name":"XXXX","num":"11","bw":"80"}}
	SYS_LEVEL 					VARCHAR2(200) ,--系统定级情况：json格式:{"lv1":"20","lv2":"11","lv3":"10","lv4":"3","no":"4"}

	STAFF_RESPONSIBILITY_SYS 	VARCHAR2(50) ,--岗位网络安全责任制度
	STAFF_SECRECY_AGREEMENT  	VARCHAR2(50) ,--重点岗位人员安全保密协议：staffSecrecyAgreement
	STAFF_LEAVE_RULE 			VARCHAR2(50) ,--人员离岗离职安全管理规定
	STAFF_VISIT_AUDIT 			VARCHAR2(50) ,--外部人员访问机房等重要区域审批制度
	ASSET_MANAGE_SYSTEM 		VARCHAR2(50) ,--资产管理制度
	ASSET_DEVICE_MAINTAIN 		VARCHAR2(50) ,--资产设备维护报废管理：assetDeviceMaintain

	NET_PROTECT_DEVICE 			VARCHAR2(200) ,--网络安全防护设备部署：netProtectDevice
	NET_PROTECT_DEVICE_OTHER 	VARCHAR2(200) ,--网络安全防护设备部署：其他
	NET_SAFESTRATEGY_CONFIG 	VARCHAR2(50) ,--设备安全策略配置：safeConfig
	NET_VISIT_LOG 				VARCHAR2(50) ,--网络访问日志：visitLog
	NET_CLOUD_DEVICE 			VARCHAR2(50) ,--云计算服务设施位置：cloudDevice
	NET_EPIBOLY_DATA_COMMIT 	VARCHAR2(50) ,--外包服务过程中数据提交：epibolyDataCommit
	NET_REMOTE_CONTROL 			VARCHAR2(50) ,--系统远程控制/维护:remoteControl
	NET_REMOTE_CONTROL_SYS 		VARCHAR2(200), --远程控制/维护系统：json格式：{"sys1":"XXXXX","sys2":"xxxxx"，"sys3":"xxxxx"}
	ROUTER_COUNT 				INTEGER,-- 无线路由器数量
	ROUTER_USE 					VARCHAR2(200), --无线路由器用途：json格式：{"visitInternet":"4","visitBusinessNet":"1"}:routerUse
	SECURITY_DEFENSE 			VARCHAR2(50), --安全防护策略：securityDefense
	ROUTER_DFAULT_ADDRESS 		VARCHAR2(50), --无线路由器使用默认管理地址情况
	ROUTER_DFAULT_PWD 			VARCHAR2(50), --无线路由器使用默认管理口令情况
	SITE_DOMAIN 				VARCHAR2(100), --网站域名
	SITE_IP 					VARCHAR2(50), --网站IP地址
	SITE_PAGE_ANTITAMPER 		VARCHAR2(50), --网页防篡改
	SITE_LEAK_SCAN 				VARCHAR2(50), --漏洞扫描：leakScan
	SITE_LEAK_SCAN_PERIOD 		VARCHAR2(50), --漏洞扫描周期
	SITE_PUBLISH 				VARCHAR2(50), --信息发布管理：sitePublish
	SITE_MAINTAIN 				VARCHAR2(50), --运维方式：siteMaintain
	EMAIL_BUILD 				VARCHAR2(50), --电子邮件建设方式：emailBuild
	EMAIL_SUPPLIER 				VARCHAR2(200), --电子邮件服务提供商
	EMAIL_ACCOUNT 				INTEGER, --电子邮件帐户数量
	EMAIL_REGISTER 				VARCHAR2(50), --电子邮件注册管理：emailRegister
	EMAIL_PWD 					VARCHAR2(50), --电子邮件口令管理：eamilPwd
	EMAIL_PROTECT 				VARCHAR2(50), --电子邮件安全防护：emailProtect
	EMAIL_PROTECT_OTHER 		VARCHAR2(100), --电子邮件安全防护：其他
	TERMINAL_MANAGE 			VARCHAR2(100), --终端计算机安全管理：terminalManage
	TERMINAL_UNIFIED_MANAGE 			VARCHAR2(100), --终端计算机集中统一管理：terminalUnifiedManage
	TERMINAL_LINK_INTERNET 		VARCHAR2(50), --终端计算机接入互联网安全控制措施：terminalLink
	TERMINAL_LINK_OA 			VARCHAR2(50), --终端计算机接入办公系统安全控制措施:terminalLink
	STORAGE_MANAGE 				VARCHAR2(50), --移动存储介质管理方式：storageManage
	STORAGE_DESTORY 			VARCHAR2(50), --移动存储介质信息销毁：storageDestory
	EMERGENCY_PLAN_JOB 			VARCHAR2(50), --应急预案：emergencyPlan
	EMERGENCY_PLAN_EDIT 		VARCHAR2(50), --应急预案,本年度修订情况：emergencyPlanEdit	
	EMERGENCY_TRAIN_JOB 		VARCHAR2(50), --应急演练：emergencyTrain
	EMERGENCY_TRAIN_TIME 		VARCHAR2(50), --应急演练时间
	EMERGENCY_DATABACK 			VARCHAR2(50), --灾难数据备份：emergencyDataback
	EMERGENCY_DATABACK_PERIOD 	VARCHAR2(50), --灾难数据备份周期：emergencyDatabackPeriod
	EMERGENCY_SYSBACK 			INTEGER, --采取实时备份措施的系统数量
	EMERGENCY_NO_SYSBACK 		INTEGER, --未采取实时备份措施的系统数量
	EMERGENCY_TECHNICAL_TEAM 	VARCHAR2(50), --应急技术队伍：emergencyTeam
	EDUCATION_TRAIN_NUM 		INTEGER, --本年度开展网络安全教育培训的次数
	EDUCATION_TRAIN_STAFF 		INTEGER, --本年度参加网络安全教育培训的人数
	EDUCATION_TRAIN_PERCENT 	VARCHAR2(10), --本年度参加网络安全教育培训的人数所占百分比

	PRODUCT_SERVER 				VARCHAR2(200), --服务器情况：json格式：{"count":"4","brand":{"internal":"2","internalCpu":"1","foreign":"2"},"sys":{"internal":"2","foreign":"2"}}
	PRODUCT_TERMINAL 			VARCHAR2(2000), --终端计算机情况：json格式：{"count":"4","brand":{"internal":"2","internalCpu":"1","foreign":"2"},"sys":{"internal":"2","foreign":"2","winXp":"1","afterWinXpStop":"xxx","afterWinXpStopOther":"YYYYY"},"internalWord":"1","internalFireWall":"11"}:afterWinXpStop
	PRODUCT_ROUTER 				VARCHAR2(200), --路由器情况：json格式：{"count":"4","brand":{"internal":"2","foreign":"2"}}
	PRODUCT_SWITCH 				VARCHAR2(200), --交换机情况：json格式：{"count":"4","brand":{"internal":"2","foreign":"2"}}
	PRODUCT_STORAGE 			VARCHAR2(200), --存储设备情况：json格式：{"count":"4","brand":{"internal":"2","foreign":"2"}}
	PRODUCT_DB 					VARCHAR2(200), --数据库管理系统情况：json格式：{"count":"4","brand":{"internal":"2","foreign":"2"}}
	PRODUCT_EMAIL 				VARCHAR2(2000), --邮件系统情况：json格式：{"count":"4","brandAndNum":[{"brand":"xxx","num":"2"},{"brand":"zzz","num":"2"}]}
	PRODUCT_LB 					VARCHAR2(2000), --负载均衡设备情况：json格式：{"count":"4","brandAndNum":[{"brand":"xxx","num":"2"},{"brand":"zzz","num":"2"}]}
	PRODUCT_FIREWALL 			VARCHAR2(2000), --防火墙设备情况：json格式：{"count":"4","brandAndNum":[{"brand":"xxx","num":"2"},{"brand":"zzz","num":"2"}]}
	PRODUCT_INVADE_CHECK 		VARCHAR2(2000), --入侵检测情况：json格式：{"count":"4","brandAndNum":[{"brand":"xxx","num":"2"},{"brand":"zzz","num":"2"}]}
	PRODUCT_SECURITY_AUDIT 		VARCHAR2(2000), --安全审计情况：json格式：{"count":"4","brandAndNum":[{"brand":"xxx","num":"2"},{"brand":"zzz","num":"2"}]}
	FUNDS_BUDGET 				VARCHAR2(20), --经费预算额
	FUNDS_USED 					VARCHAR2(20), --经费投入额
	CHECK_SEEP_TEST 			VARCHAR2(100), --渗透测试情况：json格式：{"count":"4","success":"3"}
	CHECK_BADCODE_TEST 			VARCHAR2(200), --恶意代码检测情况：json格式：{"server":{"count":"4","failure":"3"},"terminal":{"count":"4","failure":"1"}}
	CHECK_LEAK_TEST 			VARCHAR2(200), --安全漏洞检测情况：json格式：{"server":{"count":"4","failure":"3"},"terminal":{"count":"4","failure":"1"}}
	EVENT_ATTACK_NUM 			INTEGER, --网站受攻击次数
	EVENT_TAMPER_NUM 			INTEGER, --网站被篡改次数
	EPIBOLY_ORGAN				VARCHAR2(3000),--外包服务机构：json格式：[{"name":"xxx","nature":"aaa","service":"bbb","otherService":"xxxxx","protocol":"xxx","ce":"xxx","ceCenter":xxxx},....]
	ORGAN_LEADER				VARCHAR2(50),  --网络安全组织管理-主管领导
	ORGAN_MANAGE				VARCHAR2(50),  --网络安全组织管理-管理机构
	ORGAN_GUARD					VARCHAR2(50),  --网络安全组织管理-安全员
	DAILY_RULE_INTEGRITY		VARCHAR2(50),  --网络安全日常管理-制度完整性
	DAILY_RULE_PUBLISH			VARCHAR2(50),  --网络安全日常管理-制度发布
	DAILY_STAFF_KEY				VARCHAR2(50),  --网络安全日常管理-重点岗位人员
	DAILY_STAFF_LEAVE			VARCHAR2(50),  --网络安全日常管理-人员离岗离职
	DAILY_STAFF_VISIT			VARCHAR2(50),  --网络安全日常管理-外部人员访问
	DAILY_ASSET_DUTY			VARCHAR2(50),  --网络安全日常管理-资产责任落实
	DAILY_ASSET_BOOK			VARCHAR2(50),  --网络安全日常管理-资产台帐建立
	DAILY_ASSET_CONFORM			VARCHAR2(50),  --网络安全日常管理-帐物符合度
	DAILY_ASSET_MAINTAIN		VARCHAR2(50),  --网络安全日常管理-设备维护管理
	DAILY_EPIBOLY_AGGREMENT		VARCHAR2(50),  --网络安全日常管理-外包服务协议
	DAILY_EPIBOLY_SERVICE		VARCHAR2(50),  --网络安全日常管理-外包现场服务
	DAILY_EPIBOLY_DEVELOP		VARCHAR2(50),  --网络安全日常管理-外包开发管理
	DAILY_EPIBOLY_MAINTAIN		VARCHAR2(50),  --网络安全日常管理-外包运维服务
	DAILY_FUNDS_BUDGET			VARCHAR2(50),  --网络安全日常管理-经费保障预算
	DAILY_SITE_PUBLISH			VARCHAR2(50),  --网络安全日常管理-网站信息发布
	DAILY_INFO_DESTORY			VARCHAR2(50),  --网络安全日常管理-电子信息销毁
	SHIELD_PHYSICAL_ROOM		VARCHAR2(50),  --网络安全日常管理-物理机房安全
	SHIELD_PHYSICAL_VISIT		VARCHAR2(50),  --网络安全日常管理-物理访问控制
	SHIELD_NET_VISIT			VARCHAR2(50),  --网络安全日常管理-网络访问控制
	SHIELD_NET_INVADE			VARCHAR2(50),  --网络安全日常管理-网络入侵检测
	SHIELD_NET_AUDIT			VARCHAR2(50),  --网络安全日常管理-网络安全审计
	SHIELD_NET_POINT			VARCHAR2(50),  --网络安全日常管理-网络接入口数量
	SHIELD_DEVICE_BADCODE		VARCHAR2(50),  --网络安全日常管理-设备恶意代码
	SHIELD_DEVICE_LEAK			VARCHAR2(50),  --网络安全日常管理-设备漏洞扫描
	SHIELD_DEVICE_PASSWD		VARCHAR2(50),  --网络安全日常管理-设备口令策略
	SHIELD_DEVICE_AUDIT			VARCHAR2(50),  --网络安全日常管理-设备安全审计
	SHIELD_DEVICE_PATCH			VARCHAR2(50),  --网络安全日常管理-设备补丁更新
	SHIELD_DEVICE_NET_PWD		VARCHAR2(50),  --网络安全日常管理-网络安全设备口令策略
	SHIELD_DEVICE_PROTECT		VARCHAR2(50),  --网络安全日常管理-设备统一防护
	SHIELD_DEVICE_CONTROL		VARCHAR2(50),  --网络安全日常管理-设备接入控制
	SHIELD_APP_LEAK				VARCHAR2(50),  --网络安全日常管理-应用漏洞扫描
	SHIELD_APP_ANTITAMPER		VARCHAR2(50),  --网络安全日常管理-应用防篡改
	SHIELD_APP_ANTIATTACK		VARCHAR2(50),  --网络安全日常管理-应用抗拒绝服务攻击
	SHIELD_APP_EMAIL_REGISTER	VARCHAR2(50),  --网络安全日常管理-应用电子邮件注册
	SHIELD_APP_EMAIL_PASSWD		VARCHAR2(50),  --网络安全日常管理-应用电子邮件口令
	SHIELD_APP_EMAIL_CLEAR		VARCHAR2(50),  --网络安全日常管理-应用电子邮件清理
	SHIELD_DATA_STORE			VARCHAR2(50),  --网络安全日常管理-数据存储保护
	SHIELD_DATA_TRANSFER		VARCHAR2(50),  --网络安全日常管理-数据传输保护
	SHIELD_DATA_BACKUP			VARCHAR2(50),  --网络安全日常管理-数据备份保护
	SHIELD_DATA_CENTER			VARCHAR2(50),  --网络安全日常管理-数据灾备中心
	EMERGENCY_PLAN				VARCHAR2(50),  --网络安全应急管理-应急预案
	EMERGENCY_TRAIN				VARCHAR2(50),  --网络安全应急管理-应急演练
	EMERGENCY_RESOURCE			VARCHAR2(50),  --网络安全应急管理-应急资源
	EMERGENCY_EVENT_HANDLE		VARCHAR2(50),  --网络安全应急管理-事件处理
	EDUCATION_MENTALITY			VARCHAR2(50),  --网络安全教育培训-意识教育
	EDUCATION_TRAIN				VARCHAR2(50),  --网络安全教育培训-专业培训
	CHECK_WORK_DEPLOY			VARCHAR2(50),  --网络安全检查-工作部署
	CHECK_WORK_RULE				VARCHAR2(50),  --网络安全检查-工作机制
	CHECK_TECHNICAL_DETECTON	VARCHAR2(50),  --网络安全检查-技术检测
	CHECK_FUNDS					VARCHAR2(50),  --网络安全检查-检查经费

     YEAR  						VARCHAR2(4),  --年度
     COMPOSE  					VARCHAR2(1500),  --报告组成
     LUNCH_SITUATION  			VARCHAR2(1500),  --组织开展情况
     WORK_SITUATION          	VARCHAR2(1500),  --主要工作情况
     PROBLEM        			VARCHAR2(3000),  --主要问题和薄弱环节：json格式{"1":"xxxxx","2":"xxxxxx"}
     RISK  						VARCHAR2(3000),  --安全威胁与风险：json格式{"1":"xxxxx","2":"xxxxxx"}
     JUDGE  					VARCHAR2(3000),  --基本判断：json格式{"1":"xxxxx","2":"xxxxxx"}
     IMPROVE_MEASURE  			VARCHAR2(1500),  --改进措施
     OVERALL_EFFECT  			VARCHAR2(1500),  --整体效果
     SUMMARY_SUGGESTION         VARCHAR2(1500),			--总结意见&建议  

   	APPLYER            			VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  			VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        			DATE not null,   		--申请时间
   	INITIATOR            		VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  		VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME        		DATE not null,			--提交人时间
   	SUGGESTION           		VARCHAR2(1500),			--意见&建议
   	HANDLER              		VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    		VARCHAR2(200),			--处理人工号
   	STATUS 						VARCHAR2(50),			--状态:securityCheckStatus
   	REMARKS             		VARCHAR2(1500),			--备注
   	REMOVED              		INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_CHECK primary key (ID)
);


/*==============================================================*/
/* Table: IIMS_APP_VERSION(正版化)                                          */
/*==============================================================*/
create table IIMS_APP_VERSION
(
   ID                   INTEGER not null,
   DEPT        			VARCHAR2(50) not null,	--部门:appDept
   DEVICE_NUM       	VARCHAR2(50) not null,	--设备编号
   DEVICE_NAME       	VARCHAR2(100),			--设备名称
   MAC_ADDRESS  		VARCHAR2(50) not null,			--mac地址
   APP_TYPE        		VARCHAR2(50) not null,			--软件类型：appType
   APP_LEVEL        	VARCHAR2(50),			--软件级别:appLevel
   APP_NAME  			VARCHAR2(50) not null,			--软件名称:appName
   APP_VERSION        	VARCHAR2(50),			--软件版本号:appVersion
   AUTHORIZE        	VARCHAR2(50) not null,			--授权情况:authorize
   REMOVED              INTEGER default 0  not null,
   constraint IIMS_APP_VERSION primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_APP_COUNT(正版化统计)                                          */
/*==============================================================*/
create table IIMS_APP_COUNT
(
   ID                   INTEGER not null,
   DEPT        			VARCHAR2(50) not null,	--部门:appDept
   DEVICE_NUM       	VARCHAR2(50) not null,	--设备编号
   DEVICE_NAME       	VARCHAR2(100),			--设备名称
   AUTHORIZE_OPSYS		INTEGER,--正版化操作系统数
   OPSYS        		INTEGER,--操作系统数
   AUTHORIZE_OA		INTEGER,--正版化办公软件数
   OA        		INTEGER,--办公软件数
   AUTHORIZE_APP		INTEGER,--正版化应用软件数
   APP        		INTEGER,--应用软件数
   REMOVED              INTEGER default 0  not null,
   constraint IIMS_APP_COUNT primary key (ID)
);


/*==============================================================*/
/* Table: IIMS_MANAGER(管理人员)                                          */
/*==============================================================*/
create table IIMS_MANAGER
(
   ID                   INTEGER not null,
   BUSINESS_TYPE        VARCHAR2(50),--业务模块   
   COMPANY_ID      		VARCHAR2(10) not null,	--单位ID  
   COMPANY        		VARCHAR2(50) not null,	--组织/单位:securityCompany
   ROLE       			VARCHAR2(100),	--信息安全角色：managerRole
   USER_NAME       		VARCHAR2(200),	--姓名
   LOGIN_NAME           VARCHAR2(200),--工号
   DEPT					VARCHAR2(100),--部门
   POST        			VARCHAR2(100),--职务
   OFFICE				VARCHAR2(20),--办公电话
   MOBILE        		VARCHAR2(20),--移动电话
   FIX					VARCHAR2(20),--传真
   EMAIL        		VARCHAR2(50),--电子邮件
   REMOVED              INTEGER default 0  not null,
   constraint IIMS_MANAGER primary key (ID)
);

--alter table IIMS_MANAGER add BUSINESS_TYPE VARCHAR2(50);--业务模块
--alter table IIMS_MANAGER add LOGIN_NAME VARCHAR2(200);--工号

/*==============================================================*/
/* Table: IIMS_TARGET(管理指标)                                          */
/*==============================================================*/
create table IIMS_TARGET 
(	ID       NUMBER not null, 
	TYPE     VARCHAR2(30) not null, 
	KEY      VARCHAR2(50) not null, 
	VALUE    NUMBER not null, 
	TIME     VARCHAR2(20),
	REMOVED  INTEGER default 0  not null,
	constraint IIMS_TARGET primary key (ID)
);
comment on column IIMS_TARGET.ID is '编号';
 
comment on column IIMS_TARGET.TYPE is '管理指标类型';
 
comment on column IIMS_TARGET.KEY is '管理指标类型中的指标项';
 
comment on column IIMS_TARGET.VALUE is '管理指标类型中的指标项的值';
 
comment on column IIMS_TARGET.TIME is '管理指标-资源申请及办理情况、运维情况中的指标项，目前值为年度（year）、当月(curMonth)';


/*==============================================================*/
/* Table: IIMS_SECURITY_PLAN(目标计划)                                          */
/*==============================================================*/
create table IIMS_SECURITY_PLAN 
(
   	ID                   INTEGER not null,      
   	COMPANY      		VARCHAR2(50) not null,	--单位名称：securityCompany
   	PLAN_YEAR      		VARCHAR2(4) not null,	--计划年度
   	
   	NODIFY_DEPT_LEADER 				VARCHAR2(50),	--提醒部门领导[yes：是/no：否]
   	BUSINESS_STATUS 				VARCHAR2(50),	--业务状态：planBusinessStatus
   	APPLYER            	VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        	DATE not null,   		--申请时间
   	INITIATOR            VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME        DATE not null,			--提交人时间
   	SUGGESTION           VARCHAR2(1500),			--意见&建议
   	HANDLER              VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   	STATUS 				VARCHAR2(50),			--状态:securityPlanStatus
	ISHISTORY            INTEGER default 0 not null,			--是否是历史记录
   	REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_PLAN primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_SECURITY_PLAN_DETAIL(目标计划详细)                                          */
/*==============================================================*/
create table IIMS_SECURITY_PLAN_DETAIL 
(
   	ID                   INTEGER not null,      
   	PLAN_ID      			INTEGER not null,	--目标计划ID
   	PLAN_TYPE      		VARCHAR2(50) not null,	--计划类型：planType   	
   	BUSINESS_LEVEL 				VARCHAR2(50),	--业务层级：planBusinessLevel
	PROJECT_NUM 				VARCHAR2(20),	--项目编号
   	PROJECT_NAME 				VARCHAR2(200),	--项目名称
   	SYSTEM_NAME            	VARCHAR2(200) ,	--系统名称
   	SYSTEM_LEVEL  	VARCHAR2(50) ,	--系统等级 
   	MAIN_CONTENT        	VARCHAR2(500) ,   		--主要内容
   	IMPLEMENT            VARCHAR2(50),	--实施方:planImplement
   	PLAN_START_TIME  DATE,	--计划开始时间
   	PLAN_END_TIME        DATE,			--计划结束时间
   	COST           VARCHAR2(20),			--费用
   	TARGET_PLAN              VARCHAR2(500),			--目标计划
   	COMPLETE_TIME        DATE,			--实际完成时间
	FINISHED             INTEGER default 0  not null,--完成状态标志位
   	REMARKS              VARCHAR2(500),			--备注
   	REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_PLAN_DETAIL primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_SECURITY_EVENT(信息安全事件)                                          */
/*==============================================================*/
create table IIMS_SECURITY_EVENT 
(
   	ID                  INTEGER not null,   
   	COMPANY_ID      	VARCHAR2(10) not null,	--单位ID   	   
   	COMPANY      		VARCHAR2(50) not null,	--单位名称
   	REPORT_TIME      	DATE,	--报告时间   	
   	CONTACT_WAY 		VARCHAR2(50),	--联系方式
   	REPORTER 			VARCHAR2(50),	--实践报告人

   	OCCUR_TIME  		DATE,	--事件发生时间
   	INFO_SOURCE       VARCHAR2(200),   		--信息来源
   	EVENT_CATE        	VARCHAR2(50),   		--业务分类：securityEventCate
   	EVENT_TYPE        	VARCHAR2(50),   		--事件类型：securityEventType
   	EVENT_LEVEL        	VARCHAR2(50),   		--事件等级：securityEventLevel
   	EVENT_DESCRIPTION   VARCHAR2(500),   --事件描述
   	RELATE_NET_SYS        		VARCHAR2(100),   		--涉及网络或系统
   	HANDLE_RESULT       VARCHAR2(200) ,	--处理结果
   	HANDLE_PROCESS      VARCHAR2(1000) ,	--处理过程
   	REASON_ANALYZE      VARCHAR2(1000) ,	--事件原因分析
   	REMARK            	VARCHAR2(500) ,	--备注

   	APPLYER            	VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  	VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        	DATE not null,   		--申请时间
   	INITIATOR            VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME        DATE not null,			--提交人时间
   	SUGGESTION           VARCHAR2(1500),			--意见&建议
   	HANDLER              VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    VARCHAR2(200),			--处理人工号
   	STATUS 				VARCHAR2(50),			--状态:securityEventStatus
   	REMOVED              INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_EVENT primary key (ID)
);


/*==============================================================*/
/* Table: IIMS_SECURITY_ISSUE(信息安全问题)                                          */
/*==============================================================*/
create table IIMS_SECURITY_ISSUE 
(
   	ID                  	INTEGER not null,   
   	COMPANY_ID      		VARCHAR2(10) not null,	--单位ID   	   
   	COMPANY      			VARCHAR2(50) not null,	--单位名称
   	FIND_TIME      			DATE,	--发现时间   	
   	RELATE_SYS 				VARCHAR2(50),	--关联系统

   	ISSUE_SOURCE       		VARCHAR2(200),   		--问题来源
   	ISSUE_DESCRIPTION   	VARCHAR2(500),   --问题描述

   	ISSUE_CATE        		VARCHAR2(50),   		--业务类别：securityIssueCate
   	ISSUE_SUBJECT        	VARCHAR2(50),   	--科目：securityIssueSubject
   	ISSUE_ITEM        		VARCHAR2(50),   	--科目子类：securityIssueItem

   	RECTIFY_PLAN       		VARCHAR2(2000) ,	--整改方案
   	ACTUAL_SITUATION      	VARCHAR2(1000) ,	--实际情况
   	START_TIME      		DATE ,	--计划开始时间
	FINISH_TIME      		DATE ,	--计划完成时间
	RECTIFY_REMARK   		VARCHAR2(500) ,	--整改信息备注

   	CHECK_SITUATION   		VARCHAR2(1000) ,	--复核情况
   	TRACE_DATE  			DATE,	--跟踪日期
	TRACE_REMARK  			VARCHAR2(500) ,	--跟踪信息备注

   	APPLYER            		VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        		DATE not null,   		--申请时间
   	INITIATOR           	VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  	VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME       	DATE not null,			--提交人时间
   	SUGGESTION           	VARCHAR2(1500),			--意见&建议
   	HANDLER             	VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    	VARCHAR2(200),			--处理人工号
   	STATUS 					VARCHAR2(50),			--状态:securityIssueStatus
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_ISSUE primary key (ID)
);



/*==============================================================*/
/* Table: IIMS_SECURITY_RISK(信息安全风险)                                          */
/*==============================================================*/
create table IIMS_SECURITY_RISK 
(
   	ID                  	INTEGER not null,   
   	COMPANY_ID      		VARCHAR2(10) not null,	--单位ID   	   
   	COMPANY      			VARCHAR2(50) not null,	--单位名称
   	FIND_TIME      			DATE,	--发现时间   	
   	RELATE_SYS 				VARCHAR2(50),	--关联系统

   	RISK_TYPE        		VARCHAR2(50),   		--风险类别：securityRiskType
   	RISK_LEVEL        		VARCHAR2(50),   		--风险等级：securityRiskLevel
   	RISK_DESCRIPTION   		VARCHAR2(500),   --风险描述
   	RISK_SOURCE       		VARCHAR2(200),   		--风险来源

   	HANDLE_PLAN       		VARCHAR2(2000) ,	--风险处置方案
   	TRACE_CASE      		VARCHAR2(1000) ,	--处置跟踪情况
   	TRACE_DATE      		DATE ,	--跟踪日期
   	HANDLE_TIME_LIMIT   	VARCHAR2(50) ,	--风险处置时限
   	CONFIRM_DATE  			DATE,	--风险确认时间

   	APPLYER            		VARCHAR2(200) not null,	--申请人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--申请人工号   
   	APPLY_TIME        		DATE not null,   		--申请时间
   	INITIATOR           	VARCHAR2(200) not null,	--提交人
   	INITIATOR_LOGINNAME  	VARCHAR2(200) not null,	--提交人工号
   	INITIATE_TIME       	DATE not null,			--提交人时间
   	SUGGESTION           	VARCHAR2(1500),			--意见&建议
   	HANDLER             	VARCHAR2(200),			--处理人
   	HANDLER_LOGINNAME    	VARCHAR2(200),			--处理人工号
   	STATUS 					VARCHAR2(50),			--状态:securityRiskStatus
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SECURITY_RISK primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_ANNUAL_COST(年度成本)                                          */
/*==============================================================*/
create table IIMS_ANNUAL_COST 
(
   	ID                  	INTEGER not null,   
   	TYPE      				VARCHAR2(50) not null,	--类别：annualCostType:维保公司/集团本部   	   
   	YEAR      				VARCHAR2(4) not null,	--年度
   	TOTAL_BUDGET      		NUMBER(12,2),	--总计预算金额   	
   	TOTAL_SIGNED 			NUMBER(12,2),	--总计已签订合同金额   	
   	TOTAL_PAIED    		NUMBER(12,2),	--总计已支付合同金额   	
   	SIGNED_PERCENT 			NUMBER(5,2),	--投资完成率   	
   	PAIED_PERCENT 			NUMBER(5,2),	--资金支付率  	
   	TOTAL_UNSIGNED 			NUMBER(12,2),	--总计未签订合同金额   	
   	TOTAL_UNPAIED 			NUMBER(12,2),	--总计未支付合同金额   	
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_ANNUAL_COST primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_PROJECT_COST(项目成本)                                          */
/*==============================================================*/
create table IIMS_PROJECT_COST 
(
   	ID                  	INTEGER not null,   
   	ANNUAL_ID      			INTEGER not null,	--年度成本ID
   	PROJECT_CODE      		VARCHAR2(50) ,	--编号
   	PROJECT_NAME      		VARCHAR2(200) not null,	--项目名称
   	BUDGET 			NUMBER(12,2),	--预算金额   	
   	REPORT_BUDGET    		NUMBER(12,2),	--上报预算金额   	
   	APPLYER            		VARCHAR2(200) not null,	--填报人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--填报人工号   
   	APPLY_TIME        		DATE not null,   		--填报时间
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_PROJECT_COST primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_CONTRACT_COST(合同成本)                                          */
/*==============================================================*/
create table IIMS_CONTRACT_COST 
(
   	ID                  	INTEGER not null,   
   	PROJECT_ID      			INTEGER not null,	--项目成本ID   
   	PLAN_SIGN_TIME      	DATE,	--计划签订时间
   	AMOUNT      		NUMBER(12,2),	--合同金额   	
   	PAIED    		NUMBER(12,2),	--已支付   	
   	UNPAIED 			NUMBER(12,2),	--未支付	
   	PERCENT 			NUMBER(5,2),	--支付率	
   	PLAN_ADVANCE_PAY 			NUMBER(12,2),	--计划预付款  	
	ACTUAL_ADVANCE_PAY 			NUMBER(12,2),	--实际预付款     
   	PLAN_PROGRESS_PAY 			NUMBER(12,2),	--计划进度款  	
	ACTUAL_PROGRESS_PAY 			NUMBER(12,2),	--实际进度款     	
   	PLAN_ACCEPTANCE_PAY 			NUMBER(12,2),	--计划验收款  	
	ACTUAL_ACCEPTANCE_PAY 			NUMBER(12,2),	--实际验收款     
   	PLAN_WARRANTY_PAY 			NUMBER(12,2),	--计划质保款  	
	ACTUAL_WARRANTY_PAY 			NUMBER(12,2),	--实际质保款     
   	IMPLEMENTATION 			VARCHAR2(500),	--执行情况说明   	
   	APPLYER            		VARCHAR2(200) not null,	--填报人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--填报人工号   
   	APPLY_TIME        		DATE not null,   		--填报时间
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_CONTRACT_COST primary key (ID)
);

alter table IIMS_CONTRACT_COST add CONTRACT_NAME VARCHAR2(200) not null;--合同名称
/*==============================================================*/
/* Table: IIMS_SPECIAL(年度专项)                                          */
/*==============================================================*/
create table IIMS_SPECIAL 
(
   	ID                  	INTEGER not null,   
   	YEAR      				VARCHAR2(4) not null,	--年度
   	PLAN_REPORT_BUDGET      		NUMBER(12,2),	--当年计划上报项目预算	
   	REPLIED_BUDGET 			NUMBER(12,2),	--当年已批复项目预算   	
   	UNREPLIED_BUDGET 			NUMBER(12,2),	--当年未批复项目预算   
   	REPLIED_PERCENT 			NUMBER(5,2),	--批复率   	
   	LAST_YEAR_BUDGET 			NUMBER(12,2),	--去年项目资金预算  	
   	THIS_YEAR_BUDGET 			NUMBER(12,2),	--当年项目资金预算  	
   	PLAN_SIGN_AMOUNT 			NUMBER(12,2),	--当年计划签订合同金额  	
   	SIGNED_AMOUNT 			NUMBER(12,2),	--当年已签订合同金额  	
   	UNSIGNED_AMOUNT 			NUMBER(12,2),	--当年未签订合同金额   	
	SIGNED_PERCENT		NUMBER(5,2),	--签订率   
   	PLAN_PAIED_AMOUNT 			NUMBER(12,2),	--应支付合同金额  	
   	PAIED_AMOUNT 			NUMBER(12,2),	--已支付合同金额  	
   	UNPAIED_AMOUNT 			NUMBER(12,2),	--未支付合同金额   	
	PAIED_PERCENT		NUMBER(5,2),	--支付率   	
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SPECIAL primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_SPECIAL_BUDGET(年度专项预算)                                          */
/*==============================================================*/
create table IIMS_SPECIAL_BUDGET 
(
   	ID                  	INTEGER not null,   
   	SPECIAL_ID      		INTEGER not null,  	--年度专项ID
   	YEAR      				VARCHAR2(4) not null,	--年度
   	BUDGET      		NUMBER(12,2),	--项目年度预算	   	
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SPECIAL_BUDGET primary key (ID)
);
/*==============================================================*/
/* Table: IIMS_SPECIAL_PROJECT(年度专项项目)                                          */
/*==============================================================*/
create table IIMS_SPECIAL_PROJECT 
(
   	ID                  	INTEGER not null,   
   	BUDGET_ID      			INTEGER not null,  	--年度专项预算ID
	PROJECT_NAME			VARCHAR2(200) ,--项目名称
	REPLIED_BUDGET			NUMBER(12,2),	--项目批复预算   
	REPLIED_TYPE			VARCHAR2(50),	--预算批复状态:replyType
	PROJECT_AMOUNT			NUMBER(12,2),	--项目金额
   	APPLYER            		VARCHAR2(200) not null,	--填报人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--填报人工号   
   	APPLY_TIME        		DATE not null,   		--填报时间
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SPECIAL_PROJECT primary key (ID)
);

/*==============================================================*/
/* Table: IIMS_SPECIAL_PROJECT(年度专项合同)                                          */
/*==============================================================*/
create table IIMS_SPECIAL_CONTRACT 
(
   	ID                  	INTEGER not null,   
   	BUDGET_ID      			INTEGER not null,  	--年度专项预算ID
	CONTRACT_NAME			VARCHAR2(200) ,--合同名称
	PLAN_SIGN_TIME      	DATE,	--计划签订时间
	SIGN_YEAR      			VARCHAR2(4),	--合同签订年度
	SIGN_TYPE      			VARCHAR2(50),	--合同签订状态:signType
   	SIGN_AMOUNT      		NUMBER(12,2),	--合同签订金额   	
	START_YEAR      		VARCHAR2(4),	--执行起始年度
	END_YEAR      			VARCHAR2(4),	--执行终止年度
	PLAN_PAY    			NUMBER(12,2),	--本年计划支付   
   	PAIED    				NUMBER(12,2),	--本年已支付   
   	PERCENT 				NUMBER(5,2),	--支付完成率		
   	UNPAIED 				NUMBER(12,2),	--本年未支付	
   	TOTAL_PAIED 			NUMBER(12,2),	--累计支付	
   	PLAN_ADVANCE_PAY 		NUMBER(12,2),	--计划预付款  	
	ACTUAL_ADVANCE_PAY 		NUMBER(12,2),	--实际预付款     
   	PLAN_PROGRESS_PAY 		NUMBER(12,2),	--计划进度款  	
	ACTUAL_PROGRESS_PAY 	NUMBER(12,2),	--实际进度款     	
   	PLAN_ACCEPTANCE_PAY 	NUMBER(12,2),	--计划验收款  	
	ACTUAL_ACCEPTANCE_PAY 	NUMBER(12,2),	--实际验收款     
   	PLAN_WARRANTY_PAY 		NUMBER(12,2),	--计划质保款  	
	ACTUAL_WARRANTY_PAY 	NUMBER(12,2),	--实际质保款     
   	IMPLEMENTATION 			VARCHAR2(500),	--执行情况说明   	
   	APPLYER            		VARCHAR2(200) not null,	--填报人
   	APPLYER_LOGINNAME  		VARCHAR2(200) not null,	--填报人工号   
   	APPLY_TIME        		DATE not null,   		--填报时间
   	REMOVED             	INTEGER default 0  not null,--逻辑删除标志位
   	constraint PK_IIMS_SPECIAL_CONTRACT primary key (ID)
);
