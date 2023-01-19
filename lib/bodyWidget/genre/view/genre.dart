import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/Clip/clipwidget.dart';
import 'package:zodiac/bodyWidget/genre/control/genreControl.dart';
import 'genreList.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {

  static const _adUnitID = "ca-app-pub-8032453967263891/1069159658";

  final _nativeAdController = NativeAdmobController();


  @override
  Widget build(BuildContext context) {
    final control = Provider.of<GenreControl>(context);
    return SafeArea(
      child: Container(
        // color: Colors.white,
        child: Stack(
          children: [
            ClipWidget(),
            DefaultTabController(
              length: control.genreList.length,
              initialIndex: 0,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("GENRE",
                                  style: GoogleFonts.publicSans(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        indicator: new BubbleTabIndicator(
                          indicatorHeight: 25.0,
                          indicatorColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white38
                                  : Colors.blueAccent,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        ),
                        isScrollable: true,
                        unselectedLabelColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black54,
                        labelStyle: GoogleFonts.publicSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        physics: AlwaysScrollableScrollPhysics(),
                        labelColor: Colors.white,
                        tabs: control.genreList
                            .map((e) => Tab(text: e.name))
                            .toList(),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: control.genreList.isNotEmpty
                          ? TabBarView(
                              children: control.genreList
                                  .map((e) => GenreList(genre: e))
                                  .toList())
                          : Container(),
                    )),
Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 60,
                      child: NativeAdmob(
                // Your ad unit id
                adUnitID: _adUnitID,
                numberAds: 3,
                controller: _nativeAdController,
                type: NativeAdmobType.banner,
              )
                      ),
                ),
                  ],
                ),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
