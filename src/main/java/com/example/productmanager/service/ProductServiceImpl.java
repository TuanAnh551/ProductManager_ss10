package com.example.productmanager.service;

import com.example.productmanager.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductServiceImpl implements IProductServive {

    private static final List<Product> products = new ArrayList<>();
    static {
        Product product1 = new Product(1, "Mèo Ragdoll", 1000.0, "Audult", "https://chophukienpet.com/wp-content/uploads/2023/05/giong-meo-ragdoll.jpg", 10);
        Product product2 = new Product(2, "Mèo Munchkin", 2000.0, "Kitten", "https://cdn.tgdd.vn/Files/2021/04/23/1345766/meo-munchkin-chan-ngan-nguon-goc-dac-diem-gia-ban-202112281020534492.png", 20);
        Product product3 = new Product(3, "Mèo Scottish Fold", 3000.0, "Kitten", "https://sieupet.com/sites/default/files/giong_meo_tai_cup.jpg", 30);
        products.add(product1);
        products.add(product2);
        products.add(product3);
    }
    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public List<Product> searchByName(String keyword) {
        return products.stream()
                .filter(product -> product.getName().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }

    @Override
    public Product findById(Integer id) {
        return products.stream()
                .filter(product -> product.getId()
                        .equals(id)).findFirst()
                .orElse(null);
    }

    @Override
    public void save(Product product) {
        if (product.getId() == null) {
            product.setId(getNewId()); // id tu tang
            products.add(product);
        } else {
            products.set(products.indexOf(findById(product.getId())), product);
        }
    }

    @Override
    public void deleteById(Integer id) {
        products.remove(findById(id));
    }

    //phương thức tu tang id
    private Integer getNewId() {
        return products.stream()
                .map(Product::getId)
                .max(Integer::compareTo)
                .orElse(0) + 1;
    }
}
