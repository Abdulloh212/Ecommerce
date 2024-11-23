package pdp.uz.demo6.Entity;

import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@lombok.Data
public class Order {
    private int id=genId++;
    private Date date;
    private Status status=Status.NEW;
    private Integer userId;
    private static Integer genId=1;
}
