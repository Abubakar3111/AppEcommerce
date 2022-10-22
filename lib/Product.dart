import 'package:flutter/material.dart';
class Product{
   int id,price;
   String title,description,image;
Product({required this.id,required this.price, required this.title,required this.description,required this.image});
}

List<Product> product=[
  Product(
    id:1,
    price :56,
    title:'handle',
    image:'images/1.jpg',
    description:"lorem",
  ),
  Product(
    id:1,
    price :6,
    title:'bag',
    image:'images/2.jpg',
    description:"lorem",
  ),
  Product(
    id:1,
    price :5,
    title:'shirt',
    image:'images/3.jpg',
    description:"lorem",
  ),
  Product(
  id:1,
  price :56,
  title:'bag',
    image:'images/4.jpg',
      description:"lorem",
  ),
  Product(
    id:1,
    price :76,
    title:'tble',
    image:'images/5.jpg',
    description:"lorem",
  ),
  Product(
    id:1,
    price :86,
    title:'car',
    image:'images/6.jpg',
    description:"lorem",
  )
  ,  Product(
    id:1,
    price :796,
    title:'bike',
    image:'images/7.jpg',
    description:"lorem",
  )
];