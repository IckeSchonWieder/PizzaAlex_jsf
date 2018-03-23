<%-- 
    Document   : checkOrder
    Created on : 01.03.2018, 13:19:42
    Author     : AWagner
--%>

<%@page import="de.pizzaalex.model.Order"%>
<%@page import="de.pizzaalex.model.Customer"%>
<%@page import="java.util.Enumeration"%>
<%@page import="de.pizzaalex.model.Pizza"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="orders" scope="session" class="de.pizzaalex.control.OrderBean" />
<jsp:useBean id="customers" scope="session" class="de.pizzaalex.control.CustomerBean" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAlex - Bestelluebersicht</title>
    </head>
    <body>
        <%  
            Order ord = orders.getOrder();
            Customer cus = ord.getCus(); 
            
            // Set cus-properties individually, because cus is not included as 
            // a bean but is connected to Order
            cus.setFirstname(request.getParameter("firstname"));
            cus.setLastname(request.getParameter("lastname"));
            cus.setStreet(request.getParameter("street"));
            cus.setPostalcode(request.getParameter("postalcode"));
            cus.setCity(request.getParameter("city"));
        %>
        
        <h1>Hallo Frau/Herr <%= cus.getLastname()%></h1>
        <h2>Ihre Bestellübersicht</h2>
        
        <hr>
        <% 
        System.out.println("KdNr: " + cus.getId());
        ord.setCus(cus);
        
        if (request.getParameter("confirm").contains("Neuer Kunde")) {
            customers.addCustomer(cus);
        }
        
        
        HashMap<Pizza, Integer> pizzas = ord.getPizzas(); 
        %>
        <h3>Bestellung</h3>
        
        <table>
            <tr>
                <th> Name der Pizza </th>
                <th> Anzahl</th>
                <th> Einzelpreis</th>
                <th> Gesamtpreis</th>

            </tr>

            <%
            for(Pizza p:pizzas.keySet()){
            %>
                <tr>
                <td> <%= p.getName() %> </td>
                <td> <%= pizzas.get(p) %> </td>
                <td> <%= p.getPrice() %> </td>
                <td> <%= String.format("%.2f", p.getPrice() * pizzas.get(p))  %> </td>

                </tr>
            <%}%>     
            <hr>
            <tr> 
                <td>Gesamtpreis:</td> <td></td> <td></td> 
                <td><%= String.format("%.2f",ord.getTotal())%></td>
            </tr>
        </table> <br>
        
        <hr>
        
        <h3>Kundendaten</h3>
        
        <form method="post" action="finalize.jsp">
            <%=cus.toString()%> <br>
            <input type="submit" value="Kostenpflichtig bestellen" />
        </form>
    </body>
</html>
