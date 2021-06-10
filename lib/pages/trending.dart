import 'package:design/models/subcategory.dart';
import 'package:design/pages/selectedcategorypage.dart';
import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  SubCategory subCategory;
  Trending({this.subCategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(this.subCategory.name),),
    );
  }
}
