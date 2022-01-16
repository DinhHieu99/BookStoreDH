package com.bookstore.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

/*
 * day la file cau hinh Spring-MVC cho project
 * @author admin
 * */
@Configuration /*bao hiệu cho spring-boot đây la file cấu hình*/
@EnableWebMvc  /*file cấu hình nay dùng cho Web-MVC*/
@ComponentScan(basePackages = {"com.bookstore"}) /* chi cho Spring-mvc biết nơi chứa các controller*/
public class WebMVC implements WebMvcConfigurer{
	/**
	 * chỉ cho spring-mvc biết nơi chứa các view đã tạo ở phần 1: front-end.
	 * @return
	 */
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		bean.setViewClass(JstlView.class);
		
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		
		return bean;
	}

	// thymeleaf config
	/*@Bean
	public ClassLoaderTemplateResolver secondaryTemplateResolver() {
		ClassLoaderTemplateResolver secondaryTemplateResolver = new ClassLoaderTemplateResolver();
		secondaryTemplateResolver.setPrefix("/webapp/WEB-INF/views/");
		secondaryTemplateResolver.setSuffix(".jsp");
		secondaryTemplateResolver.setTemplateMode(TemplateMode.HTML);
		secondaryTemplateResolver.setCharacterEncoding("UTF-8");
		secondaryTemplateResolver.setOrder(1);
		secondaryTemplateResolver.setCheckExistence(true);

		return secondaryTemplateResolver;
	}*/
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/META-INF/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/META-INF/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/META-INF/img/");
		registry.addResourceHandler("/font/**").addResourceLocations("classpath:/META-INF/font/");
		registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/META-INF/assets/");
	}
}
