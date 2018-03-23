<%-- 
    Document   : newSession
    Created on : 09.03.2018, 12:55:29
    Author     : AWagner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    
    session.invalidate(); 
    response.sendRedirect("../index.jsp");

%>