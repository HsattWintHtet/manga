import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/bodyWidget/detail/view/detail.dart';
import 'package:zodiac/bodyWidget/home/control/homeControl.dart';
import 'package:zodiac/utils/utils.dart';

import '../../../utils/img.dart';

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<HomeControl>(context);
    return Wrap(
                direction: Axis.horizontal,
                children: control.recommendManga.length != 0 ? 
                control.recommendManga.map((e) =>Padding(
                    padding: const EdgeInsets.all(2),
                    child: InkWell(
                      onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Detail(manga:e,)));
                    },
                                          child: Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: 180,
                        child: Column(
                          children: [
                            Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [BoxShadow(blurRadius: 1.0,color: Colors.grey[600],spreadRadius: 0.5)],
                                  ),
        child: ImgView(url: e.cover.url),
                            ),
                            Container(
                              child: Text(
                                e.name,
                                style: GoogleFonts.pangolin(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width / 2.1,
                              child: Row(
                                children: e.genre
                                    .map((e) => Padding(
                                      padding: const EdgeInsets.only(right:5.0),
                                      child: Container(
                                        child: Text(
                                                "${e.name}",
                                                style: GoogleFonts.pangolin(
                                                    color: Colors.grey),
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                    
                                      ),
                                    ))
                                    .toList(),
                              ),
                           
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), ).toList()
                  :
                  [
                    Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: 180,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 130,
                             child: Center(
                                child: SpinKitPulse(
                                  color: Colors.blue,
                                ),
                              )
                            ),
                          ),
                          // Container(
                          //   child: Text(
                          //     "..........",
                          //     style: GoogleFonts.pangolin(),
                          //     overflow: TextOverflow.ellipsis,
                          //     maxLines: 1,
                          //   ),
                          // ),
                          // Container(
                          //   child: Text(
                          //     "This is genre",
                          //     style: GoogleFonts.pangolin(color: Colors.grey),
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: 180,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 130,
                              child: Center(
                                child: SpinKitPulse(
                                  color: Colors.blue,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                   padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: 180,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 130,
                              child: Center(
                                child: SpinKitPulse(
                                  color: Colors.blue,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: 180,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 130,
                              child: Center(
                                child: SpinKitPulse(
                                  color: Colors.blue,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ]
                  
                
              );
  }
}