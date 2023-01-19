import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/bodyWidget/detail/view/chapterView.dart';
import 'package:zodiac/bodyWidget/home/control/homeControl.dart';
import 'package:zodiac/utils/img.dart';

class NewChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<HomeControl>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: control.newChapterList.length != 0
          ? Container(
              height: 225,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: control.newChapterList.length,
                itemBuilder: (_, i) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ChapterView(
                                  img: control.newChapterList[i].imgList)));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  width: 118,
                                  height: 168,
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
                                  child: ImgView(
                                      url:
                                       control.newChapterList[i].imgList.first)
                                          ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 118,
                                child: Text(
                                  control.newChapterList[i].manga.name,
                                  style: GoogleFonts.pangolin(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                width: 118,
                                child: Text(
                                  control.newChapterList[i].name,
                                  style: GoogleFonts.pangolin(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            )
          : Container(
              height: 225,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              width: 118,
                              height: 168,
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
                              child: Center(
                                child: SpinKitPulse(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 118,
                            child: Text(
                              "This is Title",
                              style: GoogleFonts.pangolin(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            width: 118,
                            child: Text(
                              "This is genre",
                              style: GoogleFonts.pangolin(color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
    );
  }
}
