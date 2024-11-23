package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String i = req.getParameter("id");
        try {
            int id = Integer.parseInt(i);


            Product p = null;
            for (Product product : Db.PRODUCTS) {
                if (product.getId() == id) {
                    p = product;
                    break;
                }
            }


            if (p == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }


            if (CheckServlet.loggedUser != null) {
                Map<Product, Integer> chosenProducts = CheckServlet.loggedUser.getChosenProducts();


                if (chosenProducts == null) {
                    chosenProducts = new HashMap<>();
                    CheckServlet.loggedUser.setChosenProducts(chosenProducts);
                }


                chosenProducts.put(p, 1);
            } else {

                resp.sendRedirect("/login.jsp");
                return;
            }


            resp.sendRedirect("/main.jsp");

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
        }
    }
}


