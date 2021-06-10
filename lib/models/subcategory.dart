import 'package:design/models/category.dart';
import 'package:flutter/material.dart';

class SubCategory extends Category{
  SubCategory({
    String name,
    String icon,
    Color color,
    String imgName,
    String posts,
}): super(
    name: name,
    icon: icon,
    color: color,
    imgName: imgName,
    posts: posts,
  );
}