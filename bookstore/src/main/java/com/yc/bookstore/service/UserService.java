package com.yc.bookstore.service;

import com.yc.bookstore.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public interface UserService {

    /**
     * 用户登录
     * @param userid
     * @param password
     * @return
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     */
    public User userLogin(String userid, String password) throws UnsupportedEncodingException, NoSuchAlgorithmException;

    /**
     * 用户退出登录
     * @param request
     * @return
     */
    public void userExit(HttpServletRequest request);
}
