package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addCategory")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String name = req.getParameter("name");
        Category category=new Category(name);
        Db.CATEGORIES.add(category);
        resp.sendRedirect("/AdminPage.jsp");
    }
}
