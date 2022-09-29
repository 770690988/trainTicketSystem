package com.example.trainticketsystem.Utils.Identity;

import com.alibaba.fastjson.JSONObject;
import com.example.trainticketsystem.Model.User;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
public class TokenUtils {

    public static User customerGet(String authorization, RedisTemplate redisTemplate) {
        Object dataForOut = redisTemplate.opsForValue().get(authorization);
        if (dataForOut == null){//不存在的情况
            return null;
        }
        User driver = JSONObject.parseObject(dataForOut.toString(),User.class);
        return driver;
    }

    public static User auditorGet(String authorization, RedisTemplate redisTemplate) {
        Object dataForOut = redisTemplate.opsForValue().get(authorization);
        if (dataForOut == null){//不存在的情况
            return null;
        }
        User auditor = JSONObject.parseObject(dataForOut.toString(),User.class);
        return auditor;
    }

    public static void loginoutAuditor(Long auditorPhone,RedisTemplate redisTemplate){
        //删除这个审核员的所有token
        String tokenHead = "A" + auditorPhone.hashCode() + "*";
        Set<String> keysSet = redisTemplate.keys(tokenHead);
        redisTemplate.delete(keysSet);
    }

    public static void loginoutDriver(Long driverPhone, RedisTemplate redisTemplate){
        //删除这个司机的所有token
        String tokenHead = "D" + driverPhone.hashCode() + "*";
        Set<String> keysSet = redisTemplate.keys(tokenHead);
        redisTemplate.delete(keysSet);
    }

}
