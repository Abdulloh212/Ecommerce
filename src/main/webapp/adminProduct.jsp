<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="pdp.uz.demo6.Entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 21.11.2024
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
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
    <form action="/addProduct.jsp">
        <button class="btn btn-success">Add Product</button>
    </form>
</div>
<div class="container mt-4">
    <div class="row">
        <div class="col-4 bg-primary text-white text-center p-3">
            <h1 class="text-white text-center my-3">Admin</h1>
            <a class="btn btn-dark" href="/AdminPage.jsp">Category</a>
            <a class="btn btn-dark" href="/adminProduct.jsp">Product</a>
        </div>

        <div class="col-8 bg-secondary text-white text-center p-3">
            <table class="table text-white">
                <thead>
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>price</th>
                    <th>categoryId</th>
                    <th>PhotoPath</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Product product : Db.PRODUCTS) {

                %>
                <tr>
                    <td><%=product.getId()%></td>
                    <td><%=product.getName()%></td>
                    <td><%=product.getPrice()%></td>
                    <td><%=product.getCategoryId()%></td>
                    <td><%=product.getProductImg()%></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
