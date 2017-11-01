package com.wellplay.first.auth.web;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.auth.service.AuthService;
import com.wellplay.first.base.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by tongheshang on 2017/10/29.
 * weibo.com/yunshixin
 * https://github.com/tongheshang
 * email: trulyheshengbang@gmail.com
 */
@Controller
@RequestMapping("/wellplay")
public class AuthController {

    private final transient AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }


    @RequestMapping(value = "registerUser", method = RequestMethod.POST)
    @ResponseBody
    public String register(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        User user = new User(username, password, email);
        user.setEnable('1');
        try {
            authService.insertUser(user);
            authService.addRoleToUser("ROLE_USER", user);
        } catch (Exception e) {
            return "register fail" + e.getMessage();
        }


        return "register success";
    }

}
