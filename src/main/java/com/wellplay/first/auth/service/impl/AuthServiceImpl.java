package com.wellplay.first.auth.service.impl;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.auth.dao.AuthDao;
import com.wellplay.first.auth.service.AuthService;
import com.wellplay.first.base.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
@Transactional(readOnly = true)
public class AuthServiceImpl implements AuthService{

    private final transient AuthDao authDao;

    @Autowired
    public AuthServiceImpl(AuthDao authDao) {
        this.authDao = authDao;
    }

    @Override
    @Transactional(readOnly = false, rollbackFor=Exception.class )
    public void insertUser(User user) throws Exception {
        String result;
        result = trim(user);
        if ("SUCCESS".equals(result)) {
            authDao.insertUser(user);
        } else {
            throw new Exception("注册失败，" + result);
        }
    }

    @Override
    public void addRoleToUser(String role_user, User user) {
        authDao.addRoleToUser(role_user, user);
    }

    private String trim(User user) {
        if (user == null) {
            return "注册信息为空";
        } else {
            if (StringUtils.isEmpty(user.getUsername())) {
                return "用户名不能为空或空字符";
            } else if (StringUtils.isEmpty(user.getPassword())){
                return "密码不能为空或空字符";
            } else if (user.getPassword().length() < 6) {
                return "密码位数应大于等于六位";
            } else if (StringUtils.isEmpty(user.getEmail())) {
                return "邮箱不能为空";
            }
        }
        return "SUCCESS";
    }
}
