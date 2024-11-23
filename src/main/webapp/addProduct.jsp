<%@ page import="pdp.uz.demo6.Entity.Category" %>
<%@ page import="pdp.uz.demo6.Db" %><%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 20.11.2024
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD PRODUCT</title>
</head>
<body>
<form action="/addProduct" method="post" enctype="multipart/form-data">
    <input type="file" name="productImage" required/>
    <select name="categoryId">
        <% for (Category category : Db.CATEGORIES) { %>
        <option value="<%= category.getId() %>"><%= category.getName() %></option>
        <% } %>
    </select>
    <input type="text" name="productName" placeholder="Enter Product Name" />
    <input type="text" name="productPrice" placeholder="Enter Product Price" />
    <button type="submit">Upload</button>
</form>
</body>
</html>
