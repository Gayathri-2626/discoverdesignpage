 import 'package:design/models/category.dart';
import 'package:design/pages/detailspage.dart';
import 'package:design/widgets/categoryicon.dart';
import 'package:flutter/material.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category selectedCategory;
  SelectedCategoryPage({this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Explore',style: TextStyle(color: Colors.redAccent,fontSize: 28),),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Center(child: Text('Choose Category',style: TextStyle(color: Colors.pinkAccent,fontSize: 20,fontWeight: FontWeight.w600),),),
                SizedBox(height: 60,),
              ],
            ),

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(this.selectedCategory.subCategories.length,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          DetailsPage(subCategory: this.selectedCategory.subCategories[index],),
                          ));
                          },
                        child: Container(
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset('images/' + this.selectedCategory.subCategories[index].imgName + '.png',
                                  fit: BoxFit.cover, width: 90, height: 90,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(this.selectedCategory.subCategories[index].name,
                                style: TextStyle(color: this.selectedCategory.color),
                              )
                            ],
                          ),
                        ),
                      );
                    }),

              ),
            )
          ],
        ),
      )
    );
  }
}
