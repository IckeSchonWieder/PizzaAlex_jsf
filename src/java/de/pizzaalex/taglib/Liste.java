/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.pizzaalex.taglib;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 *
 * @author schulung
 */
public class Liste extends BodyTagSupport{
    public Boolean sorted;

    public Boolean getSorted() {
        return sorted;
    }

    public void setSorted(Boolean sorted) {
        this.sorted = sorted;
    }
    
    
    
    public int doAfterBody() {
        try {
            BodyContent bc=getBodyContent();
            JspWriter out = bc.getEnclosingWriter();
            
            StringTokenizer buffer = new StringTokenizer(bc.getString());
            String[] list = new String[buffer.countTokens()];
            
            int i = 0;
            while (buffer.hasMoreElements()){
                list[i++] = buffer.nextToken();
            }
                
            if (sorted) {
                Arrays.sort(list);
            }
            
           //out.write("Länge: " + list.length + "<br/>");
            for (String item:list){
                out.write(item + "<br/>");
            }
           
        } catch (IOException ex) {
            Logger.getLogger(Liste.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return SKIP_BODY;
    }
       
}
