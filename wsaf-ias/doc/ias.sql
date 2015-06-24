/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2015-1-6 14:54:40                           */
/*==============================================================*/
drop sequence SEQ_IAS_STAFF;

drop sequence SEQ_IAS_WORKFLOW;

drop sequence SEQ_IAS_ATTENDANCE;

drop table IAS_STAFF cascade constraints;

drop table IAS_WORKFLOW cascade constraints;

drop table IAS_ATTENDANCE cascade constraints;


/*==============================================================*/
/* SEQUENCE OF IAS                                                 */
/*==============================================================*/

create sequence SEQ_IAS_STAFF
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_IAS_WORKFLOW
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_IAS_ATTENDANCE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

/*==============================================================*/
/* Table: IAS_STAFF(考勤人员)                                          */
/*==============================================================*/
create table IAS_STAFF 
(
   ID                   INTEGER not null, 
   STAFF_NAME          	VARCHAR2(50) not null,	--人员姓名
   STAFF_CODE          	VARCHAR2(50) not null,	--人员编码
   LOGIN_NAME          	VARCHAR2(50) ,	--人员工号
   ID_CARD          	VARCHAR2(50) ,	--身份证号
   GENDER          		VARCHAR2(50) ,	--性别,ccate=iasGender
   STAFF_TYPE          	VARCHAR2(50),	--员工性质,ccate=iasStaffType
   UNIT          		VARCHAR2(100),	--所属单位
   UNIT_CODE          	VARCHAR2(20),	--所属单位编码
   DEPT          		VARCHAR2(100),	--所属部门
   DEPT_CODE          	VARCHAR2(20),	--所属部门编码
   IN_TIME          	DATE,					--调入时间
   OUT_TIME       		DATE,					--调出时间
   MANUAL_ENTRY         VARCHAR2(50),	--是否人工录入,ccate=yesOrNo
   REMARK        		VARCHAR2(500) ,	--备注
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_IAS_STAFF primary key (ID)
);

comment on table IAS_STAFF is'考勤人员';
comment on column IAS_STAFF.ID is '主键ID,取seq_ias_staff';
comment on column IAS_STAFF.STAFF_NAME is '人员姓名';
comment on column IAS_STAFF.STAFF_CODE is '人员编码';
comment on column IAS_STAFF.LOGIN_NAME is '人员工号';
comment on column IAS_STAFF.ID_CARD is '身份证号';
comment on column IAS_STAFF.GENDER is '性别,ccate=iasGender';
comment on column IAS_STAFF.STAFF_TYPE is '员工性质,ccate=iasStaffType';
comment on column IAS_STAFF.UNIT is '所属单位';
comment on column IAS_STAFF.UNIT_CODE is '所属单位编码';
comment on column IAS_STAFF.DEPT is '所属部门';
comment on column IAS_STAFF.DEPT_CODE is '所属部门编码';
comment on column IAS_STAFF.IN_TIME is '调入时间';
comment on column IAS_STAFF.OUT_TIME is '调出时间';
comment on column IAS_STAFF.MANUAL_ENTRY is '是否人工录入,ccate=yesOrNo';
comment on column IAS_STAFF.REMARK is '备注';
comment on column IAS_STAFF.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';

/*==============================================================*/
/* Table: IAS_WORKFLOW（流转情况）                                          */
/*==============================================================*/
create table IAS_WORKFLOW 
(
   ID                   INTEGER not null,
   IAS_NAME       		VARCHAR2(100) not null,	--考勤名称   
   IAS_DEPT       		VARCHAR2(100) not null,	--考勤部门
   IAS_MONTH       		VARCHAR2(7) not null,	--考勤月份，格式：yyyy-MM
   INITIATOR       		VARCHAR2(20) not null,	--提交人   
   INITIATOR_LOGINNAME  VARCHAR2(20) not null,	--提交人工号
   INITIATE_TIME        DATE not null,			--提交时间
   HANDLER         		VARCHAR2(20) not null,	--处理人
   HANDLER_LOGINNAME    VARCHAR2(20) not null,	--处理人工号
   HANDLE_TIME     		DATE,					--处理时间
   STATUS        		VARCHAR2(50) not null,	--流转状态,ccate=iasStatus(草稿/已提交，待审批/已退回/已上报)
   TODO_ITEM_ID         VARCHAR2(50),			--待办事项ID（取自待办事项接口返回值）
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_IAS_WORKFLOW primary key (ID)
);

comment on table IAS_WORKFLOW is'流转情况';
comment on column IAS_WORKFLOW.ID is '主键ID,取seq_ias_workflow';
comment on column IAS_WORKFLOW.IAS_NAME is '考勤名称';
comment on column IAS_WORKFLOW.IAS_DEPT is '考勤部门';
comment on column IAS_WORKFLOW.IAS_MONTH is '考勤月份，格式：yyyy-MM';
comment on column IAS_WORKFLOW.INITIATOR is '提交人';
comment on column IAS_WORKFLOW.INITIATOR_LOGINNAME is '提交人工号';
comment on column IAS_WORKFLOW.INITIATE_TIME is '提交时间';
comment on column IAS_WORKFLOW.HANDLER is '处理人';
comment on column IAS_WORKFLOW.HANDLER_LOGINNAME is '处理人工号';
comment on column IAS_WORKFLOW.HANDLE_TIME is '处理时间';
comment on column IAS_WORKFLOW.STATUS is '流转状态,ccate=iasStatus(草稿，已提交，待审批，已退回，已上报)';
comment on column IAS_WORKFLOW.TODO_ITEM_ID is '待办事项ID（取自待办事项接口返回值）';
comment on column IAS_WORKFLOW.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';

/*==============================================================*/
/* Table: IAS_ATTENDANCE(考勤记录)                                          */
/*==============================================================*/
create table IAS_ATTENDANCE 
(
   ID                   INTEGER not null,
   WORKFLOW_ID       	INTEGER,		--流转情况ID  
   STAFF_ID       		INTEGER not null,		--考勤人员ID   
   STAFF_NAME          	VARCHAR2(50),	--人员姓名
   STAFF_CODE          	VARCHAR2(50),	--人员编码
   REC  				VARCHAR2(2000),	--考勤记录，json格式：{"26":"A","27":"B",.....},ccate=iasAttendanceType
   REMARK       		VARCHAR2(200),	--备注
   REMOVED             	INTEGER default 0 not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_IAS_ATTENDANCE primary key (ID)
);
comment on table IAS_ATTENDANCE is'考勤记录';
comment on column IAS_ATTENDANCE.ID is '主键ID,取seq_ias_attendance';
comment on column IAS_ATTENDANCE.WORKFLOW_ID is '流转情况ID';
comment on column IAS_ATTENDANCE.STAFF_ID is '考勤人员ID';
comment on column IAS_ATTENDANCE.STAFF_NAME is '考勤人员姓名';
comment on column IAS_ATTENDANCE.STAFF_CODE is '考勤人员编码';
comment on column IAS_ATTENDANCE.REC is '考勤记录，json格式：{"26":"xx","27":"yy"},ccate=iasAttendanceType';
comment on column IAS_ATTENDANCE.REMARK is '备注';
comment on column IAS_ATTENDANCE.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';
