/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.pizzaalex.control;

import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author AWagner
 */

@Named
@ApplicationScoped
public class SessionBean {
    public static List<HttpSession> sessList = new ArrayList();

    public SessionBean() {
        
    }
    
    
    public List<HttpSession> getSessList() {
        return sessList;
    }
    
    
    public void addSess(HttpSession s) {
        sessList.add(s);
    }

     public void remSess(HttpSession s) {
        sessList.remove(s);
    }

    
    
}
