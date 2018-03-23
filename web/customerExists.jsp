<%-- 
    Document   : customerExists
    Created on : 07.03.2018, 16:14:48
    Author     : AWagner
--%>

<%@page import="de.pizzaalex.model.Customer"%>
<%@page import="de.pizzaalex.control.CustomerBean"%>
<jsp:useBean id="customers" scope="session" class="de.pizzaalex.control.CustomerBean" />


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Haben Sie bereits einen Kundenaccount?</h2>
        <hr>
        
        Ja, ich habe bereits einen Account:
        <form action="customer.jsp" method="post">
            <select name="cust" size="1">
            <%
            for(Customer c:customers.getCustomers()){
            %>
                <option><%= c.fullName()%></option>
            <% } %>
            </select>
            
            <input type="submit" value="OK" name="confirm" /> <br>
            <input type="submit" value="Neuer Account" name="confirm" />
        </form>
        
    
    </body>
</html>
