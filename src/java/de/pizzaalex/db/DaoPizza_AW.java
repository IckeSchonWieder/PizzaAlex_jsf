

package de.pizzaalex.db;

import de.pizzaalex.model.Pizza;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * Class which manages the data access between a Pizza object and the 
 * connected database
 * 
 * @author AWagner
 */
public class DaoPizza_AW extends DbConnection {
    
  
    PreparedStatement stm;
    ResultSet rs;
    /**
     * Connection to database. Is managed by super Class (DbConnection)
     */
    Connection connec = null;
    
    /**
     * Method for reading all the pizzas in table "pizza"
     * 
     * @return A list (collection object) of pizzas read from database.
     */ 
    public List<Pizza> readMenu() {
        List<Pizza> menu = new ArrayList<>();
                
        try {
            connec = getConnection();
            stm = connec.prepareStatement("SELECT * FROM pizza");
            rs = stm.executeQuery();
           
            
            while(rs.next()){
                Pizza p = new Pizza();
                p.setId(rs.getInt("PiNr"));
                p.setName(rs.getString("Name"));
                p.setPrice(rs.getDouble("Preis"));
                                
                menu.add(p);
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Pizza.class.getName()).log(Level.SEVERE, null, ex);
        
        // Close connection in any case!
        } finally  {
            if (connec != null)
                try {connec.close();} catch (SQLException e) {e.printStackTrace();}
        }
        
        return menu;
        
    }
    
     
    /**
     * Method for storing a Pizza. Pizza's attributes are inserted into table 
     * "Pizza" of database "PizzaDB". The new pizza number "PiNr" is set
     * automatically by table (primary key auto_inc).
     * 
     * @param p Pizza, which will be added to database.
     * @return True, if no exception. Otherwise returns false.
     */
    public boolean storePizza(Pizza p) {
        try {
            
            connec = getConnection();
            if (connec == null) {
                return false;
            }
            
            //String[] autoGenerated = new String[]{"KdNr"};
            int piNo = 0;
            
            stm = connec.prepareStatement("INSERT INTO Pizza (Name, Preis) "
                                        + "VALUES (?,?)", piNo);
            stm.setString(1, p.getName().trim());
            stm.setDouble(2, p.getPrice());
           
            
            int rows = stm.executeUpdate();
            
            // KdNr is automatically set by database (primary key)
            
            System.out.printf("Es wurde Pizza Nr %d hinzugefügt %n", piNo);
            
            return true;
        
        } catch (SQLException ex) {
            Logger.getLogger(Pizza.class.getName()).log(Level.SEVERE, null, ex);
        
        //  Close connection in any case!
        } finally  {
            if (connec != null)
                try {connec.close();} catch (SQLException e) {e.printStackTrace();}
        }
        
        return false;
    }
    
    
    /**
     * Method for deleting a pizza from the table "Pizza" in database 
     * "PizzaDB". Pizza is identified by its pizza number "PiNr" which is 
     * stored in the pizza attribute "ID".
     * 
     * @param p Pizza which shall be deleted from database.
     * @return True, if no exception. Otherwise returns false. 
     */
    public boolean deletePizza(Pizza p) {
        try {

            connec = getConnection();
            if (connec == null) {
                return false;
            }
            
            stm = connec.prepareStatement("DELETE FROM pizza WHERE PiNr = ?");
            stm.setInt(1, p.getId());
            
            int rows = stm.executeUpdate();
            
            System.out.printf("Es wurde(n) %d Reihe(n) entfernt! %n", rows);
            
            return true;
        
        } catch (SQLException ex) {
            Logger.getLogger(Pizza.class.getName()).log(Level.SEVERE, null, ex);
        
        // Close connection in any case!
        } finally  {
            if (connec != null)
                try {connec.close();} catch (SQLException e) {e.printStackTrace();}
        }
        
        return false;
    }
    
}
