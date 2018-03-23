<%-- 
    Document   : Kunde
    Created on : 28.02.2018, 12:08:22
    Author     : AWagner
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="de.pizzaalex.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customers" scope="session" class="de.pizzaalex.control.CustomerBean" />
<jsp:useBean id="orders" scope="session" class="de.pizzaalex.control.OrderBean" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAlex - Kunde</title>
    </head>
    <body>
   
             
        <%    
        String buttonValue = "OK";
        Customer cus;
        
        if (request.getParameter("confirm").contains("OK")) {
            String sid = request.getParameter("cust").split(":")[0];
            int id = Integer.parseInt(sid);
            cus = customers.getCustById(id);
                        
        } else {
            buttonValue = "Neuer Kunde";
            cus = new Customer();
        }
        
        orders.getOrder().setCus(cus);
        %>
        
        
        
        <form method="get" action="checkOrder.jsp">
            <h2>Ihre Kundendaten</h2>
            <table>

                <tr><td> ID:</td><td><%= cus.getId()%> </td></tr>
                <tr><td> Vorname:</td><td><input type="text" name="firstname" value="<%= cus.getFirstname()%>"/></td></tr>
                <tr><td> Nachname:</td><td><input type="text" name="lastname" value="<%= cus.getLastname()%>" /></td></tr>
                <tr><td> Straße:</td><td><input type="text" name="street" value="<%= cus.getStreet()%>" /></td></tr>
                <tr><td> PLZ:</td><td><input type="text" name="postalcode" value="<%= cus.getPostalcode()%>" /></td></tr>
                <tr><td> Ort:</td><td><input type="text" name="city" value="<%= cus.getCity()%>" /></td></tr>
                

            </table>     
            <input type="submit" value="<%= buttonValue  %>" name="confirm" />
        </form>
        
                
    </body>
</html>
