<%--
  Created by IntelliJ IDEA.
  User: abdulloh
  Date: 16.11.2024
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="row">
    <div class="col-4 offset-4 mt-4">
        <div class="card">
            <div class="card-header background">
                <h1>LOGIN</h1>
            </div>
            <div class="card-body">
                <form action="/check" method="post">
                    <input name="phone" type="text" placeholder="Phone" class="form-control my-">
                    <input name="password" type="text" placeholder="Password" class="form-control my-">
                    <br>
                    <button class="btn btn-dark " style="float: right">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</div>



</body>
</html>
