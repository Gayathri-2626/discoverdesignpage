import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  List<Album> allAlbums;

  List<Album> imageAlbums;
  List<Album> videoAlbums;
  List<Medium> medium = List();


  String selectedId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  initVV() async {
    bool allowed = await Permission.storage.isGranted;
    if(allowed)
      initAlbums();
    else {
      allowed =( await Permission.storage.request()).isGranted;
      if(allowed)
        initAlbums();
    }
  }
  List<Medium> selected = List();

  initAlbums() async {
    allAlbums = List();
    //medium.clear();
    imageAlbums = await PhotoGallery.listAlbums(
      mediumType: MediumType.image,
    );
    videoAlbums = await PhotoGallery.listAlbums(
      mediumType: MediumType.video,
    );

    allAlbums.addAll(imageAlbums);
    // allAlbums.addAll(videoAlbums);

    selectedId = allAlbums.first.id;

//image
    for (var i = 0; i < imageAlbums.length; i++) {
      final element = imageAlbums[i];

      print(imageAlbums);

      final MediaPage page = await element.listMedia();
      setState(() {
        medium.addAll(page.items);
      });
    }
//video
    for (var i = 0; i < videoAlbums.length; i++) {
      final element = videoAlbums[i];
      final MediaPage page = await element.listMedia();
      setState(() {
        medium.addAll(page.items);
      });
    }

    /// CamArea.state.setMedium(medium[0]);
  }
  albumChanged(){
    allAlbums.forEach((element) async {
      if(element.id == selectedId){
        medium.clear();
        final MediaPage page = await element.listMedia();
        setState(() {
          medium.addAll(page.items);
        });
      }
    });
  }

  ScrollController horizontal =
      ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
      @override
      Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
          ),
          height: MediaQuery.of(context).size.height*15,
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 16,),
                      Text(
                        'Gallery',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      new DropdownButton<String>(
                        items: allAlbums.map((Album value) {
                          return new DropdownMenuItem<String>(
                            value: value.id,
                              child: new Text(value.name)
                          );
                        }).toList(),
                        onChanged: (album){
                          setState(() {
                            selectedId = album;
                          });
                          albumChanged();
                        },
                        value: selectedId,
                      )
                    ],
                  ),
                  SizedBox(height: 8,),

                  Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                      itemCount: medium.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 4,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                        itemBuilder: (c, i){
                          final media = medium[i];
                          final s = selected.contains(media);
                          return GalleryItem(media, s, selected.length != 0,(){
                            if(s){
                              setState(() {
                                selected.remove(media);
                              });
                            } else{
                              if(selected.length < 10){
                                setState(() {
                                  selected.add(media);
                                });
                                horizontal.animateTo(
                                  horizontal.position.maxScrollExtent * 1.5,
                                 duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              }
                            }
                          },selected.indexOf(media) + 1);
                        },
                      ) ,
                  )
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  color: Colors.black38,
                  duration: Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width,
                  height: selected.length > 0 ? 70.0 : 0.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: medium.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 4,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2),
                          itemBuilder: (c, i) {
                            final media = medium[i];
                            final s = selected.contains(media);
                            return GalleryItem(media, s, selected.length != 0, () {
                              if (s) {
                                setState(() {
                                  selected.remove(media);
                                });
                              } else {
                                if (selected.length < 10) {
                                  setState(() {
                                    selected.add(media);
                                  });
                                  horizontal.animateTo(
                                      horizontal.position.maxScrollExtent * 1.5,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                }
                              }
                            }, selected.indexOf(media) + 1);
                          },
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 12, 16, 12),
                          child: Transform.translate(
                              offset: Offset(4, 1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Next', style: TextStyle(color: Colors.black,fontSize: 16),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,color: Colors.black,
                                ),
                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
        class GalleryItem extends StatelessWidget {
        final bool selected;
        final Medium media;
        final bool showSelection;
        final selectionIndex;
        final action;
        GalleryItem(this.media, this.selected, this.showSelection, this.action,
        this.selectionIndex);
        @override
        Widget build(BuildContext context) {
        return GestureDetector(
        child: Stack(
        children: [
        Container(
        child: FadeInImage(
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.cover,
        placeholder: AssetImage(''),
        image: ThumbnailProvider(
        mediumId: media.id,
        mediumType: media.mediumType,
        //width: (MediaQuery.of(context).size.width * 0.5).toInt(),
        //height: (MediaQuery.of(context).size.width * 0.5).toInt(),
        highQuality: true
        //hightQuality: true,
        ),
        ),
        ),
        AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: selected ? 1 : 0,
        child: Container(
        color: Colors.black12,
        ),
        ),
        // if(media.mediumType == MediumType.video)
        //   Align(
        //     alignment: Alignment.bottomRight,
        //     child: Text('0.0'),
        //   ),
        AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: showSelection ? 1 : 0,
        child: Align(
        alignment: Alignment.topRight,
        child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white24,
        //boxShadow: iconShadow,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2)),
        child: selected
        ? Text(
        selectionIndex.toString(),
        style: TextStyle(color: Colors.white, fontSize: 18),
        )
            : Container(),
        ),
        ),
        )
        ],
        ),
        onTap: action,
        );
        }
        }


