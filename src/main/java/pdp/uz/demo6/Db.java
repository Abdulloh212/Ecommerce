package pdp.uz.demo6;

import pdp.uz.demo6.Entity.*;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public interface Db {
    List<User> USERS = new ArrayList<>(List.of(
            new User("0","0",null,true),
            new User("1","1",null,false),
            new User("2","2",null,false)
    ));
    List<Category>CATEGORIES =new ArrayList<>(
            List.of(
                    new Category("Ovqat"),
                    new Category("Ichimliklar"),
                    new Category("Shirinliklar"),
                    new Category("Mevalar"),
                    new Category("Fast Food")
            )
    );
    List<Product>PRODUCTS =new ArrayList<>(
            List.of(
                    new Product("Osh", 20000, 1,"/osh.jpg"),
                    new Product("Manti", 15000, 1,"/manti.jpg"),
                    new Product("Pepsi", 5000, 2,"/pepsi.jpg"),
                    new Product("Fanta", 5000, 2,"/fanta.jpg"),
                    new Product("Chocolates", 8000, 3,"/shkolad.jpg"),
                    new Product("Ice Cream", 10000, 3,"/ice cream.jpg"),
                    new Product("Apples", 3000, 4,"/apple.jpg"),
                    new Product("Bananas", 2500, 4,"/banan.jpg"),
                    new Product("Hamburger", 12000, 5,"/ham.jpg"),
                    new Product("Pizza", 25000, 5,"/pizza.jpg")
            )
    );
    List<OrderItem>ORDER_ITEMS =new ArrayList<>();
    List<Order>ORDERS =new ArrayList<>();

}
