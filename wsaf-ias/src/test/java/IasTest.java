import com.wonders.frame.ias.service.IasScheduleTask;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 * User: zhoushun
 * Date: 2015/3/30
 * Time: 12:40
 * To change this template use File | Settings | File Templates.
 */
@Component
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:applicationContext.xml")
//public class IasTest extends AbstractTransactionalJUnit4SpringContextTests{
public class IasTest extends AbstractJUnit4SpringContextTests {
    @Resource
    private IasScheduleTask task;

    @Test
    public void taskTest(){
        task.urgeTask();
    }
}
