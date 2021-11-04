package shop;

import java.util.Collection;
import java.util.Iterator;
import java.util.ArrayList;

public class Basket {

    ArrayList<Product> items;
    ShopDB db;
    ArrayList<Integer> quantities;

    public static void main(String[] args) {
        Basket b = new Basket();
        b.addItem("art1");
        System.out.println( b.getTotalString() );
        b.clearBasket();
        System.out.println( b.getTotalString() );
        // check that adding a null String causes no problems
        String pid = null;
        b.addItem( pid );
        System.out.println( b.getTotalString() );
    }

    public Basket() {
        db = ShopDB.getSingleton();
        items = new ArrayList<Product>();
        quantities = new ArrayList<>();
    }

    /**
     *
     * @return Collection of Product items that are stored in the basket
     *
     * Each item is a product object - need to be clear about that...
     *
     * When we come to list the Basket contents, it will be much more
     * convenient to have all the product details as items in this way
     * in order to calculate that product totals etc.
     *
     */
    public ArrayList<Product> getItems() {
        return items;
    }
    public ArrayList<Integer> getItemsQuantities() {
        return quantities;
    }

    /**
     * empty the basket - the basket should contain no items after calling this method
     */
    public void clearBasket() {
        //Changes
        items.removeAll(items);
    }

    /**
     *
     *  Adds an item specified by its product code to the shopping basket
     *
     * @param pid - the product code
     */
    public void addItem(String pid) {

        // need to look the product name up in the
        // database to allow this kind of item adding...
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).PID.equals(pid)){
                quantities.set( i,quantities.get(i)+1);
                return;
            }
        }
        addItem( db.getProduct( pid ) );
    }

    public void addItem(Product p) {
        // ensure that we don't add any nulls to the item list
        if (p != null ) {
            items.add( p );
            quantities.add(1);
        }
    }
    public void removeItem(String pid){
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).PID.equals(pid)){
                items.remove(i);
                quantities.remove(i);
                return;
            }
        }
    }
    public void increaseQuantity(String pid){
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).PID.equals(pid)){
                quantities.set( i,quantities.get(i)+1);
                return;
            }
        }
    }
    public void decreaseQuantity(String pid){
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).PID.equals(pid)){
                if(quantities.get(i)!=1){
                    quantities.set( i,quantities.get(i)-1);
                }
                return;
            }
        }
    }
    /**
     *
     * @return the total value of items in the basket in pence
     */
    public float getTotal() {
        // iterate over the set of products...
        float total=0;
        for (int i = 0; i < items.size(); i++) {
            total += items.get(i).price*quantities.get(i);
        }
        // return the total
        return total;
    }

    /**
     *
     * @return the total value of items in the basket as
     * a pounds and pence String with two decimal places - hence
     * suitable for inclusion as a total in a web page
     */
    public String getTotalString() {
		return Float.toString(Math.round(getTotal()*100)/100);
    }
}
