package com.dn.spring;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@PropertySource("classpath:config.properties")
@ConfigurationProperties
@Data
public class ConfigProperties {
	
	private String serverDomain;
	private String fileUploadPath;
    private String facebookAppId;
    private String googleAppId;
    private String googleClientid;
    private String naverClientid;
    private String naverClientSecret;

}
