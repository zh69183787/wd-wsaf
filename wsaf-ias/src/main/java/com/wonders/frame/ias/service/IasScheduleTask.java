package com.wonders.frame.ias.service;

import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.utils.SpringBeanUtil;
import com.wonders.frame.ias.model.bo.IasReg;
import com.wonders.frame.ias.model.bo.IasWorkflow;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: zhoushun
 * Date: 2015/3/4
 * Time: 14:16
 * To change this template use File | Settings | File Templates.
 */
@Component
public class IasScheduleTask {

    private static Logger logger= LoggerFactory.getLogger(IasScheduleTask.class);
    private static String localIp = "http://10.1.48.16:7001/ias";

    @Resource
    GenericService genericService;

    @Resource
    TodoItemService todoItemService;

    /**
     * 每月23日 催办未完成待办项
     */
    @Scheduled(cron = "0 0 7 23 * ?")
    public void urgeTask(){
        //获取待办项接口地址以及办理页面的URL
        Properties properties = SpringBeanUtil.getProperties("classpath:iasConfig.properties");
        localIp = properties.getProperty("localIp");
        String addTaskApiUrl=properties.getProperty("addTaskApiUrl");
        String todoAppUrl = localIp + properties.getProperty("back"+"-todoAppUrl");
        String todoItemId = "";
        //查找所有考勤部门及人员
        List<IasReg> regList = (List<IasReg>)genericService.executeMethod("iasReg","findAll",
                new Class[]{},new Object[]{});
        for(IasReg reg : regList){
            List<IasWorkflow> count = (List<IasWorkflow>)genericService.executeMethod("iasWorkflow","findByMonth",
                    new Class[] {String.class,String.class},
                    new Object[] {reg.getDeptCode(),getLastMonth(0)});
            if(count.size() > 0) {
                IasWorkflow work = count.get(0);
                if ("draft".equals(work.getStatus())) {
                    todoItemId = todoItemService.addTodoItem(addTaskApiUrl, "部门考勤（每月23日定时提醒）",
                            "", reg.getLoginName(), reg.getLoginName(),
                            todoAppUrl, "部门考勤");
                    genericService.executeMethod("iasWorkflow", "updateTodoItemIdById",
                            new Class[]{Integer.class, String.class}, new Object[]{work.getId(), todoItemId});
                    logger.debug("update TodoItem:" + todoItemId);
                }
            }else{
                IasWorkflow work = new IasWorkflow();
                work.setIasName(getLastMonth(0)+"考勤表");
                work.setIasDept(reg.getDeptCode());
                work.setStatus("draft");
                work.setInitiator(reg.getStaffName());
                work.setInitiatorLoginname(reg.getLoginName());
                work.setHandler(reg.getStaffName());
                work.setHandlerLoginname(reg.getLoginName());
                work.setIasMonth(getLastMonth(0));
                work.setInitiateTime(new Date());
                IasWorkflow obj = (IasWorkflow)genericService.executeMethod("iasWorkflow", "save",
                        new Class[] { Object.class }, new Object[] { work });
            }
        }

        //判断当月是否完成

        //
    }

    public String getLastMonth(int interval){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, interval);
        return new SimpleDateFormat("yyyy-MM").format(calendar.getTime());
    }

}
