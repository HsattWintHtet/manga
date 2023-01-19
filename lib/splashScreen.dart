import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zodiac/bodyWidget/genre/control/genreControl.dart';
import 'package:zodiac/bodyWidget/home/control/homeControl.dart';
import 'package:zodiac/utils/starwidget.dart';
import 'bodyWidget/favorite/control/favoriteControl.dart';
import 'navigaton.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool check;
  HomeControl homeControl = HomeControl();
  GenreControl genreControl = GenreControl();
  FavoriteControl favoriteControl = FavoriteControl();
  @override
  void initState() {
    homeControl.getInitial().then((f){
      genreControl.getGenre();
      favoriteControl.getFavorite();
    });
    super.initState();
    Timer(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Navigation(),
        ));

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.indigo[700],
              Colors.indigo[800],
              Colors.indigo[900],
              Color(0xFF152546),
            ])),
        child: Stack(
          children: [
            StarWidget(),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.2,
              child: Text("Zodiac Book",
                  style: GoogleFonts.pacifico(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 40)),
            ),
            FlareActor("assets/flare/flow.flr",
                alignment: Alignment.center,
                // fit: BoxFit.contain,
                fit: BoxFit.cover,
                animation: "Untitled")
          ],
        ),
      ),
    );
  }
}
