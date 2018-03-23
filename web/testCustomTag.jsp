<%-- 
    Document   : testCustomTag
    Created on : 13.03.2018, 12:08:57
    Author     : AWagner
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="meine" uri="http://www.pizzaalex.de/taglib" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listen sortieren per Tag</title>
    </head>
    <body>
        <h1>Hello Liste!</h1>
        
        <p>       
        <form method="get">
            Sortieren? <br>
            Ja <input type="radio" name="sort" value="true"  />
            Nein <input type="radio" name="sort" value="false" />
            <input type="submit" value="OK" />
        </form>
        </p>
        
        <c:set var="choice" value="false"/>
        
        <c:if test="${param.sort}">
                            <c:set var="choice" value="true"/>
            </c:if>        
        
        <meine:liste sorted="${choice}" >
           Dies
           ist
           meine
           super tolle Liste, die 
           nach Einträgen 
           sortiert wird.
           Der
           Tokenizer unterscheidet hierbei nicht zwischen
           Zeilenumbrüchen oder Leerzeichen.
           Groß und groß macht aber einen Unterschied im Arrays.sort()!
        </meine:liste>
            
        <p><a href="index.jsp">Startseite</a>    </p>
        
    </body>
</html>
