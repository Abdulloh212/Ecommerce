<%@ page import="pdp.uz.demo6.Entity.Category" %>
<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="static java.util.Objects.toString" %>
<%@ page import="pdp.uz.demo6.Entity.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="pdp.uz.demo6.Servlets.CheckServlet" %><%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 18.11.2024
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Products</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .top-right-button {
            position: fixed;
            top: 0;
            right: 0;
            margin: 10px;
        }
    </style>
</head>
<body>
<div class="top-right-button">
    <form action="/savat.jsp">
        <button class="btn btn-success">Savat</button>
    </form>
    <br>
  <form action="/main.jsp">
        <button class="btn btn-success">Back</button>
    </form>
</div>

<div class="container mt-4">
    <div class="row">
        <div class="col-4 bg-primary text-white text-center p-3">
            <h1 class="text-white text-center my-3">Categories</h1>
            <ul class="list-group">
                <%
                    for (Category category : Db.CATEGORIES) {
                %>
                <li class="list-group-item">
                    <form action="/category.jsp" method="get">
                        <input type="hidden" name="id" value="<%= category.getId() %>">
                        <button class="btn btn-link text-dark"><%= category.getName() %></button>
                    </form>
                </li>
                <%
                    }
                %>
            </ul>
        </div>

        <div class="col-8 bg-secondary text-white p-3">
            <div class="row">
                <%
                    String categoryIdParam = request.getParameter("id");
                    int categoryId = -1;

                    if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                        try {
                            categoryId = Integer.parseInt(categoryIdParam);
                        } catch (NumberFormatException e) {
                            System.out.println("<p class='text-danger'>Invalid category ID!</p>");
                        }
                    }

                    if (categoryId == -1) {
                        System.out.println("<p class='text-warning'>Please select a category to view products.</p>");
                    } else {
                        for (Product product : Db.PRODUCTS) {
                            if (product.getCategoryId() == categoryId) {
                                Category category = Db.CATEGORIES.stream()
                                        .filter(cat -> cat.getId() == product.getCategoryId())
                                        .findFirst()
                                        .orElse(null);

                                String imagePath = application.getRealPath("/files/" + (product.getProductImg() != null ? product.getProductImg() : "default.jpg"));
                                String imageSrc = "";
                                java.nio.file.Path path = java.nio.file.Paths.get(imagePath);

                                try {
                                    byte[] fileBytes = java.nio.file.Files.readAllBytes(path);
                                    imageSrc = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(fileBytes);
                                } catch (java.io.IOException e) {
                                    e.printStackTrace();
                                    imageSrc = "data:image/jpeg;base64,";
                                }

                                boolean isProductChosen = false;
                                if (CheckServlet.loggedUser != null && CheckServlet.loggedUser.getChosenProducts() != null) {
                                    isProductChosen = CheckServlet.loggedUser.getChosenProducts().containsKey(product);
                                }
                %>
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <img src="<%= imageSrc %>" class="card-img-top" alt="Product Image" style="height: 200px; object-fit: cover;">

                        <div class="card-body">
                            <h5 class="card-title text-success"><%= product.getName() %></h5>
                            <p class="card-text text-success">Category: <%= category != null ? category.getName() : "Unknown" %></p>
                            <p class="card-text text-success">Price: <%= product.getPrice() %> so'm</p>
                            <form action="<%= isProductChosen ? "/remove" : "/add" %>" method="post">
                                <input type="hidden" name="id" value="<%= product.getId() %>">
                                <button class="btn <%= isProductChosen ? "btn-danger" : "btn-success" %>">
                                    <%= isProductChosen ? "Remove" : "Add" %>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>

