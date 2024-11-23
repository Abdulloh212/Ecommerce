<%@ page import="java.util.Map" %>
<%@ page import="pdp.uz.demo6.Servlets.CheckServlet" %>
<%@ page import="pdp.uz.demo6.Entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="text-center mb-4">SIZNING SAVATINGIZ</h1>
    <div class="row">
        <%
            Integer total = 0;
            Map<Product, Integer> chosenProducts = CheckServlet.loggedUser.getChosenProducts();

            if (chosenProducts != null) {
                for (Map.Entry<Product, Integer> entry : chosenProducts.entrySet()) {
                    Product product = entry.getKey();
                    Integer quantity = entry.getValue();
                    total = (int) (product.getPrice() * quantity + total);
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p><strong>Product ID:</strong> <%= product.getId() %></p>
                    <p><strong>Price:</strong> <%= product.getPrice() %> so'm</p>
                    <p><strong>Quantity:</strong></p>
                    <form action="/minus"  class="d-inline">
                        <button type="submit" class="btn btn-danger btn-sm">-</button>
                        <input type="hidden" name="name" value="<%= product.getId() %>">
                    </form>
                    <%= quantity %>
                    <form action="/plus" class="d-inline">
                        <button type="submit" class="btn btn-success btn-sm">+</button>
                        <input type="hidden" name="name" value="<%= product.getId() %>">
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12">
            <div class="alert alert-info text-center" role="alert">
                No products available in your cart.
            </div>
        </div>
        <%
            }
        %>
    </div>
    <h3 class="text-center">Total: <%= total %> so'm</h3>
    <div class="text-center mt-4">
        <form action="/clearOrder" method="post">
            <button class="btn btn-success">Buyurtma berish</button>
        </form>
    </div>
</div>
</body>
</html>

