insert into cpq_main(id,cpq_name,start_time,end_time,be_test_dept,test_dept,opened,description,applyer,applyer_loginname,applyer_time,status,removed) 
values(seq_cpq_main.nextval,'测评问卷',sysdate,sysdate+10,'2502,2506,2510,2503,2513,2508,2504,2507,2505,2509,2519,2551,2512,2518,2549,2514',
'2945,2942,2946,2959,2920,2921,2922,2923,2924,2925,2944,2941,2553,2943,2962,2953,2949,2949,2954,2951,2952','yes','测试用','李名敏','G001000001612549',sysdate,'doing',0);

insert into cpq_workflow(id,cpq_id,test_dept,initiator,initiator_loginname,initiate_time,handler,handler_loginname,status,todo_item_id,removed) 
values(seq_cpq_workflow.nextval,2,'2549','金涛','G020001000492549',sysdate,'胡波','G002000000332549','tmbk','1111',0);

truncate table cpq_question;
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'思想作风','服务态度','执行首问责任制，服务态度热情诚恳，礼仪接待主动温馨，解答问题细致周到',1,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'思想作风','协作配合','同事之间、部门之间善于沟通，协调配合，相互帮助，有大局意识和奉献精神。',2,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'思想作风','指导协调','积极服务基层一线，善于开展业务指导，乐于帮助基层排忧解难，解决实际难题。',3,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'思想作风','廉洁自律','严格遵守廉洁从业的相关规定和集团的“五个严禁”，没有铺张浪费奢侈办公现象，勇于抵制“违规”行为。',4,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'工作作风','职业形象','穿戴整洁，言谈举止大方得体，举止行为规范，遵守职业操守，遵守劳动纪律，精神面貌良好。',5,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'工作作风','工作效率','公开办事程序，信息反馈及时，及时纠正差错，简化办事程序，工作效率高。',6,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'工作作风','环境秩序','桌面物品摆放整齐，办公秩序良好，氛围和谐，环境整洁。',7,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'工作作风','透明公正','办事程序透明，各类评优选树过程公开、办事公平、公正，讲原则，守规则，不徇私。',8,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'业务水平','工作能力','熟悉岗位专业技术业务，有工作创新能力，善于改进工作方式方法，业务能力强，工作水平、综合素质高。',9,0);
insert into cpq_question(id,cpq_id,item_type,item,standard,orders,removed) values(seq_cpq_question.nextval,38,'业务水平','工作质量','熟悉规章制度、工作程序、办事流程，行文规范，追求卓越，工作仔细差错较少。',10,0);
------------------------------------------------------------------objInfo---------------------------------------------------      
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'测评问卷','cpqMain','{"entity":"com.wonders.frame.icp.model.bo.CpqMain"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'流转情况','cpqWorkflow','{"entity":"com.wonders.frame.icp.model.bo.CpqWorkflow"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'测评问题','cpqQuestion','{"entity":"com.wonders.frame.icp.model.bo.CpqQuestion"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'测评结果','cpqAnswer','{"entity":"com.wonders.frame.icp.model.bo.CpqAnswer"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'党组织生活','cpqPartyLife','{"entity":"com.wonders.frame.icp.model.bo.CpqPartyLife"}',0 from dual;
insert into af_obj_info values(seq_af_obj_info.nextval,'监督投诉问题','cptComplaint','{"entity":"com.wonders.frame.icp.model.bo.CptComplaint"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'征集意见主题','actTheme','{"entity":"com.wonders.frame.icp.model.bo.ActTheme"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'征集意见','actSuggestion','{"entity":"com.wonders.frame.icp.model.bo.ActSuggestion"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'问卷','qteMain','{"entity":"com.wonders.frame.icp.model.bo.QteMain"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'问卷流转情况','qteMainWorkflow','{"entity":"com.wonders.frame.icp.model.bo.QteMainWorkflow"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'分组','qteGroup','{"entity":"com.wonders.frame.icp.model.bo.QteGroup"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'问卷问题','qteQuestion','{"entity":"com.wonders.frame.icp.model.bo.QteQuestion"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'问卷问题选项','qteOption','{"entity":"com.wonders.frame.icp.model.bo.QteOption"}',0);
insert into af_obj_info values(seq_af_obj_info.nextval,'用户问卷答案','qteUserAnswer','{"entity":"com.wonders.frame.icp.model.bo.QteUserAnswer"}',0);
insert into AF_OBJ_INFO VALUES(SEQ_AF_OBJ_INFO.NEXTVAL,'用户填写问卷关系','qteUserMain','{"entity":"com.wonders.frame.icp.model.bo.QteUserMain"}',0);

------------------------------------------------------------------CPQ---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='beTestDept');
delete from af_ccate where type='beTestDept'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'beTestDept','被测评部门','被测评部门字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2502','党办','党办' ,1 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2506','总体规划部','总体规划部' ,2 from af_ccate where type='beTestDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2510','办公室','办公室' ,3 from af_ccate where type='beTestDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2503','工会','工会' ,4 from af_ccate where type='beTestDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2513','审计室','审计室' ,5 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2508','合约管理部','合约管理部' ,6 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2504','团委','团委' ,7 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2507','财务部','财务部' ,8 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2505','监察室','监察室' ,9 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2509','投资管理部','投资管理部' ,10 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2519','安监室','安监室' ,11 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2551','建管中心','建管中心' ,12 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2512','组织人事部','组织人事部' ,13 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2518','企发部','企发部' ,14 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2549','信息中心','信息中心' ,15 from af_ccate where type='beTestDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2514','保卫部','保卫部' ,16 from af_ccate where type='beTestDept';


delete from af_codes where ccate_id in(select id from af_ccate where type='testDept');
delete from af_ccate where type='testDept'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'testDept','参与测评部门','参与测评部门字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2945','股份公司','股份公司' ,1 from af_ccate where type='testDept';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2942','研究咨询公司','研究咨询公司' ,2 from af_ccate where type='testDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2946','资产经营管理公司','资产经营管理公司' ,2 from af_ccate where type='testDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2959','黄浦江大桥建设公司','黄浦江大桥建设公司' ,3 from af_ccate where type='testDept';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2920','运营管理中心','运营管理中心' ,4 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2921','第一运营公司','第一运营公司' ,5 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2922','第二运营公司','第二运营公司' ,6 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2923','第三运营公司','第三运营公司' ,7 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2924','第四运营公司','第四运营公司' ,8 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2925','维护保障公司','维护保障公司' ,9 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2944','教育培训中心','教育培训中心' ,10 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2941','技术研究中心','技术研究中心' ,11 from af_ccate where type='testDept';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2553','运营人力资源公司','运营人力资源公司' ,13 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2943','隧道设计院','隧道设计院' ,12 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2962','磁浮公司','磁浮公司' ,13 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2953','申松线项目公司','申松线项目公司' ,14 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2949','十号线项目公司','十号线项目公司' ,15 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2954','申嘉线项目公司','申嘉线项目公司' ,16 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2951','十二号线项目公司','十二号线项目公司' ,17 from af_ccate where type='testDept';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'2952','十三号线项目公司','十三号线项目公司' ,18 from af_ccate where type='testDept';

delete from af_codes where ccate_id in(select id from af_ccate where type='opened');
delete from af_ccate where type='opened'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'opened','是否开放','是否开放字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'yes','开放','开放' ,1 from af_ccate where type='opened';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'no','未开放','未开放' ,2 from af_ccate where type='opened';


delete from af_codes where ccate_id in(select id from af_ccate where type='cpqStatus');
delete from af_ccate where type='cpqStatus'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'cpqStatus','测评问卷状态','测评问卷状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='cpqStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'doing','测评中','测评中' ,2 from af_ccate where type='cpqStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','完成','完成' ,3 from af_ccate where type='cpqStatus';


delete from af_codes where ccate_id in(select id from af_ccate where type='cpqWorkflowStatus');
delete from af_ccate where type='cpqWorkflowStatus'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'cpqWorkflowStatus','测评问卷流转状态','测评问卷流转状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'assign','网上测评名额分派','网上测评名额分派' ,1 from af_ccate where type='cpqWorkflowStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'tmbk','网上测评填报','网上测评填报' ,2 from af_ccate where type='cpqWorkflowStatus';

------------------------------------------------------------------CPT--------------------------------------------------- 
delete from af_codes where ccate_id in(select id from af_ccate where type='situationtype');
delete from af_ccate where type='situationtype'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'situationtype','监督投诉情况分类','监督投诉情况分类字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'massWork','党群工作类','党群工作类',1 from af_ccate where type='situationtype';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'admimBusiness','行政业务类','行政业务类',2 from af_ccate where type='situationtype';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'disciplineSupervise','纪检监察类','纪检监察类',3 from af_ccate where type='situationtype';

------------------------------------------------------------------ACT--------------------------------------------------- 
delete from af_codes where ccate_id in(select id from af_ccate where type='collectSuggesttype');
delete from af_ccate where type='collectSuggesttype'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'collectSuggesttype','征集意见类别','征集意见类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'partyCategory','党群类','党群类',1 from af_ccate where type='collectSuggesttype';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'manageCategory','管理类','管理类',2 from af_ccate where type='collectSuggesttype';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'technologCategory','技术类','技术类',3 from af_ccate where type='collectSuggesttype';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'specialCategory','专题类','专题类',4  from af_ccate where type='collectSuggesttype';

------------------------------------------------------------------QTE--------------------------------------------------- 
delete from af_codes where ccate_id in(select id from af_ccate where type='questionType');
delete from af_ccate where type='questionType'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'questionType','问题类型','问题类型字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'radio','单选','单选',1 from af_ccate where type='questionType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'multiChoice','多选','多选',2 from af_ccate where type='questionType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'fill','填写题','填写题',3 from af_ccate where type='questionType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'ques','问答题','问答题',4 from af_ccate where type='questionType';

delete from af_codes where ccate_id in(select id from af_ccate where type='isDisplay');
delete from af_ccate where type='isDisplay'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'isDisplay','是否显示','是否显示字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'false','隐藏','隐藏',1 from af_ccate where type='isDisplay';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'true','显示','显示',2 from af_ccate where type='isDisplay';



