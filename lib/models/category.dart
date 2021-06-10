import 'dart:ui';

class Category{
  String name;
  String imgName;
  String icon;
  Color color;
 String posts;

  List<Category>subCategories;

  Category(
  {
    this.name,
    this.imgName,
    this.icon,
    this.color,
    this.posts,
    this.subCategories
  }
      );
}