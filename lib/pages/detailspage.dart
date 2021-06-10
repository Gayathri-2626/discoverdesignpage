import 'dart:io';

import 'package:design/models/subcategory.dart';
import 'package:design/pages/gallery_open.dart';
import 'package:design/pages/gallery_widget.dart';
import 'package:design/pages/gridview.dart';
import 'package:design/pages/recent.dart';
import 'package:design/pages/selectedcategorypage.dart';
import 'package:design/pages/trending.dart';
import 'package:design/pages/videos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'gridview.dart' as gridview;
import 'listview.dart' as listview;

class DetailsPage extends StatelessWidget {
  SubCategory subCategory;
  DetailsPage({this.subCategory});
  TabController controller;

  File _image;
  Future getImage() async{
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.redAccent,
        flexibleSpace: Padding(
            padding:EdgeInsets.all(10),
            child:Column(
                children: [
                  SizedBox(height:20),
                  Text(this.subCategory.name,
                      style:
                      TextStyle(color:Colors.white, fontSize: 22,fontWeight: FontWeight.bold),),
                  Expanded(
                      child: Container(
                          alignment:Alignment.center,
                          child: Text(this.subCategory.posts,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13))))
                ])
        ),
      ),
       body: DefaultTabController(
         length: 2,
         child: Column(
           children: [
Container(
// decoration:  BoxDecoration(
//   gradient: LinearGradient(
//       colors: [
//         Colors.orangeAccent,
//         Colors.pinkAccent
//       ],
//       end: Alignment.bottomCenter,
//       begin: Alignment.topCenter),),
  child: TabBar(
controller: controller,
    indicatorColor: Colors.grey,
    labelColor: Colors.white,
    indicatorWeight: 2.0,
    unselectedLabelColor: Colors.white70,
    isScrollable: true,
    tabs: [
      Padding(padding: EdgeInsets.only(right: 60),
        child: Tab(icon: Icon(Icons.list,color: Colors.black,),),
      ),
      Padding(padding: EdgeInsets.only(right: 30,left: 60),
        child: Tab(icon: Icon(Icons.grid_view,color: Colors.black,),)
      ),
    ],
  ),
),
             Expanded(
                 child: Container(
                   child: TabBarView(
                     controller: controller,
                     children: [
                       new listview.GayathriListView(),
                       new gridview.GayathriGridView(),
                       ],
                   ),
                 )
             )
           ],
         ),
       ),

    floatingActionButton: Builder(
    builder: (BuildContext innerContext) => FloatingActionButton(
    child: IconButton(
    icon: Icon(Icons.add),
    onPressed: () {
    showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
    return Container(
    padding: EdgeInsets.all(30),
    height: 150,
    color: Colors.white,
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

    SizedBox(width: 30),
    Builder(

    builder: (BuildContext latestContext) =>
    IconButton(
    icon: Icon(Icons.camera_alt,
    color: Colors.pinkAccent, size: 40),
    onPressed: () {

    Scaffold.of(innerContext).showBottomSheet((context){
    return BottomSheet(
    builder: (c){
    return GalleryWidget();
    },
    onClosing: (){},
    );
    });

    },
    ),
    ),

    ],
    )
    ],
    ),
    ),
    );
    },
    );
    },
    )),
    ),





    // floatingActionButton: Builder(
    //   builder: (BuildContext innerContext) => FloatingActionButton(
    //     child: IconButton(
    //       icon: Icon(Icons.camera_alt),
    //       onPressed: () {
    //         Scaffold.of(context).showBottomSheet((context){
    //           return BottomSheet(
    //             builder: (c){
    //               return GalleryWidget();
    //             },
    //             onClosing: () {},
    //           );
    //         });
    //       },
    //     ),
    //   ),
    // ),


    //   floatingActionButton: FloatingActionButton(
    //     onPressed: getImage,
    //     tooltip: 'Increment',
    //     backgroundColor: Colors.white,
    //     child: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
    //   ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: Container(
      //     height: 50,
      //   ),
      //
      // ),


    );
  }
}
