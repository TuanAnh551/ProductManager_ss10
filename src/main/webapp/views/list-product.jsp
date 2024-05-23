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
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<h1>Danh sách sản phẩm</h1>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">


            <form class="d-flex" role="search" action="/ProductController">
                <input class="form-control me-2" type="search" value="${keyword}" placeholder="Search" name="keyword" aria-label="Search">
                <input class="btn btn-outline-success"  type="submit" name="action" value="SEARCH">
            </form>
        </div>
    </div>
</nav>
<a href="/ProductController?action=ADD">Thêm mới sản phẩm</a>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Image</th>
        <th scope="col">Price</th>
        <th scope="col">Stock</th>
        <th scope="col">Description</th>
        <th scope="col" colspan="2">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product" varStatus="loop">
    <tr>
        <th scope="row">${loop.count}</th>
        <td>${product.name}</td>
        <td><img src="${product.image}" alt="" width="100px" height="150px" style="object-fit: cover"></td>
        <td>${product.price}</td>
        <td>${product.stock}</td>
        <td>${product.description}</td>
        <td><a href="/ProductController?action=UPDATE&id=${product.id}" class="btn btn-warning">UPDATE</a></td>
        <td><a href="/ProductController?action=DELETE&id=${product.id}" class="btn btn-danger " onclick="return confirm('Are you sure to delete this item')">DELETE</a></td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
