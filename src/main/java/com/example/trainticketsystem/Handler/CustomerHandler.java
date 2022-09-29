package com.example.trainticketsystem.Handler;

import com.example.trainticketsystem.Model.User;
import com.example.trainticketsystem.Utils.Identity.TokenUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

@Component
public class CustomerHandler implements HandlerInterceptor {
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //        System.out.println("进入拦截器");
        String token = request.getHeader("Authorization");
        if (token == null||token.isEmpty()){
            response.sendError(402,"缺少Token");
            return false;
        }
//        System.out.println(token);
        Object dataForOut = redisTemplate.opsForValue().get(token);
//            System.out.println("进入Company拦截器");
        if (StringUtils.isBlank(token)){
            response.sendError(402,"缺少Token");
            return false;
        }
        else if (dataForOut == null){ //检测token是否失效
            response.sendError(402,"Token已经失效");
            return false;
        }
        redisTemplate.opsForValue().setIfPresent(token,dataForOut,1, TimeUnit.DAYS);
        User user = TokenUtils.customerGet(token, redisTemplate);
        if (!user.getUserType().equals("Customer")){
            response.sendError(402,"Token异常");
            return false;
        }
        return true;
    }
}
