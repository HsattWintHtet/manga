import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/Clip/clip.dart';
import 'package:zodiac/bodyWidget/detail/view/detail.dart';
import 'package:zodiac/bodyWidget/home/control/homeControl.dart';
import 'package:zodiac/utils/utils.dart';
import '../../search/search.dart';
import 'newChapter.dart';
import 'recommend.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _adUnitID = "ca-app-pub-8032453967263891/1069159658";

  final _nativeAdController = NativeAdmobController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<HomeControl>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ////////////////////// Carousel Start /////////////////////////
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Carousel(
                              onImageTap: (i) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Detail(
                                      
                                          manga: control.carouseldManga[i],
                                        )));
                              },
                              autoplay: true,
                              animationCurve: Curves.elasticInOut,
                              animationDuration: Duration(milliseconds: 1000),
                              showIndicator: false,
                              images: control.carouseldManga
                                  .map((i) => CachedNetworkImage(imageUrl: i.cover.url,fit:BoxFit.cover,),)
                                  .toList()
                                  ),
                        ),
                        //////////// This is Search Start ////////////
                        ///
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Search()));
                              },
                                                          child: Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(Icons.search, color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        ///
                        ///////////// This is Search End ////////////////
                      ],
                    ),
                  ),
                ),

                //////////////////////
                // SizedBox(
                //   height: 20,
                // ),
                // SizedBox(
                //   child: Container(
                //     height: 0.5,
                //     width: 250,
                //     color: Colors.grey[400],
                //   )
                // ),
                // Text("zodiac Manga",style: GoogleFonts.aBeeZee(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold,)),
                // SizedBox(
                //   child: Container(
                //     height: 0.5,
                //     width: 250,
                //     color: Colors.grey[400],
                //   )
                // ),
                ////////////////////////
////////////////////// Carousel End /////////////////////////

///////////////////////// Last chapter Start /////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 8.0, right: 8.0, bottom: 8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("New Chapter", style: GoogleFonts.ubuntu())),
                ),
                NewChapter(),
                ///////////////////////// Last chapter End /////////////////////////////////

                //////////// This is Ad Start ///////////////
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
                ///////////// This is Ad End ///////////////

                ///////////////// Recommanded Start ////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 8.0, right: 8.0, bottom: 8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Recommend", style: GoogleFonts.ubuntu())),
                ),
                Recommend(),
                ///////////////// Recommanded End ////////////////////////////////

                //////////// This is Ad Start ///////////////
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
                ///////////// This is Ad End ///////////////
              ],
            ),
          ),
        ),
      ),
    );
  }
}
