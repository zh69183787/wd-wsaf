/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2015-1-6 14:54:40                           */
/*==============================================================*/
drop sequence SEQ_CPQ_MAIN;

drop sequence SEQ_CPQ_WORKFLOW;

drop sequence SEQ_CPQ_QUESTION;

drop sequence SEQ_CPQ_ANSWER;

drop sequence SEQ_CPQ_PARTY_LIFE;

drop sequence SEQ_CPT_COMPLAINT;

drop sequence  SEQ_ACT__THEME ;

drop sequence  SEQ_ACT_SUGGESTION ;


drop table CPQ_MAIN cascade constraints;

drop table CPQ_WORKFLOW cascade constraints;

drop table CPQ_QUESTION cascade constraints;

drop table CPQ_ANSWER cascade constraints;

drop table CPQ_PARTY_LIFE cascade constraints;

drop table CPT_COMPLAINT cascade constraints;

drop table ACT__THEME cascade constraints;

drop table ACT_SUGGESTION cascade constraints;


/*==============================================================*/
/* SEQUENCE OF CPQ                                                 */
/*==============================================================*/

create sequence SEQ_CPQ_MAIN
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;


create sequence SEQ_CPQ_WORKFLOW
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_CPQ_QUESTION
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_CPQ_ANSWER
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

create sequence SEQ_CPQ_PARTY_LIFE
increment by 1
start with 1
 maxvalue 9999999999999999999999999999
 minvalue 1
nocycle
 cache 20
order;

/*==============================================================*/
/* SEQUENCE OF CPT(监督投诉)                                                */
/*==============================================================*/
create sequence SEQ_CPT_COMPLAINT
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

/*==============================================================*/
/* SEQUENCE OF ACT(意见征集)                                                */
/*==============================================================*/
create sequence SEQ_ACT_THEME
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;

create sequence SEQ_ACT_SUGGESTION
increment by 1
start with 1
maxvalue 9999999999999999999999999999
minvalue 1
nocycle
cache 20
order;




/*==============================================================*/
/* Table: CPQ_MAIN(测评问卷)                                          */
/*==============================================================*/
create table CPQ_MAIN 
(
   ID                   INTEGER not null,
   CPQ_NAME          	VARCHAR2(200) not null,	--测评名称
   START_TIME          	DATE,					--有效开始时间
   END_TIME       		DATE,					--有效结束时间
   BE_TEST_DEPT         VARCHAR2(1000) not null,	--被测评部门(多选),ccate=beTestDept
   BE_TEST_DEPT_CN   	VARCHAR2(4000),  
   TEST_DEPT            VARCHAR2(1000) not null,	--参与测评部门(多选),ccate=testDept
   TEST_DEPT_CN      	VARCHAR2(4000),  
   TEST_DEPT_COUNT      VARCHAR2(2000) not null,
   OPENED         		VARCHAR2(50),			--是否开放,ccate=opened
   DESCRIPTION         	VARCHAR2(4000),			--背景描述
   CREATOR       		VARCHAR2(20) not null,	--制定人
   CREATOR_LOGINNAME  	VARCHAR2(20) not null,	--制定人工号
   CREATE_TIME        	DATE not null,			--制定时间	
   STATUS        		VARCHAR2(50)  not null,	--状态,ccate=cpqStatus(草稿,测评中,完成)	
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_CPQ_MAIN primary key (ID)
);

comment on table CPQ_MAIN is'测评问卷';
comment on column CPQ_MAIN.ID is '主键ID,取seq_cpq_main';
comment on column CPQ_MAIN.CPQ_NAME is '测评名称';
comment on column CPQ_MAIN.START_TIME is '有效开始时间';
comment on column CPQ_MAIN.END_TIME is '有效结束时间';
comment on column CPQ_MAIN.BE_TEST_DEPT is '被测评部门(多选),ccate=beTestDept';
comment on column CPQ_MAIN.TEST_DEPT is '参与测评部门(多选),ccate=testDept';
comment on column CPQ_MAIN.OPENED is '是否开放,ccate=opened';
comment on column CPQ_MAIN.DESCRIPTION is '背景描述';
comment on column CPQ_MAIN.CREATOR is '制定人';
comment on column CPQ_MAIN.CREATOR_LOGINNAME is '制定人工号';
comment on column CPQ_MAIN.CREATE_TIME is '制定时间';
comment on column CPQ_MAIN.STATUS is '状态,ccate=cpqStatus(草稿,测评中,完成)';
comment on column CPQ_MAIN.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';

