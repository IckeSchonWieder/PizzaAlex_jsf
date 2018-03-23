
package de.pizzaalex.model;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author AWagner
 */
public class Order implements Serializable{
    public int id;
    public List<OrderedItem> items;
    public Customer cus;
    public String ipAddr;
    public String sessId;
    public double total;
    
    
    public Order(Customer cus) {
        this.id = 0;
        this.items = new ArrayList();
        this.cus = cus;
        this.sessId = "";
        this.ipAddr = "";
        this.total = 0;
    }

    public Order() {
        this.id = 0;
        this.items = new ArrayList<>();
        this.sessId = "";
        this.ipAddr = "";
        this.total = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<OrderedItem> getItems() {
        return items;
    }

    public void setItems(List<OrderedItem> items) {
        this.items = items;
    }

    
    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }
    
    public double getTotal() {
        total = 0;
        for (OrderedItem item:items){
            total += item.getPizza().getPrice();
        }    
        
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    public String getSessId() {
        return sessId;
    }

    public void setSessId(String sessId) {
        this.sessId = sessId;
    }
    
    
    public int getCountByID(int id) {
        for (OrderedItem item:items){
            if (item.getPizza().getId() == id){
                return item.getCount();
            }
        }
        return 0;
    }
    
    
    public OrderedItem getItemByID(int id) {
        for (OrderedItem item:items){
            if (item.getPizza().getId() == id){
                return item;
            }
        }
        return null;
    }
    
      
    @Override
    public String toString() {
        String res = "";
        for (OrderedItem item:items) {
            res+= item.getCount() + " mal " + item.getPizza().toString()+ "\n\r";
        }
        
        return res;
    }
    
    
}
