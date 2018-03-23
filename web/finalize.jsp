<%-- 
    Document   : finalize
    Created on : 01.03.2018, 13:26:00
    Author     : AWagner
--%>

<%@page import="de.pizzaalex.model.Order"%>
<jsp:useBean id="orders" scope="session" class="de.pizzaalex.control.OrderBean" />

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAlex - Bestellt</title>
    </head>
    <body>
        <h1>Bestellt!!</h1>
        <% 
        Order ord = orders.getOrder();    
        orders.setIpAndSession(request); 
        
        //add ord to database
        orders.addOrder(ord);
        %>
        Ihre IP: <%= ord.getIpAddr() %> <br>
        Ihre SessionID: <%= ord.getSessId()%> <br> <br>
        
        <% Random number = new Random();
        out.print(String.format("Pizza ist unterwegs und wird in ca %d Minuten, "
                + "%d.%d Sekunden bei Ihnen eintreffen.", 
                number.nextInt(20), number.nextInt(60), number.nextInt(100))); 
        %>
        <br>
        <a href="generate/Rechnung.pdf" >Bitte klicken für Ihre Rechnung</a> <br/>
        <br>
                
        <form action="<%=request.getContextPath()%>/Control/newSession.jsp" method="post">
            <br>
            <input type="submit" value="Zurück zur Startseite" />
        </form>
    </body>
</html>
