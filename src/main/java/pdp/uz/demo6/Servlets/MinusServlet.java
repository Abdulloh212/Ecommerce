package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/minus")
public class MinusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int productId = Integer.parseInt(name);

        if (CheckServlet.loggedUser != null) {
            Map<Product, Integer> map = CheckServlet.loggedUser.getChosenProducts();

            if (map != null) {
                for (Map.Entry<Product, Integer> entry : map.entrySet()) {
                    if (entry.getKey().getId() == productId) {
                        int updatedQuantity = entry.getValue() - 1;

                        if (updatedQuantity <= 0) {
                            map.remove(entry.getKey());
                        } else {
                            entry.setValue(updatedQuantity);
                        }
                        break;
                    }
                }


                CheckServlet.loggedUser.setChosenProducts(map);
                resp.sendRedirect("/savat.jsp");
                return;
            }
        } else {
            resp.sendRedirect("/login.jsp");
            return;
        }


        resp.sendRedirect("/main.jsp");
    }
}
