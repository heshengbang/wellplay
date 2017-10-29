package com.wellplay.first.auth.web;/*
 * Copyright ©2011-2016 hsb
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by tongheshang on 2017/10/29.
 * weibo.com/yunshixin
 * https://github.com/tongheshang
 * email: trulyheshengbang@gmail.com
 */
@Controller
@RequestMapping("/wellpaly")
public class AuthController {
    @RequestMapping(value = "registerUser", method = RequestMethod.POST)
    public void register(HttpServletRequest request) {
        System.out.println(request.getSession().getAttribute("username"));
    }
}
