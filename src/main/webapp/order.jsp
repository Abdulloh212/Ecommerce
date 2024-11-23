<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="pdp.uz.demo6.Entity.Order" %>
<%@ page import="pdp.uz.demo6.Servlets.CheckServlet" %><%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 22.11.2024
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Orders</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      color: #212529;
    }
    .container {
      margin-top: 50px;
    }
    .table-container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }
    .table th {
      background-color: #007bff;
      color: #fff;
      text-align: center;
    }
    .table td {
      text-align: center;
    }
    .page-title {
      font-size: 2rem;
      font-weight: bold;
      margin-bottom: 20px;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="table-container">
    <h1 class="page-title">Your Orders</h1>
    <table class="table table-hover">
      <thead class="thead-dark">
      <tr>
        <th>ID</th>
        <th>Status</th>
        <th>Date</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <%
        int userId = 0;
        if (request.getCookies() != null) {
          for (javax.servlet.http.Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("id")) {
              userId = Integer.parseInt(cookie.getValue());
            }
          }
        }
        System.out.println(userId);
        boolean hasOrders = false;
        for (Order order : Db.ORDERS) {
          if (order.getUserId() == userId) {
            hasOrders = true;
      %>
      <tr>
        <td><%= order.getId() %></td>
        <td><%= order.getStatus() %></td>
        <td><%= order.getDate() %></td>
        <td>
          <form action="/orderview.jsp">
            <input type="hidden" name="orderId" value="<%= order.getId() %>">
            <button class="btn btn-info btn-sm">View Details</button>
          </form>
        </td>
      </tr>
      <%
          }
        }
        if (!hasOrders) {
      %>
      <tr>
        <td colspan="4" class="text-center">No orders found.</td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
