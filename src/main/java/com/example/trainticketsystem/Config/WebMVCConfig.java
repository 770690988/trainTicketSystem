package com.example.trainticketsystem.Config;

import com.example.trainticketsystem.Handler.CustomerHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@EnableWebMvc
@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
    @Resource
    private CustomerHandler customerHandler;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(customerHandler)
                .addPathPatterns("/customer/**")
                .excludePathPatterns("/customer/login");
    }
}
