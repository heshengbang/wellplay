package com.wellplay.first.auth.service.impl;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.auth.dao.AuthDao;
import com.wellplay.first.auth.service.AuthService;
import com.wellplay.first.base.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService{

    @Autowired
    private transient AuthDao authDao;

    @Override
    public void insertUser(User user) {
        trim(user);
        authDao.insertUser(user);
    }

    private void trim(User user) {

    }
}
