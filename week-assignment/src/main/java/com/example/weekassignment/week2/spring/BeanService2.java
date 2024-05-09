package com.example.weekassignment.week2.spring;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class BeanService2 {

    private final DefaultService defaultService;

    public void confirm() {
        System.out.println("defaultService = " + defaultService);
    }
}
