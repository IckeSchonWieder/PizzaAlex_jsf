
package de.pizzaalex.control;

import de.pizzaalex.db.DaoPizza_AW;
import de.pizzaalex.model.Pizza;
import java.io.Serializable;
import java.util.ArrayList;
import javax.faces.bean.ApplicationScoped;
import javax.inject.Named;


/**
 *
 * @author AWagner
 */

@Named
@ApplicationScoped
public class MenuBean implements Serializable{
    private ArrayList<Pizza> menuList;
    
    public MenuBean() {
        menuList = new ArrayList();
        createMenu();
    }

    public void createMenu(){
        DaoPizza_AW daoP = new DaoPizza_AW();
        menuList.addAll(daoP.readMenu());
    }
    
    public ArrayList<Pizza> getMenuList() {
        return menuList;
    }

    
    public void setMenuList(ArrayList<Pizza> menuList) {
        this.menuList = menuList;
    }
    
    
    
    
}
