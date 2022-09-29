package com.example.trainticketsystem.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author BiuBiu
 */

@Configuration
public class RedisConfig {
    @Autowired
    private RedisTemplate redisTemplate;

    @Bean
    public RedisTemplate<String,Object> stringSerializerRedisTemplate(){
        RedisSerializer<String> stringRedisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new StringRedisSerializer());
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setHashValueSerializer(new StringRedisSerializer());
        return redisTemplate;
    }

}
