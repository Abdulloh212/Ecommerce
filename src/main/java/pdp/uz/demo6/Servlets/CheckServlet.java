package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/check")
public class CheckServlet extends HttpServlet {
    public static User loggedUser = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Optional<User> first = Db.USERS.stream().filter(item -> item.getTel().equals(phone) && item.getPassword().equals(password)).findFirst();
        if (first.isPresent()) {
            loggedUser = first.get();
            Cookie userIdCookie = new Cookie("id", String.valueOf(loggedUser.getId()));
            resp.addCookie(userIdCookie);
            if (first.get().getIsAdmin()) {
                resp.sendRedirect("/AdminPage.jsp");
            } else {
                resp.sendRedirect("/main.jsp");
            }
        } else {
            resp.sendRedirect("/login.jsp");
        }
    }
}

