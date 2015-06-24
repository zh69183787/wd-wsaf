--建立DBLink
drop database link DB_HR;
create database link DB_HR
  connect to HR_UFIDA identified by ufida_1478
  using '(description=
(address_list=
(address=(protocol=tcp)(host=10.1.43.41)(port=1521))
)
(connect_data=
(service_name=stnic.com)
)
)';

--初次导入人员信息
insert into ias_staff (id,staff_name,staff_code,id_card,login_name,gender,staff_type,unit,unit_code,dept,dept_code,in_time, out_time,manual_entry,remark,removed )
select seq_ias_staff.nextval id,psnname staff_name,psncode staff_code,id id_card,basgroupdef17 login_name,decode(sex,'男','male','female')  gender, decode(psnclassname,'合同制工','official','派遣工','loanedPersonnel','劳务工','labor','调往集团内部单位','dispatchingWorker','other')  staff_type,unitname unit,unitcode unit_code, deptname dept,deptcode dept_code,sysdate in_time,'' out_time,'NO' manual_entry,'' remark,0 removed from hr_ufida@db_hr where  psnclassname='合同制工' or psnclassname='派遣工' or psnclassname='劳务工' or psnclassname='调往集团内部单位';

--更新人员信息的存储过程
create or replace procedure PRO_DB_HR is
  --类型定义
  cursor c_job is
    select psnname staff_name,
           psncode staff_code,
           id id_card,
           basgroupdef17 login_name,
           decode(sex, '男', 'male', 'female') gender,
           decode(psnclassname,
                  '合同制工',
                  'official',
                  '派遣工',
                  'loanedPersonnel',
                  '劳务工',
                  'labor',
                  '调往集团内部单位',
                  'dispatchingWorker',
                  'other') staff_type,
           unitname unit,
           unitcode unit_code,
           deptname dept,
           deptcode dept_code
      from hr_ufida@db_hr
         where psnclassname = '合同制工'
         or psnclassname = '派遣工'
         or psnclassname = '劳务工'
         or psnclassname = '调往集团内部单位';
  --定义一个游标变量
  c_row c_job%rowtype;
  num   number(20);
begin
  open c_job;
  loop
    --提取一行数据到c_row
    fetch c_job
      into c_row;
    --判读是否提取到值，没取到值就退出
    --取到值c_job%notfound 是false
    --取不到值c_job%notfound 是true
    exit when c_job%notfound;
    select count(*)
      into num
      from ias_staff
     where ias_staff.staff_code = c_row.staff_code
       and ias_staff.manual_entry = 'NO';
    if num = 0 then
      insert into ias_staff
        (id,
         staff_name,
         staff_code,
         id_card,
         login_name,
         gender,
         staff_type,
         unit,
         unit_code,
         dept,
         dept_code,
         in_time,
         out_time,
         manual_entry,
         remark,
         removed)
      values
        (seq_ias_staff.nextval,
         c_row.staff_name,
         c_row.staff_code,
         c_row.id_card,
         c_row.login_name,
         c_row.gender,
         c_row.staff_type,
         c_row.unit,
         c_row.unit_code,
         c_row.dept,
         c_row.dept_code,
         sysdate,
         '',
         'NO',
         '',
         0);
         commit;
    else
      update ias_staff
         set staff_name = c_row.staff_name,
             staff_code = c_row.staff_code,
             id_card    = c_row.id_card,
             login_name = c_row.login_name,
             gender     = c_row.gender,
             staff_type = c_row.staff_type,
             unit       = c_row.unit,
             unit_code  = c_row.unit_code,
             dept       = c_row.dept,
             dept_code  = c_row.dept_code,
             in_time = sysdate
       where ias_staff.staff_code = c_row.staff_code
         and ias_staff.manual_entry = 'NO';
         commit;
    end if;

  end loop;
  --关闭游标
  close c_job;
end PRO_DB_HR;

--设置计划任务，每月26号凌晨1点运行更新人员信息的存储过程
 declare 
 job1 number;
 begin 
dbms_job.submit(job1,'PRO_DB_HR;',sysdate,'trunc(last_day(add_months(sysdate,-1)))+26+1/24');
 end;
 


--手动执行更新人员信息的存储过程
begin
  -- Call the procedure
  pro_db_hr;
end;

--查看任务执行情况
  select * from user_jobs;