package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.Order;
import pdp.uz.demo6.Entity.OrderItem;
import pdp.uz.demo6.Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;
import java.util.Date;
import java.util.Map;

import static java.time.LocalTime.now;

@WebServlet("/clearOrder")
public class ClearServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (CheckServlet.loggedUser==null) {
            resp.sendRedirect("login.jsp");
        }
        Order order = new Order();
        order.setDate(new Date());
        int id=0;
        for (Cookie cookie : req.getCookies()) {
         if (cookie.getName().equals("id")) {
             id = Integer.parseInt(cookie.getValue());
             System.out.println(id);
         }
        }
        order.setUserId(id);
        Map<Product, Integer> chosenProducts = CheckServlet.loggedUser.getChosenProducts();
        for (Map.Entry<Product, Integer> productIntegerEntry : chosenProducts.entrySet()) {
            Product product = productIntegerEntry.getKey();
            Integer quantity = productIntegerEntry.getValue();
            OrderItem orderItem = new OrderItem(order.getId(), product.getId(), quantity);
            Db.ORDER_ITEMS.add(orderItem);
        }
            Db.ORDERS.add(order);
        System.out.println(order.toString());
        if (!CheckServlet.loggedUser.getChosenProducts().isEmpty()){
        CheckServlet.loggedUser.getChosenProducts().clear();
        }
        resp.sendRedirect("/main.jsp");
    }
}
