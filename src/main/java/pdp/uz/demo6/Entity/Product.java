package pdp.uz.demo6.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {
    private int id=genId++;
    private String name;
    private double price;
    private Integer categoryId;
    private String productImg;
    private static Integer genId=1;

    public Product(String name, double price, Integer categoryId, String productImg) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.productImg = productImg;
    }
}
