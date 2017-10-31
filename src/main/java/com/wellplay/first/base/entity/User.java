package com.wellplay.first.base.entity;/*
 * Copyright ©2011-2016 hsb
 */

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

    private int id;

    private String username;

    private String password;

    private char enable;

    private String email;

    public User() {
        super();
    }

    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    @Id
    @Column(name = "id", nullable = false, unique = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "username", nullable = false, length = 45)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password", nullable = false, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "enable", nullable = false, length = 1)
    public char getEnable() {
        return enable;
    }

    public void setEnable(char enable) {
        this.enable = enable;
    }

    @Column(name = "email", nullable = false, length = 128)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
