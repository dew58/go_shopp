import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Product {
  final num id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json,) {
    return Product(id: json["id"],
        title: json["title"],
        price: json["price"],
        description:json["description"],
        category: json["category"],
        image: json["image"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}

List<Product> getdata(String str) =>
    List<Product>.from(json.decode(str).map((x)=>Product.fromJson(x)));
