
------------------------------------------------------------------objInfo---------------------------------------------------      
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'考勤人员','iasStaff','{"entity":"com.wonders.frame.ias.model.bo.IasStaff"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'流转情况','iasWorkflow','{"entity":"com.wonders.frame.ias.model.bo.IasWorkflow"}',0 from dual;
insert into af_obj_info(id,name,type,params,removed) select seq_af_obj_info.nextval,'考勤记录','iasAttendance','{"entity":"com.wonders.frame.ias.model.bo.IasAttendance"}',0 from dual;

------------------------------------------------------------------ias---------------------------------------------------  
delete from af_codes where ccate_id in(select id from af_ccate where type='iasGender');
delete from af_ccate where type='iasGender'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'iasGender','性别','性别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'male','男','男' ,1 from af_ccate where type='iasGender';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'female','女','女' ,2 from af_ccate where type='iasGender';   

delete from af_codes where ccate_id in(select id from af_ccate where type='iasStaffType');
delete from af_ccate where type='iasStaffType'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'iasStaffType','员工性质','员工性质字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'official','正式员工','正式员工' ,1 from af_ccate where type='iasStaffType';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'loanedPersonnel','派遣工','派遣工' ,2 from af_ccate where type='iasStaffType';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'dispatchingWorker','借调人员','借调人员' ,3 from af_ccate where type='iasStaffType';   
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'labor','劳务工','劳务工' ,4 from af_ccate where type='iasStaffType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'retire','退聘人员','退聘人员' ,5 from af_ccate where type='iasStaffType';

delete from af_codes where ccate_id in(select id from af_ccate where type='yesOrNo');
delete from af_ccate where type='yesOrNo'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'yesOrNo','是否','是否字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'YES','是','是' ,1 from af_ccate where type='yesOrNo';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'NO','否','否' ,2 from af_ccate where type='yesOrNo';


delete from af_codes where ccate_id in(select id from af_ccate where type='iasStatus');
delete from af_ccate where type='iasStatus'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'iasStatus','流转状态','流转状态字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'draft','草稿','草稿' ,1 from af_ccate where type='iasStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'review','已提交，待审批','已提交，待审批' ,2 from af_ccate where type='iasStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'back','已退回','已退回' ,3 from af_ccate where type='iasStatus';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'finish','已上报','已上报' ,3 from af_ccate where type='iasStatus';

delete from af_codes where ccate_id in(select id from af_ccate where type='iasAttendanceType');
delete from af_ccate where type='iasAttendanceType'; 
insert into af_ccate(id,type,name,description) select seq_af_ccate.nextval,'iasAttendanceType','考勤类别','考勤类别字典类' from dual;
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'attendance','出勤','出勤' ,1 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'legalHoliday','法定休假日','法定休假日' ,2 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'generalHoliday','公休','公休' ,3 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'publicHoliday','公假','公假' ,4 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'visitation','探亲','探亲' ,5 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maritalLeave','婚假','婚假' ,6 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'funeralLeave','丧假','丧假' ,7 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'sickLeave','病假','病假' ,8 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'longSick','长病假','长病假' ,9 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'maternityLeave','产假','产假' ,10 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'breastfeedingLeave','哺乳假','哺乳假' ,11 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'workInjury','工伤','工伤' ,12 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'personalLeave','事假','事假' ,13 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'absenteeism','旷工','旷工' ,14 from af_ccate where type='iasAttendanceType';
insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'publicErrand','公差','公差' ,15 from af_ccate where type='iasAttendanceType';

--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'A','出勤','出勤' ,1 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'B','法定休假日','法定休假日' ,2 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'C','公休','公休' ,3 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'D','公假','公假' ,4 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'E','探亲','探亲' ,5 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'F','婚假','婚假' ,6 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'G','丧假','丧假' ,7 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'H','病假','病假' ,8 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'I','产假','产假' ,9 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'J','哺乳假','哺乳假' ,10 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'K','工伤','工伤' ,11 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'L','事假','事假' ,12 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'M','旷工','旷工' ,13 from af_ccate where type='iasAttendanceType';
--insert into af_codes(id,ccate_id,code,display,description,orders) select seq_af_codes.nextval,id,'N','公差','公差' ,14 from af_ccate where type='iasAttendanceType';
