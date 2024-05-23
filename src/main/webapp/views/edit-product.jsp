<%--
  Created by IntelliJ IDEA.
  User: dinht
  Date: 5/22/2024
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="/ProductController?action=LIST">Quay lại</a>
<form action="/ProductController" method="post">
    <div class="mb-3">
        <label for="id" class="form-label">Product ID</label>
        <input type="text" class="form-control" id="id" value="${product.id}" name="id" readonly >
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Product Name</label>
        <input type="text" class="form-control" id="name" value="${product.name}" name="name">
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Product Price</label>
        <input type="text" class="form-control" id="price" value="${product.price}" name="price">
    </div>
    <div class="mb-3">
        <label for="image" class="form-label">Product Image</label>
        <input type="text" class="form-control" id="image" value="${product.image}" name="image">
    </div>
    <div class="mb-3">
        <label for="stock" class="form-label">Product Stock</label>
        <input type="text" class="form-control" id="stock" value="${product.stock}" name="stock">
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
    </div>
    <input type="submit" name="action" value="UPDATE" class="btn btn-primary"/>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
