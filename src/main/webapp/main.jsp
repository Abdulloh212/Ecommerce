<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="pdp.uz.demo6.Entity.Category" %>
<%@ page import="pdp.uz.demo6.Entity.Product" %>
<%@ page import="pdp.uz.demo6.Servlets.CheckServlet" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Files, java.nio.file.Paths, java.io.IOException" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
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
<%
    Map<Product, Integer> map = new HashMap<>();
    if (CheckServlet.loggedUser != null && CheckServlet.loggedUser.getChosenProducts() != null) {
        map = CheckServlet.loggedUser.getChosenProducts();
    }
%>
<div class="top-right-button">
    <form action="/savat.jsp">
        <button class="btn btn-success">Savat</button>
    </form>
    <br>
    <%
        if (CheckServlet.loggedUser == null) {
    %>
    <form action="/login.jsp">
        <button class="btn btn-success">Login</button>
    </form>
    <%
        }
    %>
    <br>
    <%
        if (CheckServlet.loggedUser != null) {
    %>
    <form action="/order.jsp">
        <button class="btn btn-success">Order</button>
    </form>
    <%
        }
    %>
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
                    for (Product product : Db.PRODUCTS) {
                        String imagePath = "/files/" + (product.getProductImg() != null ? product.getProductImg() : "default.jpg");
                %>
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <img src="<%= imagePath %>"
                             class="card-img-top"
                             alt="<%= product.getName() %>"
                             style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title text-success"><%= product.getName() %></h5>
                            <p class="card-text text-success">
                                Category:
                                <%
                                    Category category = Db.CATEGORIES.stream()
                                            .filter(cat -> cat.getId() == product.getCategoryId())
                                            .findFirst()
                                            .orElse(null);
                                %>
                                <%= category != null ? category.getName() : "Unknown" %>
                            </p>
                            <p class="card-text text-success">
                                Price: <%= product.getPrice() + " so'm" %>
                            </p>
                            <%
                                boolean isProductChosen = false;
                                if (map != null) {
                                    isProductChosen = map.containsKey(product);
                                }
                            %>
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
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>


