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

    private final JdbcTemplate jdbcTemplate;

    @Resource
    private SessionFactory sessionFactory;

    @Autowired
    public AuthDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        /*
         * the difference between getCurrentSession() and openSession()
         * simple said, getCurrentSession is not thread safe and openSession is threadSafe it can make new Session for every request
         * http://www.cnblogs.com/pengyusong/articles/6245086.html
         */
        return sessionFactory.openSession();
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

























