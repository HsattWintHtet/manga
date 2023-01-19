import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
class ChapterView extends StatefulWidget {
  final List<String> img;

  const ChapterView({Key key, this.img}) : super(key: key);
  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  void initState() {
    super.initState();
     FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-8032453967263891~5445897679')
        .then((response) {
     RewardedVideoAd.instance..load(adUnitId:"ca-app-pub-8032453967263891/5827674074")..show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
     ListView.builder(itemCount: widget.img.length,itemBuilder:(_,i){
          return
     Container(
            child:  CachedNetworkImage(
       imageUrl:widget.img[i],
        placeholder: (context, url) => Container(
          height: 500,
          child: Center(child: SpinKitPulse(color:Colors.blue)),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
     )
          );
        } 
    ),

      ),
    );
  }
}