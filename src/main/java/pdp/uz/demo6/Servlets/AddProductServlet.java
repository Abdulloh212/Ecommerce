package pdp.uz.demo6.Servlets;

import pdp.uz.demo6.Db;
import pdp.uz.demo6.Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
     protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
            Part filePart = request.getPart("productImage");
            if (filePart == null || filePart.getSize() == 0) {
                resp.getWriter().write("No file uploaded!");
                return;
            }


            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();


            String uploadDir = "C:\\Users\\mastu\\IdeaProjects\\demo6\\src\\main\\webapp\\files";
            File uploadDirectory = new File(uploadDir);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }

            File file = new File(uploadDirectory, fileName);
            try (InputStream inputStream = filePart.getInputStream()) {
                Files.copy(inputStream, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            String productName = request.getParameter("productName");
            Integer productPrice =Integer.parseInt(request.getParameter("productPrice"));
            Integer categoryId =Integer.parseInt(request.getParameter("categoryId"));

            Product newProduct = new Product(productName,productPrice,categoryId, "/"+fileName);

            Db.PRODUCTS.add(newProduct);

            resp.sendRedirect("/AdminPage.jsp");
        }
    }

