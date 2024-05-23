package com.example.productmanager.controller;

import com.example.productmanager.model.Product;
import com.example.productmanager.service.IProductServive;
import com.example.productmanager.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {

    private static final IProductServive productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "LIST":
                    List<Product> products = productService.findAll();
                    request.setAttribute("products", products);
                    request.getRequestDispatcher("/views/list-product.jsp").forward(request, response);
                    break;
                case "DELETE":
                    Integer idDelete = Integer.valueOf(request.getParameter("id"));
                    productService.deleteById(idDelete);
                    response.sendRedirect("/ProductController?action=LIST");
                    break;
                case "ADD":
                    request.getRequestDispatcher("/views/add-product.jsp").forward(request, response);
                    break;
                case "UPDATE":
                    Integer idUpdate = Integer.valueOf(request.getParameter("id"));
                    Product product = productService.findById(idUpdate);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/views/edit-product.jsp").forward(request, response);
                    break;
                case "SEARCH":
                    String keyword = request.getParameter("keyword");
                    List<Product> productList = productService.searchByName(keyword);
                    request.setAttribute("products", productList);
                    request.setAttribute("keyword", keyword);
                    request.getRequestDispatcher("/views/list-product.jsp").forward(request, response);
                    break;

            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "ADD":
                    Product product = createProduct(request);
                    productService.save(product);
                    response.sendRedirect("/ProductController?action=LIST");
                    break;
                case "UPDATE":
                    Integer idUpdate = Integer.valueOf(request.getParameter("id"));
                    Product productUpdate = createProduct(request);
                    productUpdate.setId(idUpdate);
                    productService.save(productUpdate);
                    response.sendRedirect("/ProductController?action=LIST");
                    break;
                case "SEARCH":
                    String keyword = request.getParameter("keyword");
                    List<Product> productList = productService.searchByName(keyword);
                    request.setAttribute("products", productList);
                    request.setAttribute("keyword", keyword);
                    request.getRequestDispatcher("/views/list-product.jsp").forward(request, response);
                    break;
            }
        }

    }

    private Product createProduct(HttpServletRequest request) {
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        Integer stock = Integer.valueOf(request.getParameter("stock"));
        return new Product(null, name, price, description, image, stock);
    }
}