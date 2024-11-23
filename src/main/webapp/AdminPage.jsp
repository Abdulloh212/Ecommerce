<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="pdp.uz.demo6.Entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 20.11.2024
  Time: 18:11
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
  <form action="/addCategory.jsp">
    <button class="btn btn-success">Add Category</button>
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
        </tr>
        </thead>
        <tbody>
        <%
          for (Category category : Db.CATEGORIES) {
        %>
        <tr>
          <td><%=category.getId()%></td>
          <td><%=category.getName()%></td>
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

