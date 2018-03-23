<%-- 
    Document   : login
    Created on : 14.03.2018, 09:44:26
    Author     : AWagner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" scope="page" class="de.pizzaalex.model.User" />
<jsp:useBean id="signin" scope="session" class="de.pizzaalex.control.LoginBean" />
<jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
    
                
        <c:if test="${not (empty user.username || empty user.password)}">
            <% signin.login(user, request); %>
            <%--c:set var="loggedIn" value="${signin.login(user, request)}"/>
            --%>
        </c:if>
        
        
        <c:set var="loggedIn" value="${signin.loggedIn}"/>

        <c:if test="${loggedIn}">
            <p>
            <form action="menucard.jsp" method="POST">
                Hallo <c:out value="${signin.user.username}"/> <br>
                <input type="submit" value="Weiter zum Menü" />
            </form>
            </p>
            
            <form action="logout.jsp">
                <input type="submit" value="Logout" />
            </form>    

        </c:if>

        <c:if test="${not loggedIn}">
        <form method="POST">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username"><br></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password"></td>
                </tr>
            </table>  
            <input type="submit" value="Login">
            
        </form>
        </c:if>
        
        
    </body>
</html>
