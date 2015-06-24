DROP SEQUENCE WSAF.SEQ_AF_USER;

CREATE SEQUENCE WSAF.SEQ_AF_USER
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;

DROP SEQUENCE WSAF.SEQ_AF_ROLE;

CREATE SEQUENCE WSAF.SEQ_AF_ROLE
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;

DROP SEQUENCE WSAF.SEQ_AF_ORGAN;

CREATE SEQUENCE WSAF.SEQ_AF_ORGAN
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;

DROP SEQUENCE WSAF.SEQ_AF_GROUP;

CREATE SEQUENCE WSAF.SEQ_AF_GROUP
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;

DROP SEQUENCE WSAF.SEQ_AF_PRIVILEGE;

CREATE SEQUENCE WSAF.SEQ_AF_PRIVILEGE
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;

DROP SEQUENCE WSAF.SEQ_AF_RESOURCE;

CREATE SEQUENCE WSAF.SEQ_AF_RESOURCE
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  ORDER;


drop table WSAF.AF_GROUP cascade constraints;

drop table WSAF.AF_ORGAN cascade constraints;

drop table WSAF.AF_PRIVILEGE cascade constraints;

drop table WSAF.AF_RESOURCE cascade constraints;

drop table WSAF.AF_ROLE cascade constraints;

drop table WSAF.AF_USER cascade constraints;

/*==============================================================*/
/* Table: AF_GROUP                                              */
/*==============================================================*/
create table WSAF.AF_GROUP 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50),
   TYPE                 VARCHAR2(20),
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_GROUP primary key (ID)
);

/*==============================================================*/
/* Table: AF_ORGAN                                              */
/*==============================================================*/
create table WSAF.AF_ORGAN 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50) not null,
   TYPE                 VARCHAR2(20),
   DESCRIPTION          VARCHAR2(100),
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_ORGAN primary key (ID)
);

/*==============================================================*/
/* Table: AF_PRIVILEGE                                          */
/*==============================================================*/
create table WSAF.AF_PRIVILEGE 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50) not null,
   TYPE                 VARCHAR2(20),
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_PRIVILEGE primary key (ID)
);

/*==============================================================*/
/* Table: AF_RESOURCE                                           */
/*==============================================================*/
create table WSAF.AF_RESOURCE 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50) not null,
   TYPE                 VARCHAR2(20),
   PATH                 VARCHAR2(200),
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_RESOURCE primary key (ID)
);

/*==============================================================*/
/* Table: AF_ROLE                                               */
/*==============================================================*/
create table WSAF.AF_ROLE 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50) not null,
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_ROLE primary key (ID)
);

/*==============================================================*/
/* Table: AF_USER                                               */
/*==============================================================*/
create table WSAF.AF_USER 
(
   ID                   INTEGER              not null,
   NAME                 VARCHAR2(50) not null,
   LOGIN_NAME           VARCHAR2(50),
   PASSWORD             VARCHAR2(50),
   MOBILE1              NUMBER(11,0),
   MOBILE2              NUMBER(11,0),
   TELEPHONE            VARCHAR2(20),
   EMAIL                VARCHAR2(50),
   GENDER               VARCHAR2(10),
   REMOVED              INTEGER DEFAULT 0  not null,
   constraint PK_AF_USER primary key (ID)
);


insert into AF_OBJ_INFO (id, name, type, params, removed)
values (9, '组信息', 'group', '{"entity":"com.wonders.frame.core.model.bo.Group"}', 0);
insert into AF_OBJ_INFO (id, name, type, params, removed)
values (10, '组织机构信息', 'organ', '{"entity":"com.wonders.frame.core.model.bo.Organ"}', 0);
insert into AF_OBJ_INFO (id, name, type, params, removed)
values (11, '权限信息', 'privilege', '{"entity":"com.wonders.frame.core.model.bo.Privilege"}', 0);
insert into AF_OBJ_INFO (id, name, type, params, removed)
values (12, '资源信息', 'resource', '{"entity":"com.wonders.frame.core.model.bo.Resource"}', 0);
insert into AF_OBJ_INFO (id, name, type, params, removed)
values (7, '用户信息', 'user', '{"entity":"com.wonders.frame.core.model.bo.User"}', 0);
insert into AF_OBJ_INFO (id, name, type, params, removed)
values (8, '角色信息', 'role', '{"entity":"com.wonders.frame.core.model.bo.Role"}', 0);
commit;