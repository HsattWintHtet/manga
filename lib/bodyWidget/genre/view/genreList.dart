import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/bodyWidget/detail/view/detail.dart';
import 'package:zodiac/bodyWidget/genre/control/genreControl.dart';
import 'package:zodiac/model/model.dart';
import 'package:zodiac/utils/utils.dart';

import '../../../utils/img.dart';

class GenreList extends StatefulWidget {
  final Genre genre;


  const GenreList({Key key, this.genre}) : super(key: key);
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  GenreControl genreControl = GenreControl();
  List<MangaModel> customList = List<MangaModel>();
  @override
  void initState() {
    if (genreControl.allmangaList[widget.genre.genreIndex].length == 0) {
      genreControl
          .getGenreList(widget.genre.objectId, widget.genre.genreIndex)
          .then((f) {
        setState(() {
          genreControl.allmangaList[widget.genre.genreIndex]
              .map((e) => customList.add(e))
              .toList();
        });
      });
    } else {
      setState(() {
        genreControl.allmangaList[widget.genre.genreIndex]
            .map((e) => customList.add(e))
            .toList();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<GenreControl>(context);
    return Container(
      child: control.allmangaList[widget.genre.genreIndex].length != 0
          ? ListView.builder(
              itemCount: control.allmangaList[widget.genre.genreIndex].length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Detail(manga: control.allmangaList[widget.genre.genreIndex][i])));
                    },
                                      child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.grey[600],
                                      spreadRadius: 0.5)
                                ],
                               ),
                                  
                                     child: ImgView(url: control
                                        .allmangaList[widget.genre.genreIndex][i]
                                        .img
                                        .url),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      control
                                          .allmangaList[widget.genre.genreIndex]
                                              [i]
                                          .name,
                                      style: GoogleFonts.publicSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                customList.length != 0
                                    ? Row(
                                        children: customList[i]
                                            .genre
                                            .map((e) => genreText(e.name))
                                            .toList(),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 5,
                                ),
                                 customList.length != 0 ?Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.list),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(customList[i].status,
                                            style: GoogleFonts.publicSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ))  : Container(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
          : Container(
              child: Center(
                child: SpinKitFadingCircle(color: Colors.blue,),
              ),
            ),
    );
  }

  Widget genreText(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(text,
              style: GoogleFonts.publicSans(
                  fontSize: 15, fontWeight: FontWeight.w500,color: Colors.grey[600])),
        ),
      ),
    );
  }
}
