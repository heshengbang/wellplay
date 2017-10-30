package com.wellplay.first.auth.dao;/*
 * Copyright ©2011-2016 hsb
 */

import com.wellplay.first.base.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class AuthDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertUser(final User user) {

        String sql = "insert into user(username, password, enable, email) values(?, ?, ?, ?)";

        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1, user.getUsername());
                preparedStatement.setString(2, user.getPassword());
                preparedStatement.setString(3, "1");
                preparedStatement.setString(4, user.getEmail());
            }
        });
    }
}

























