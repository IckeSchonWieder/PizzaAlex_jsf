<%-- 
    Document   : logout
    Created on : 14.03.2018, 14:33:36
    Author     : AWagner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="signin" scope="session" class="de.pizzaalex.control.LoginBean" />
<!DOCTYPE html>

<% 
    signin.logout(request);
    response.sendRedirect("index.jsp");
    
%>