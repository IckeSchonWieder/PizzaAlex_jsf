/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.pizzaalex.util;

import de.pizzaalex.control.SessionBean;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author AWagner
 */

@WebListener

public class SessionListener implements HttpSessionListener {
    private SessionBean sessBean=new SessionBean();
    

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        sessBean.addSess(se.getSession());
        System.out.println("Neue Session erstellt: " + se.getSession().getId());
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        sessBean.remSess(se.getSession());
        System.out.println("Session zerstört: " + se.getSession().getId());
    }
}
