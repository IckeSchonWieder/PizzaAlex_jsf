<%-- 
    Document   : sql
    Created on : 13.03.2018, 11:21:13
    Author     : AWagner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="signin" scope="session" class="de.pizzaalex.control.LoginBean" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL-SQL Menu</title>
        
    </head>
    <body>
        <c:set var="role" value="none"/>
        
        <h2>Hallo <c:out value="${signin.user.username}" /></h2>
        <p>
            <c:set var="role" value="${signin.role}" />  
            <c:choose>
                <c:when test="${role == 'Cook'}">
                    Sie sind eingeloggt als Koch. 
                    Damit können Sie Gerichte hinzufügen und entfernen.
                    <c:set var="role" value="Cook"/>
                </c:when>
                <c:when test="${role == 'Customer'}">
                    Sie sind eingeloggt als Kunde. 
                    Damit können Sie die Gerichte einsehen.
                    <c:set var="role" value="Customer"/>
                </c:when>
                <c:when test="${role == 'Manager'}">
                    Sie sind eingeloggt als Manager. 
                    Damit haben Sie vollen Zugriff auf die Speisekarte.
                    <c:set var="role" value="Manager"/>
                </c:when>
                <c:otherwise>
                    Sie sind gar nicht eingeloggt. 
                    Trotzdem können Sie die Speisekarte einsehen ;)
                </c:otherwise>
               
            </c:choose> 
        </p>
        
        
        <hr>
        
        <c:set var="s" value="${param.search}" scope="request"/>
        <%--c:if test = "${empty s}">
            <c:set var="s" value ="*"/>
        </c:if --%> 
        Geben Sie Ihren Suchbegriff ein: <br>
        Eine leere Suche zeigt alle Elemente an.
        
        <form method="get">
            <input type="text" name="search" value="" />
            <input type="submit" value="Suche" />
        </form>
        <br/>
        
        <sql:setDataSource driver="org.mariadb.jdbc.Driver" 
                           url="jdbc:mariadb://localhost:3306/pizzadb"
                           user="alex"
                           password="alex"
                           var="con"
                           scope="request" />
        <sql:query dataSource="${con}"
                   var="result"
                   maxRows="10"
                   startRow="0"
                   sql="SELECT * FROM pizza WHERE name LIKE '%${s}%'" />
        
        
        <%-- 
            Buttons are deactivated because no function yet. 
            Need to insert formulars to add function!
        --%>
        
        <table>
            <c:forEach items="${result.columnNames}" var="column">
                <th style="border: 1px solid #000000; padding: 5px;">${column}</th>
            </c:forEach>
        
        <c:forEach items="${result.rows}" var="currRow">
            <tr>
                <c:forEach items="${result.columnNames}" var="column">
                    <td style="border: 1px solid #000000; padding: 5px;" >${currRow[column]}</td>
                     
                </c:forEach>
                
                <c:if test="${role == 'Manager' or role == 'Cook'}">
                    <td><input type="submit" value="Entfernen" name="${currRow["Name"]}" disabled="disabled" /></td>
                </c:if>
                <c:if test="${role == 'Manager'}">
                    <td><input type="submit" value="Preis ändern" name="${currRow["Name"]}" disabled="disabled" /></td>
                </c:if>       
            </tr>
        </c:forEach>
            
        </table>
        
        
        <c:if test="${role == 'Manager' or role == 'Cook'}">
            <input type="submit" value="Hinzufügen" disabled="disabled" /></td>
        </c:if>
                
        <hr>
        
        <a href="index.jsp">Zurück zur Startseite</a> <br>
        <a href="logout.jsp">Zurück zur Startseite mit Logout</a>
</body>
</html>

