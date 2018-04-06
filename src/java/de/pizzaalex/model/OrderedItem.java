/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.pizzaalex.model;

import java.io.Serializable;

/**
 *
 * @author AWagner
 */
public class OrderedItem implements Serializable{
    private Pizza pizza;
    private int count;

    public OrderedItem(Pizza pizza, int count) {
        this.pizza = pizza;
        this.count = count;
        
    }

    public OrderedItem() {
    }
        

    public Pizza getPizza() {
        return pizza;
    }

    public void setPizza(Pizza pizza) {
        this.pizza = pizza;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    public double subTotal() {
        return this.count*this.pizza.getPrice();
    }
    
    
}
