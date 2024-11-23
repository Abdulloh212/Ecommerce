<%--
  Created by IntelliJ IDEA.
  User: mastu
  Date: 23.11.2024
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="pdp.uz.demo6.Entity.Order" %>
<%@ page import="pdp.uz.demo6.Db" %>
<%@ page import="pdp.uz.demo6.Entity.OrderItem" %>
<%@ page import="pdp.uz.demo6.Entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
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
        .total-container {
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <h1 class="page-title">Order Details</h1>
        <%
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order currentOrder = null;

            for (Order order : Db.ORDERS) {
                if (order.getId() == orderId) {
                    currentOrder = order;
                    break;
                }
            }

            if (currentOrder != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        %>
        <div>
            <p><strong>Order ID:</strong> <%= currentOrder.getId() %></p>
            <p><strong>Order Date:</strong> <%= sdf.format(currentOrder.getDate()) %></p>
            <p><strong>Status:</strong> <%= currentOrder.getStatus() %></p>
        </div>
        <table class="table table-hover">
            <thead class="thead-dark">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <%
                double totalAmount = 0.0;

                for (OrderItem orderItem : Db.ORDER_ITEMS) {
                    if (orderItem.getOrderId() == orderId) {
                        Product product = null;
                        for (Product p : Db.PRODUCTS) {
                            if (p.getId() == orderItem.getItemId()) {
                                product = p;
                                break;
                            }
                        }

                        if (product != null) {
                            int quantity = orderItem.getQuantity();
                            double itemTotal = product.getPrice() * quantity;
                            totalAmount += itemTotal;
            %>
            <tr>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %> so'm</td>
                <td><%= quantity %></td>
                <td><%= itemTotal %> so'm</td>
            </tr>
            <%
                        }
                    }
                }
            %>
            </tbody>
        </table>
        <div class="total-container">
            <p>Total Amount: <%= totalAmount %> so'm</p>
        </div>
        <%
        } else {
        %>
        <div class="alert alert-danger text-center">
            <p>Order not found.</p>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>

