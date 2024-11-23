package pdp.uz.demo6.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderItem {
    private int id=genId++;
    private int orderId;
    private int itemId;
    private int quantity;
    private static Integer genId=1;

    public OrderItem(int orderId, int itemId, int quantity) {
        this.orderId = orderId;
        this.itemId = itemId;
        this.quantity = quantity;
    }
}
