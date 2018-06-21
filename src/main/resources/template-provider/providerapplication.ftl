package ${packageName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
* 主入口.
* @author weahan qd
*/
@EnableDiscoveryClient
@SpringBootApplication(exclude = {MongoAutoConfiguration.class})
@SuppressWarnings("unused")
public class Application {

    Application() {

    }

    /**
     * 入口函数.
     *
     * @param args 命令行参数
     */
    public static void main(final String[] args) {
        SpringApplication.run(Application.class, args);
    }

    /**
     * 规避checkstyle.
     */
    public void sayHello() {
        System.out.println("hello weahan");
    }
}
