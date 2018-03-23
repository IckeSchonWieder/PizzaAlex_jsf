
package de.pizzaalex.model;
import java.io.Serializable;

/**
 *
 * @author AWagner
 */
public class Customer implements Serializable {
   // public static int count = 0;
    public int id;
    public String firstname;
    public String lastname;
    public String street;
    public String postalcode;
    public String city;

    

    public Customer(int id, String firstname, String lastname, String street, 
                 String postalcode, String place) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.street = street;
        this.postalcode = postalcode;
        this.city = place;
    }

    public Customer() {
        this.id = 0;
        this.firstname = "";
        this.lastname = "";
        this.street = "";
        this.postalcode = "";
        this.city = "";
        
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String fullName() {
        return id + ": " + firstname + " " + lastname;
    }
    
    @Override
    public String toString() {
        return "Kunde Nr " + id + ": " + firstname + " " + lastname + ", " +
               street + ", " + postalcode + " " + city;
               
    }
    
    
}
