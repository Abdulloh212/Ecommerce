package pdp.uz.demo6.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private int id=genId++;
    private String tel;
    private String password;
    private Map<Product,Integer> chosenProducts;
    private Boolean isAdmin;
    private static Integer genId =1;

    public User(String tel, String password, Map<Product, Integer> chosenProducts, Boolean isAdmin) {
        this.tel = tel;
        this.password = password;
        this.chosenProducts = chosenProducts;
        this.isAdmin = isAdmin;
    }
}