/*==============================================================*/
/* Table: CPQ_WORKFLOW（流转情况）                                          */
/*==============================================================*/
create table CPQ_WORKFLOW 
(
   ID                   INTEGER not null,
   CPQ_ID          		INTEGER not null,		--测评问卷ID
   TEST_DEPT          	VARCHAR2(50) not null,	--参与测评部门
   INITIATOR       		VARCHAR2(20) not null,	--发起人
   INITIATOR_LOGINNAME  VARCHAR2(20) not null,	--发起人工号
   INITIATE_TIME        DATE not null,			--发起时间
   HANDLER         		VARCHAR2(20) not null,	--处理人
   HANDLER_LOGINNAME    VARCHAR2(20) not null,	--处理人工号
   HANDLE_TIME     		DATE,					--处理时间
   STATUS        		VARCHAR2(50) not null,	--流转状态,ccate=cpqWorkflowStatus(网上测评名额分派，网上测评填报)
   TODO_ITEM_ID         VARCHAR2(50),			--待办事项ID（取自待办事项接口返回值）
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_CPQ_WORKFLOW primary key (ID)
);

comment on table CPQ_WORKFLOW is'流转情况';
comment on column CPQ_WORKFLOW.ID is '主键ID,取seq_cpq_workflow';
comment on column CPQ_WORKFLOW.CPQ_ID is '测评问卷ID';
comment on column CPQ_WORKFLOW.TEST_DEPT is '参与测评部门';
comment on column CPQ_WORKFLOW.INITIATOR is '发起人';
comment on column CPQ_WORKFLOW.INITIATOR_LOGINNAME is '发起人工号';
comment on column CPQ_WORKFLOW.INITIATE_TIME is '发起时间';
comment on column CPQ_WORKFLOW.HANDLER is '处理人';
comment on column CPQ_WORKFLOW.HANDLER_LOGINNAME is '处理人工号';
comment on column CPQ_WORKFLOW.HANDLE_TIME is '处理时间';
comment on column CPQ_WORKFLOW.STATUS is '流转状态,ccate=cpqWorkflowStatus(网上测评名额分派，网上测评填报)';
comment on column CPQ_WORKFLOW.TODO_ITEM_ID is '待办事项ID（取自待办事项接口返回值）';
comment on column CPQ_WORKFLOW.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';
/*==============================================================*/
/* Table: CPQ_QUESTION（测评问题）                                          */
/*==============================================================*/
create table CPQ_QUESTION 
(
   ID                   INTEGER not null,
   CPQ_ID          		INTEGER not null,		--测评问卷ID
   ITEM_TYPE         	VARCHAR2(50) not null,	--类别
   ITEM          		VARCHAR2(100) not null,	--考评项目
   STANDARD       		VARCHAR2(500) not null,	--考评标准   
   ORDERS				INTEGER not null,		--排序	
   REMOVED              INTEGER default 0  not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_CPQ_QUESTION primary key (ID)
);

