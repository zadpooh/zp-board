package com.dn.spring;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter {

	private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
			"classpath:/META-INF/resources/", "classpath:/resources/",
			"classpath:/static/", "classpath:/public/"  };
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		if (!registry.hasMappingForPattern("/upload/**")) {
			registry.addResourceHandler("/upload/**")
					.addResourceLocations("/upload/");
		}
		
		if (!registry.hasMappingForPattern("/content/**")) {
			registry.addResourceHandler("/content/**")
					.addResourceLocations("/content/");
		}
		
		if (!registry.hasMappingForPattern("/ace/**")) {
			registry.addResourceHandler("/ace/**")
					.addResourceLocations("/ace/");
		}

		if (!registry.hasMappingForPattern("/blog/**")) {
			registry.addResourceHandler("/blog/**")
					.addResourceLocations("/blog/");
		}

		if (!registry.hasMappingForPattern("/**")) {
			registry.addResourceHandler("/**")
					.addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
		}
		
	}
}
