package com.wellplay.first.auth.dao;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.base.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class AuthDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void insertUser(final User user) {

//        String sql = "insert into user(username, password, enable, email) values(?, ?, ?, ?)";
//
//        jdbcTemplate.update(sql, new PreparedStatementSetter() {
//            @Override
//            public void setValues(PreparedStatement preparedStatement) throws SQLException {
//                preparedStatement.setString(1, user.getUsername());
//                preparedStatement.setString(2, user.getPassword());
//                preparedStatement.setString(3, "1");
//                preparedStatement.setString(4, user.getEmail());
//            }
//        });
        this.getSession().save(user);

    }

    public void addRoleToUser(String role_user, User user) {

    }
}

























