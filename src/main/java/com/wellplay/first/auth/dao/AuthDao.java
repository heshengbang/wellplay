package com.wellplay.first.auth.dao;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.base.entity.Role;
import com.wellplay.first.base.entity.User;
import com.wellplay.first.base.entity.UserRole;
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

    public void insertUser(final User user) throws Exception {

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
        Session session = this.getSession();
        if (session != null) {
            session.save(user);
            session.flush();
            session.close();
        } else {
            throw new Exception("注册失败");
        }
    }

    public void addRoleToUser(String role_user, User user) throws Exception {
        Session session = this.getSession();
        try {
            Role role = (Role) session.createQuery("from Role as r where r.role_name = ?").setParameter(0, role_user).uniqueResult();
            User existUser = (User) session.createQuery("from User as r where r.username = ? and r.email = ?").setParameter(0, user.getUsername()).setParameter(1, user.getEmail());
            UserRole userRole = new UserRole();
            userRole.setRole_id(role.getId());
            userRole.setRole_name(role.getRole_name());
            userRole.setUser_id(existUser.getId());
            userRole.setUser_name(existUser.getUsername());
            session.save(userRole);
        } catch (Exception e) {
            //如果添加角色失败就删除用户，注册失败
            User existUser = (User) session.createQuery("from User as r where r.username = ? and r.email = ?").setParameter(0, user.getUsername()).setParameter(1, user.getEmail()).uniqueResult();
            session.delete(existUser);
            throw e;
        } finally {
            session.flush();
            session.close();
        }
    }
}

























