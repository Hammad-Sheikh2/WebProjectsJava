
package shop;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Iterator;

public class ShopDB {

    Connection con;
    static int nOrders = 0;
    static ShopDB singleton;

    public static void main(String[] args) throws Exception  {
        // simple method to test that ShopDB works
        // comment it out of the final version
        System.out.println("Got this far...");
        ShopDB db = new ShopDB();
        System.out.println("created shop db");
        Basket basket = new Basket();
        System.out.println("created the basket");

        System.out.println("Testing getAllProducts");
        Collection c = db.getAllProducts();
        for (Iterator i = c.iterator(); i.hasNext() ; ) {
            Product p = (Product) i.next();
            System.out.println( p );
        }
        System.out.println("Testing getProduct(pid)");
        Product product = db.getProduct("art1");
        System.out.println( product );

        System.out.println("Testing order: ");
        basket.addItem( product );
        System.out.println("added an item");
        db.order( basket , "Simon" );
        System.out.println("order done");

    }

    public ShopDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("loaded class");
            //jdbc:hsqldb:file:\tomcat\webapps\ass2\shopdb
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb", "root", "1234");
            System.out.println("created con");
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
    }

    public static ShopDB getSingleton() {
        if (singleton == null) {
            singleton = new ShopDB();
        }
        return singleton;
    }

    public ResultSet getProducts() {
        try {
            Statement s = con.createStatement();
            System.out.println("Created statement");
            ResultSet rs = s.executeQuery("Select * from Product");
            System.out.println("Returning result set...");
            return rs;
        }
        catch(Exception e) {
            System.out.println( "Exception in getProducts(): " + e );
            return null;
        }
    }

    public Collection<Product> getAllProducts() {
        return getProductCollection("Select * from Product");
    }

    public Product getProduct(String pid) {
        try {
            // re-use the getProductCollection method
            // even though we only expect to get a single Product Object
            String query = "Select * from Product where PID = '" + pid + "'";
            Collection<Product> c = getProductCollection( query );
            Iterator<Product> i = c.iterator();
            return i.next();
        }
        catch(Exception e) {
            // unable to find the product matching that pid
            return null;
        }
    }

    public Collection<Product> getProductCollection(String query) {
        LinkedList<Product> list = new LinkedList<Product>();
        try {
            Statement s = con.createStatement();

            ResultSet rs = s.executeQuery(query);
            while ( rs.next() ) {
                Product product = new Product(
                        rs.getString("PID"),
                        rs.getString("Artist"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getInt("price"),
                        rs.getString("thumbnail"),
                        rs.getString("fullimage")
                );
                list.add( product );
            }
            return list;
        }
        catch(Exception e) {
            System.out.println( "Exception in getProducts(): " + e );
            return null;
        }
    }

    public void order(Basket basket , String customer) {
        try {
            // create a unique order id
            String orderId = System.currentTimeMillis() + ":" + nOrders++;

            // iterate over the basket of contents ...
            ArrayList<Product> items = basket.getItems();
            ArrayList<Integer> quantities=basket.getItemsQuantities();
            for (int i = 0; i < items.size(); i++) {
                order( con, items.get(i),quantities.get(i), orderId, customer );
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }

    }

    private void order(Connection con, Product p,int quantity, String orderId, String customer) throws Exception {
        String query="INSERT INTO orders(PID,ORDERID,EMAIL,QUANTITY,PRICE) VALUES('"+p.PID+"','"+orderId+"','"+customer+"',"+quantity+","+p.price+")";
        try{
            Statement s = con.createStatement();
            int rowsAffected=s.executeUpdate(query);
            if(!(rowsAffected==0)) {
                System.out.println( "Order Added.");
            }
            else{
                System.out.println( "Order Not Added." );
            }
        }catch (Exception e){
            System.out.println( "Exception in getProducts(): " + e );
        }
    }


}
