package com.example.trainticketsystem.Controller;


import com.example.trainticketsystem.Service.DriverService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@Slf4j
@RestController
@RequestMapping
public class DriverController {
    @Autowired
    private DriverService driverService;

    //登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String test(@RequestParam String name){
        return null;
    }
}
