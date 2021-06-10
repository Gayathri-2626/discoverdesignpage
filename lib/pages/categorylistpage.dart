import 'package:design/helpers/utils.dart';
import 'package:design/models/category.dart';
import 'package:design/pages/selectedcategorypage.dart';
import 'package:design/widgets/categorycard.dart';
import 'package:design/widgets/categoryicon.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('selected list',style: TextStyle(color: Colors.black),),

                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext contex, int index){
                      return CategoryCard(
                          category: categories[index],
                        onCardClick: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedCategoryPage()
                            )
                            );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