comment on table CPQ_QUESTION is'测评问题';
comment on column CPQ_QUESTION.ID is '主键ID,取seq_cpq_question';
comment on column CPQ_QUESTION.CPQ_ID is '测评问卷ID';
comment on column CPQ_QUESTION.ITEM_TYPE is '类别';
comment on column CPQ_QUESTION.ITEM is '考评项目';
comment on column CPQ_QUESTION.STANDARD is '考评标准';
comment on column CPQ_QUESTION.ORDERS is '排序';
comment on column CPQ_QUESTION.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';
/*==============================================================*/
/* Table: CPQ_ANSWER(测评结果)                                          */
/*==============================================================*/
create table CPQ_ANSWER 
(
   ID                   INTEGER not null,
   CPQ_ID       		INTEGER not null,		--测评问卷ID   
   ANSWER  				VARCHAR2(2000) not null,	--答案，json格式：{"questionID1":{"deptID1":"10","deptID2":"8",.....},"questionID2":{"deptID1":"3","deptID2":"6",.....},...}
   USER_LOGINNAME       VARCHAR2(20) not null,	--答题人工号
   ANSWER_TIME        	DATE not null ,			--答题时间
   SUBMITED 			INTEGER default 0 not null,--答题状态:0:保存,1:提交
   REMOVED             	INTEGER default 0 not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_CPQ_ANSWER primary key (ID)
);
comment on table CPQ_ANSWER is'测评结果';
comment on column CPQ_ANSWER.ID is '主键ID,取seq_cpq_question';
comment on column CPQ_ANSWER.CPQ_ID is '测评问卷ID';
comment on column CPQ_ANSWER.ANSWER is '答案，json格式：{"questionID1":{"deptID1":"10","deptID2":"8",.....},"questionID2":{"deptID1":"3","deptID2":"6",.....},...}';
comment on column CPQ_ANSWER.USER_LOGINNAME is '答题人工号';
comment on column CPQ_ANSWER.ANSWER_TIME is '答题时间';
comment on column CPQ_ANSWER.SUBMITED is '答题状态:0:保存,1:提交';
comment on column CPQ_ANSWER.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';

/*==============================================================*/
/* Table: CPQ_PARTY_LIFE(党组织生活)                                          */
/*==============================================================*/
create table CPQ_PARTY_LIFE 
(
   ID               INTEGER not null,
   DEPT_ID       		VARCHAR2(10),		--部门ID   
   DEPT_NAME       		VARCHAR2(50),		--部门名称  
   CREATOR  		VARCHAR2(20) not null,	--填报人
   CREATOR_LOGINNAME  		VARCHAR2(20) not null,	--填报人工号
   CREATE_TIME      DATE not null,	--填报时间
   YEAR        		VARCHAR2(4) not null,			--年度
   JAN	 			INTEGER default 0,--一月份次数
   FEB	 			INTEGER default 0,--二月份次数
   MAR	 			INTEGER default 0,--三月份次数
   APR	 			INTEGER default 0,--四月份次数
   MAY	 			INTEGER default 0,--五月份次数
   JUN	 			INTEGER default 0,--六月份次数
   JUL	 			INTEGER default 0,--七月份次数
   AUG	 			INTEGER default 0,--八月份次数
   SEP	 			INTEGER default 0,--九月份次数
   OCT	 			INTEGER default 0,--十月份次数
   NOV	 			INTEGER default 0,--十一月份次数
   DECE	 			INTEGER default 0,--十二月份次数
   REMOVED          INTEGER default 0 not null,--逻辑删除标志位:0:未删除,1:已删除
   constraint PK_CPQ_PARTY_LIFE primary key (ID)
);
comment on table CPQ_PARTY_LIFE is'党组织生活';
comment on column CPQ_PARTY_LIFE.ID is '主键ID,取seq_cpq_party_life';
comment on column CPQ_PARTY_LIFE.DEPT_ID is '部门ID';
comment on column CPQ_PARTY_LIFE.DEPT_NAME is '部门名称';
comment on column CPQ_PARTY_LIFE.CREATOR is '填报人';
comment on column CPQ_PARTY_LIFE.CREATOR_LOGINNAME is '填报人工号';
comment on column CPQ_PARTY_LIFE.CREATE_TIME is '填报时间';
comment on column CPQ_PARTY_LIFE.YEAR is '年度';
comment on column CPQ_PARTY_LIFE.JAN is '一月份次数';
comment on column CPQ_PARTY_LIFE.FEB is '二月份次数';
comment on column CPQ_PARTY_LIFE.MAR is '三月份次数';
comment on column CPQ_PARTY_LIFE.APR is '四月份次数';
comment on column CPQ_PARTY_LIFE.MAY is '五月份次数';
comment on column CPQ_PARTY_LIFE.JUN is '六月份次数';
comment on column CPQ_PARTY_LIFE.JUL is '七月份次数';
comment on column CPQ_PARTY_LIFE.AUG is '八月份次数';
comment on column CPQ_PARTY_LIFE.SEP is '九月份次数';
comment on column CPQ_PARTY_LIFE.OCT is '十月份次数';
comment on column CPQ_PARTY_LIFE.NOV is '十一月份次数';
comment on column CPQ_PARTY_LIFE.DECE is '十二月份次数';
comment on column CPQ_PARTY_LIFE.REMOVED is '逻辑删除标志位:0:未删除,1:已删除';

