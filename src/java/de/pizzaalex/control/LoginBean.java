/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.pizzaalex.control;

import de.pizzaalex.model.User;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author AWagner
 */
public class LoginBean implements Serializable{
    private User user;
    private Boolean loggedIn;
    private String role;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(Boolean loggedIn) {
        this.loggedIn = loggedIn;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public void settingRole(HttpServletRequest request) {
        if (request.isUserInRole("Customer")){
            role = "Customer";
        } else if (request.isUserInRole("Cook")) {
            role = "Cook";
        } else if (request.isUserInRole("Manager")) {
            role = "Manager";
        } else {
            role = null; 
        }
    }
    
    
    public Boolean login(User user, HttpServletRequest req){
        this.user=user;
        try {
            req.login(user.getUsername(), user.getPassword());
            loggedIn=true;
            settingRole(req);
        } catch (ServletException ex) {
            loggedIn=false;
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return loggedIn;
        
    }
    
    public void logout(HttpServletRequest req) {
        try {
            req.logout();
            loggedIn = false;
            role = null;
        } catch (ServletException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
