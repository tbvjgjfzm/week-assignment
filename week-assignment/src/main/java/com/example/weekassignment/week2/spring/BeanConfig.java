package com.example.weekassignment.week2.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean
    public DefaultService defaultService() {
        return new DefaultService();
    }
}
