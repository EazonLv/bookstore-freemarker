package com.yc.bookstore.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginHandlerInterceptor loginHandlerInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(loginHandlerInterceptor);


        interceptorRegistration.excludePathPatterns("/lib/**");
        interceptorRegistration.excludePathPatterns("/html/login.html");
        interceptorRegistration.excludePathPatterns("/favicon.ico");
        interceptorRegistration.excludePathPatterns("/index/**");
        interceptorRegistration.excludePathPatterns("/error/**");
        interceptorRegistration.excludePathPatterns("/user/login");
        interceptorRegistration.excludePathPatterns("/index");
        interceptorRegistration.excludePathPatterns("/login");

        interceptorRegistration.addPathPatterns("/**");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("static/**").addResourceLocations("classpath:static/**");
    }
}
