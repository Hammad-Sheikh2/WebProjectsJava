package org.controller;
import org.modal.Item;
import org.modal.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import com.sun.istack.internal.NotNull;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/App")
public class AppController{
    @Autowired
    ServletContext context;
    //This function receive get request of Home Page and check session of user id
    // if available then return Home Page otherwise Login Page.
    @RequestMapping(method = RequestMethod.GET ,value = "/")
    public ModelAndView MainPage(HttpSession session){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        //curUser & Home Page on Load Make Request for All Data in Gson.
        ModelAndView mv =new ModelAndView("Home");
        return mv;
    }
    @RequestMapping(method = RequestMethod.GET ,value = "/Add-New-Item")
    //This function receive get request of Add New Item Page and check session of user id
    // if available then return Add New Item Page otherwise Login Page.
    public ModelAndView AddNewItemPage(HttpSession session){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("AddNewItem");
        return mv;
    }
    //This function receive get request of My Items Page and check session of user id
    // if available then return My Items Page otherwise Login Page.
    @RequestMapping(method = RequestMethod.GET ,value = "/My-Items")
    public ModelAndView MyItemsPage(HttpSession session){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        //curUser & Home Page on Load Make Request for All Its Data in Gson.
        ModelAndView mv =new ModelAndView("MyItems");
        mv.addObject("currUser",DatabaseHandler.FindUserById((int)session.getAttribute("userId")));
        return mv;
    }
    //This function receive Post request adding new item. As a Parameter of this request
    //we receive Item Details. This function validates data and make
    //request for adding this data in DB to DatabaseHandler function and send respose to
    // Add New Item Page.
    @RequestMapping(method = RequestMethod.POST ,value = "/Add-New-Item",headers = "content-type=multipart/form-data")
    public ModelAndView AddNewItem(HttpSession session,@RequestParam("itemName") String itemName, @RequestParam("itemDescription") String itemDescription, @RequestParam("itemQuantity") int itemQuantity, @RequestParam("itemImage") MultipartFile itemImage){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        try{
            User u = DatabaseHandler.FindUserById((int)session.getAttribute("userId"));
            if(itemImage.isEmpty()){
                throw new RuntimeException("Image is Empty.");
            }
            Item item = new Item();
            item.itemName=itemName;
            item.itemDescription=itemDescription;
            item.user=u;
            item.dateTime= new Date();
            item.itemImage=itemImage.getOriginalFilename();
            item.isSold=false;
            item.itemQuantity=itemQuantity;
            String orgName = itemImage.getOriginalFilename();
            String filePath = context.getRealPath("/Images")+File.separator+ orgName;
            File dest = new File(filePath);
            try {
                itemImage.transferTo(dest);
            } catch (IllegalStateException e) {
                e.printStackTrace();
                mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
                return mv;
            } catch (IOException e) {
                e.printStackTrace();
                mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
                return mv;
            }
            DatabaseHandler.AddNewItem(item);
            mv.addObject("data","{\"status\":true}");
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request for all items for Home Page.
    // This function make request to DatabaseHandler function for all data and send respose to
    // Home Page.
    @RequestMapping(method = RequestMethod.POST ,value = "/")
    public ModelAndView GetAllItemsAvailableToBuy(HttpSession session){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        try{
            ArrayList<Item> items = DatabaseHandler.GetAllItemsAvailableToBuy((int)session.getAttribute("userId"));
            String result= "{\"status\":true,\"items\":[";
            int size=items.size();
            for (int i = 0; i < size; i++) {
                result+= "{\"id\":"+items.get(i).id+",\"itemName\":\""+items.get(i).itemName+"\",\"itemImage\":\""+items.get(i).itemImage+"\",\"itemDescription\":\""+items.get(i).itemDescription+"\",\"user\":{\"id\":"+items.get(i).user.id+",\"username\":\""+items.get(i).user.username+"\",\"email\":\""+items.get(i).user.email+"\",\"phn\":\""+items.get(i).user.phn+"\"},\"date\":\""+items.get(i).dateTime.toString()+"\",\"isSold\":"+items.get(i).isSold+",\"itemQuantity\":"+items.get(i).itemQuantity+"}" + (i+1==size?"":",");
            }
            result+="]}";
            mv.addObject("data",result);
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request for all items that contain a key in its Name for Home Page.
    //As a Parameter of this request we receive key
    // This function make request to DatabaseHandler function for all data and send respose to
    // Home Page.
    @RequestMapping(method = RequestMethod.POST ,value = "/Search-Items")
    public ModelAndView GetAllSearchedItemsAvailableToBuy(HttpSession session,@RequestParam("key") String key){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        try{
            ArrayList<Item> items = DatabaseHandler.GetAllItemsAvailableToBuy((int)session.getAttribute("userId"));
            String result= "{\"status\":true,\"items\":[";
            int size=items.size();
            int counter=0;
            boolean isFirst=true;
            for (int i = 0; i < size; i++) {

                if(items.get(i).itemName.toUpperCase().contains(key.toUpperCase())) {
                    if (isFirst) {
                        result += "{\"id\":" + items.get(i).id + ",\"itemName\":\"" + items.get(i).itemName + "\",\"itemImage\":\"" + items.get(i).itemImage + "\",\"itemDescription\":\"" + items.get(i).itemDescription + "\",\"user\":{\"id\":" + items.get(i).user.id + ",\"username\":\"" + items.get(i).user.username + "\",\"email\":\"" + items.get(i).user.email + "\",\"phn\":\"" + items.get(i).user.phn + "\"},\"date\":\"" + items.get(i).dateTime.toString() + "\",\"isSold\":" + items.get(i).isSold + ",\"itemQuantity\":" + items.get(i).itemQuantity + "}";
                        isFirst = false;
                    } else {
                        result += ",{\"id\":" + items.get(i).id + ",\"itemName\":\"" + items.get(i).itemName + "\",\"itemImage\":\"" + items.get(i).itemImage + "\",\"itemDescription\":\"" + items.get(i).itemDescription + "\",\"user\":{\"id\":" + items.get(i).user.id + ",\"username\":\"" + items.get(i).user.username + "\",\"email\":\"" + items.get(i).user.email + "\",\"phn\":\"" + items.get(i).user.phn + "\"},\"date\":\"" + items.get(i).dateTime.toString() + "\",\"isSold\":" + items.get(i).isSold + ",\"itemQuantity\":" + items.get(i).itemQuantity + "}";
                    }
                    counter++;
                }
            }
            if(counter==0){
                throw new RuntimeException("No Data Matched");
            }
            result+="]}";
            mv.addObject("data",result);
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request for all user's items for My Items Page.
    // This function make request to DatabaseHandler function for all data and send respose to
    // My Items Page.
    @RequestMapping(method = RequestMethod.POST ,value = "/My-Items")
    public ModelAndView GetAllMyItems(HttpSession session){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        try{
            ArrayList<Item> items = DatabaseHandler.GetAllMyItems((int)session.getAttribute("userId"));
            String result= "{\"status\":true,\"items\":[";
            int size=items.size();
            for (int i = 0; i < size; i++) {
                result+= "{\"id\":"+items.get(i).id+",\"itemName\":\""+items.get(i).itemName+"\",\"itemImage\":\""+items.get(i).itemImage+"\",\"itemDescription\":\""+items.get(i).itemDescription+"\",\"user\":{\"id\":"+items.get(i).user.id+",\"username\":\""+items.get(i).user.username+"\",\"email\":\""+items.get(i).user.email+"\",\"phn\":\""+items.get(i).user.phn+"\"},\"date\":\""+items.get(i).dateTime.toString()+"\",\"isSold\":"+items.get(i).isSold+",\"itemQuantity\":"+items.get(i).itemQuantity+"}" + (i+1==size?"":",");
            }
            result+="]}";
            mv.addObject("data",result);
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request for all user's items that contain a key in its Name for My Items Page.
    //As a Parameter of this request we receive key
    // This function make request to DatabaseHandler function for all data and send respose to
    // My Items Page.
    @RequestMapping(method = RequestMethod.POST ,value = "/Search-My-Items")
    public ModelAndView GetAllSearchedMyItems(HttpSession session,@RequestParam("key") String key){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        try{
            ArrayList<Item> items = DatabaseHandler.GetAllMyItems((int)session.getAttribute("userId"));
            String result= "{\"status\":true,\"items\":[";
            int size=items.size();
            int counter=0;
            boolean isFirst=true;
            for (int i = 0; i < size; i++) {

                if(items.get(i).itemName.toUpperCase().contains(key.toUpperCase())) {
                    if (isFirst) {
                        result += "{\"id\":" + items.get(i).id + ",\"itemName\":\"" + items.get(i).itemName + "\",\"itemImage\":\"" + items.get(i).itemImage + "\",\"itemDescription\":\"" + items.get(i).itemDescription + "\",\"user\":{\"id\":" + items.get(i).user.id + ",\"username\":\"" + items.get(i).user.username + "\",\"email\":\"" + items.get(i).user.email + "\",\"phn\":\"" + items.get(i).user.phn + "\"},\"date\":\"" + items.get(i).dateTime.toString() + "\",\"isSold\":" + items.get(i).isSold + ",\"itemQuantity\":" + items.get(i).itemQuantity + "}";
                        isFirst = false;
                    } else {
                        result += ",{\"id\":" + items.get(i).id + ",\"itemName\":\"" + items.get(i).itemName + "\",\"itemImage\":\"" + items.get(i).itemImage + "\",\"itemDescription\":\"" + items.get(i).itemDescription + "\",\"user\":{\"id\":" + items.get(i).user.id + ",\"username\":\"" + items.get(i).user.username + "\",\"email\":\"" + items.get(i).user.email + "\",\"phn\":\"" + items.get(i).user.phn + "\"},\"date\":\"" + items.get(i).dateTime.toString() + "\",\"isSold\":" + items.get(i).isSold + ",\"itemQuantity\":" + items.get(i).itemQuantity + "}";
                    }
                    counter++;
                }
            }
            if(counter==0){
                throw new RuntimeException("No Data Matched");
            }
            result+="]}";
            mv.addObject("data",result);
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request to reduce item quantity.
    @RequestMapping(method = RequestMethod.POST, value="/Sell-Item")
    public ModelAndView SellItem(HttpSession session,@RequestParam("id") int id,@RequestParam("num") int num){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        if(num<=0){
            mv.addObject("data","{\"status\":false,\"message\":\"Enter Positive Quantity\"}");
            return mv;
        }
        try{
            Item item = DatabaseHandler.GetItemById(id);
            if(num>item.itemQuantity){
                throw new RuntimeException("Out Of Stock! You Entered Quantity more than stock. Remaining Stock is "+item.itemQuantity);
            }
            DatabaseHandler.ReduceStockInItem(id,num,(num==item.itemQuantity));
            mv.addObject("data","{\"status\":true}");
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
    //This function receive Post request to increase item quantity.
    @RequestMapping(method = RequestMethod.POST, value="/Add-Stock")
    public ModelAndView AddStockInItem(HttpSession session,@RequestParam("id") int id,@RequestParam("num") int num){
        if(session.getAttribute("userId")==null)
        {
            return new ModelAndView("index");
        }
        ModelAndView mv =new ModelAndView("handler");
        if(num<=0){
            mv.addObject("data","{\"status\":false,\"message\":\"Enter Positive Quantity\"}");
            return mv;
        }
        try{
            DatabaseHandler.AddStockInItem(id,num,false);
            mv.addObject("data","{\"status\":true}");
        }
        catch(Exception e){
            mv.addObject("data","{\"status\":false,\"message\":\""+e.getMessage()+"\"}");
        }
        return mv;
    }
}
