package com.example.productmanager.service;

import com.example.productmanager.model.Product;

import java.util.List;

public interface IProductServive {
    List<Product> findAll();

    List<Product> searchByName(String keyword);
    Product findById(Integer id);
    void save(Product product);
    void deleteById(Integer id);

}
