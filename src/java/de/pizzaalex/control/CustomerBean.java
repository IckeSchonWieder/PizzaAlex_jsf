
package de.pizzaalex.control;

import de.pizzaalex.db.DaoCustomer;
import de.pizzaalex.model.Customer;
import de.pizzaalex.model.Order;
import java.io.Serializable;
import java.util.ArrayList;
import javax.enterprise.context.SessionScoped;

import javax.inject.Named;

/**
 *
 * @author AWagner
 */

@SessionScoped
@Named
public class CustomerBean implements Serializable {
    private ArrayList<Customer> customers;
    private Customer selectedCustomer;
    private boolean hasAcc;
    
    public CustomerBean() {
        hasAcc = false;
        customers = new ArrayList();
        DaoCustomer daoC = new DaoCustomer();
        customers.addAll(daoC.readCustomers());
    }
   
    public Customer getSelectedCustomer() {
        return selectedCustomer;
    }

    public void setSelectedCustomer(Customer selectedCustomer) {
        this.selectedCustomer = selectedCustomer;
    }

    public ArrayList<Customer> getCustomers() {
        return customers;
    }

    
    public void setCustomers(ArrayList<Customer> customers) {
        this.customers = customers;
    }
    
    public boolean isHasAcc() {
        return hasAcc;
    }

    public void setHasAcc(boolean hasAcc) {
        this.hasAcc = hasAcc;
    }

  
    
    public Customer getCustById(int id){
        Customer found = null;
        
        for (Customer cus:customers) {
            if (cus.getId() == id) {
                found = cus;
                //System.out.println("Kunde gefunden: " + cus.id + " " + found.id);
            } 
        }
        return found;
    }
    
    public String newCust(){
        selectedCustomer = new Customer();
        hasAcc = false;
        return "newCustomer";
    }
     
    public void addCustomer(Customer cus) {
        DaoCustomer dc = new DaoCustomer();
        dc.storeContact(cus);
        customers.add(cus);
    }
    
    public String checkOrder(Order order){
        if (!hasAcc) {
            addCustomer(selectedCustomer);
        }
        order.setCus(selectedCustomer);
        return "check";
    }
}