/*==============================================================*/
/* Table: CPT_COMPLAINT(监督投诉)                                          */
/*==============================================================*/
create table CPT_COMPLAINT
(
   ID INTEGER not null,
   CPT_TITLE VARCHAR2(200) not null,--标题
   SITUATION VARCHAR2(50) not null, --情况分类：ccate:situationType
   CONTENT VARCHAR2(2000) not null, --详细内容
   LINKMAN VARCHAR2(50) not null,   --联系人
   LOGIN_NAME VARCHAR2(50) not null,--用户id
   DEPT_NAME VARCHAR2(50) not null,      --所属部门
   DEPT_ID INTEGER not null,        --所属部门id
   TELEPHONE VARCHAR2(20) not null, --联系电话
   EMAIL VARCHAR2(30),              --电子邮箱
   CREATE_TIME DATE not null,       --创建时间
   FB_TITLE VARCHAR2(200) ,    ---反馈标题
   FB_CONTENT VARCHAR2(4000) , ---反馈内容
   FB_NAME  VARCHAR2(50) ,     ---反馈人
   FB_LOGIN_NAME VARCHAR2(50), ---反馈人id
   FB_DEPT_NAME VARCHAR2(50),  ----反馈人所属部门
   FB_DEPT_ID INTEGER,         ---反馈人所属部门id
   FE_CREATE_TIME  DATE ,           ---反馈时间
   REMOVED INTEGER default 0 not null,         --删除标志位：0可用，1删除
   constraint PK_CPT_COMPLAINT PRIMARY KEY(ID)
);

/*==============================================================*/
/* Table: ACT_THEME(征集主题)                                          */
/*==============================================================*/
create table ACT__THEME
(
   ID INTEGER not null,
   NAME VARCHAR2(200) not null,--征集名称
   COL_CATEGORY VARCHAR2(20) not null,--意见类别 ccateType='collectSuggestType'
   START_TIME DATE not null,   --征集开始时间
   END_TIME DATE not null,     --征集结束时间
   PARTICIPANT CLOB not null, --参与人员:loginName (16位工号)，以逗号分隔
   IS_OPEND  VARCHAR2(10) not null,--是否开放  ccateType='opened' 
   CONTENT VARCHAR2(4000) not null,---征集内容
   CREATER VARCHAR2(50) not null,  ---创建人
   LOGIN_NAME VARCHAR2(50) not null,--创建人id
   DEPT_NAME VARCHAR2(50) not null, --创建人所属部门
   DEPT_ID INTEGER not null,        --创建人所属部门id
   CREATE_TIME DATE not null,       --创建时间
   REMOVED INTEGER default 0 not null,
   constraint PK_ACT__THEME PRIMARY KEY(ID)
);

/*==============================================================*/
/* Table: ACT_SUGGESTION(提出意见)                                          */
/*==============================================================*/
create table ACT_SUGGESTION
( 
  ID INTEGER not null,
  CT_ID INTEGER not null,      --征集主题id
  SUGGESTER VARCHAR2(50) not null, --建议人（用户姓名）
  LOGIN_NAME VARCHAR2(50) not null,--建议人id
  DEPT_NAME VARCHAR2(50) not null, --建议人所属部门
  DEPT_ID INTEGER not null,        --建议人所属部门id
  CREATE_TIME DATE not null,       --提出时间
  CONTENT VARCHAR2(2000) not null,           --意见内容
  FB_TITLE VARCHAR2(200) ,    ---反馈标题
  FB_CONTENT VARCHAR2(4000) , ---反馈内容
  FB_NAME  VARCHAR2(50) ,     ---反馈人
  FB_LOGIN_NAME VARCHAR2(50), ---反馈人id
  FB_DEPT_NAME VARCHAR2(50),  ----反馈人所属部门
  FB_DEPT_ID INTEGER,         ---反馈人所属部门id
  FE_CREATE_TIME  DATE ,           ---反馈时间
  REMOVED INTEGER default 0 not null,
  constraint PK_ACT_SUGGESTIONS PRIMARY KEY(ID)
);

