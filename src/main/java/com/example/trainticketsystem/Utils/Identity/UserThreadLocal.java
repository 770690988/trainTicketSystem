package com.example.trainticketsystem.Utils.Identity;
import com.example.trainticketsystem.Model.User;

/**
 * @author biubiu
 * @create 2022-09-01 10:38
 */

public class UserThreadLocal {
    private UserThreadLocal(){}

    private static final ThreadLocal<User> LOCAL = new ThreadLocal<>();

    public static void put(User user){
        LOCAL.set(user);
    }

    public static User get(){
        return LOCAL.get();
    }

    public static void remove(){
        LOCAL.remove();
    }
}
