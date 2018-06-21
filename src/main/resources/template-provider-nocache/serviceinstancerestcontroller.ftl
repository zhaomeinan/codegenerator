package com.weahan.familydoctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


/**
* 主入口.
* @author weahan qd
*/
@RestController
public class ServiceInstanceRestController {
private DiscoveryClient discoveryClient;

@Autowired
ServiceInstanceRestController(final @Qualifier("discoveryClient")DiscoveryClient discoveryClient1) {
this.discoveryClient = discoveryClient1;
}

/**
* 获取应用实例.
* @param applicationName 应用名称
* @return 服务实例
*/
@GetMapping("/service-instances/{applicationName}")
public List
<ServiceInstance> serviceInstancesByApplicationName(
    final @PathVariable String applicationName) {
    return this.discoveryClient.getInstances(applicationName);
    }
    }
