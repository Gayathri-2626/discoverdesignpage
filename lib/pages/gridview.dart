import 'package:design/models/category.dart';
import 'package:design/pages/user.dart';
import 'package:flutter/material.dart';

class GayathriGridView extends StatelessWidget {
  List <User> list=[
    User("Music", "images/music.png"),
    User("Food","images/food.png"),
    User("Dance ", "images/singing.png"),
    User("Books","images/books.png"),
    User("MakeOver", "images/makeover.png"),
    User("Singing","images/singing.png"),
    User("Trending","images/trending.png"),
    User("Politics", "images/politics.png"),
    User("Videos ", "images/videos.png"),
    User("Psycology", "images/psycology.png"),
    User("Workout", "images/workouts.png"),
    User("Nature", "images/nature.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 12,
        itemBuilder: (context, index){
          return Card(
            elevation: 10,
            child: Center(
              child: Image.asset(list[index].dp),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
