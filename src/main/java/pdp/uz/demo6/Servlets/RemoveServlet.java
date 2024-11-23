package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/remove")
public class RemoveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String i = req.getParameter("id");
            int id = Integer.parseInt(i);

            if (CheckServlet.loggedUser != null) {
                Map<Product, Integer> map = CheckServlet.loggedUser.getChosenProducts();

                if (map != null) {
                    Product productToRemove = null;
                    for (Map.Entry<Product, Integer> entry : map.entrySet()) {
                        if (entry.getKey().getId() == id) {
                            productToRemove = entry.getKey();
                            break;
                        }
                    }
                    if (productToRemove != null) {
                        map.remove(productToRemove);
                    }
                }
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
