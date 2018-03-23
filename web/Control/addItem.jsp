<%-- 
    Document   : addItem
    Created on : 28.02.2018, 15:57:19
    Author     : AWagner
--%>

<%@page import="de.pizzaalex.control.MenuBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="orders" scope="session" class="de.pizzaalex.control.OrderBean" />

        
        <% 
            
            String[] args = request.getParameterNames().nextElement().split(",");
            int pizzaId = Integer.parseInt(args[0]);
            int count = Integer.parseInt(args[1]);
            
            MenuBean pizzas = (MenuBean)application.getAttribute("menu");
            
            orders.addPizza(pizzas.getMenuList().get(pizzaId-1), count);
          
            orders.respSenden(response, "../index.jsp");
         //response.sendRedirect("../index.jsp");
          
        %> 
       <%-- <jsp:forward page="../index.jsp" />--%>
