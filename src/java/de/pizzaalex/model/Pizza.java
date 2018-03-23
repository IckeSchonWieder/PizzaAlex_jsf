
package de.pizzaalex.model;

import java.io.Serializable;

/**
 *
 * @author AWagner
 */
public class Pizza implements Serializable{
    public static int count = 0;
    public int id;
    public String name;
    public double price;
    
    /**
     * Full constructor to create a new pizza.
     * @param name Name of the pizza.
     * @param price Price of the pizza.
     */
    public Pizza(String name, double price) {
        this.id = ++count;
        this.name = name;
        this.price = price;
    }
    
    /**
     * Second constructor to create a new pizza. Price is set to default value of 5.99.
     * @param name Name of the pizza.
     */
    public Pizza(String name) {
        this.id = ++count;
        this.name = name;
        this.price = 5.99;
    }
    
    /**
     * Standard Constructor. Price is set to default of 5.99
     */
    public Pizza() {
        this.id = ++count;
        this.price = 5.99;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    @Override
    public String toString() {
        return name+ ", " + price;
    }

    
}
