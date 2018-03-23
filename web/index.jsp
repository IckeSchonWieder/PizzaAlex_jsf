<%-- 
    Document   : index
    Created on : 27.02.2018, 15:09:32
    Author     : AWagner
--%>

<%@page import="java.util.HashMap"%>
<%@page import="de.pizzaalex.model.Pizza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="menu" scope="application" class="de.pizzaalex.control.MenuBean" />
<jsp:useBean id="orders" scope="session" class="de.pizzaalex.control.OrderBean" />
<jsp:useBean id="signin" scope="session" class="de.pizzaalex.control.LoginBean" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaAlex - Index</title>
    </head>
    <body>
        <h1>Pizza-Alex, billig und schnell!</h1>
        
        <p>
        <a href ="testCustomTag.jsp">Sortierte Liste (eigenes Tag)</a> <br/>
        <a href ="login.jsp">Menü durchsuchen (JSTL sql)</a>
        </p> 
     
        <hr>
        
        <h2>Menü</h2>
        <form action="<%=request.getContextPath()%>/Control/addItem.jsp" method="post">
            <table>
                <%
                for(Pizza p:menu.getMenuList()){
                %>
                <tr>
                    <td> <%= p.getName() %> </td> 
                    <td> <%= p.getPrice()%> </td>
                    <td> <input type="submit" value="hinzu" name="<%=+p.getId()+",1"%>" /></td>
                    <td> <input type="submit" value="entf" name="<%=+p.getId()+",-1"%>" /></td>
                    
                </tr>
                <%}%>    
            </table>
        </form>
        <br>
        
        <hr>
        <h2>Ihre Bestellung</h2>
        
        <% 
        HashMap<Pizza, Integer> pizzas = orders.getOrder().getPizzas();    
        if (pizzas.isEmpty()) {
        %>
            Noch keine Pizza ausgewählt. Bitte aus dem Menü hinzufügen!
        
        <%} else {  %>
            
            <form method="post" action="customerExists.jsp">
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
                    
                    <tr> 
                        <td style="te">Gesamtpreis:</td> <td></td> <td></td> 
                        <td><%= String.format("%.2f",orders.getOrder().getTotal())%></td>
                    </tr>
                </table> <br>
                <input type="submit" value="Bestellung aufgeben" />
            </form>
            
        <% } %>
       
        
    </body>
</html>
