import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/Clip/clipwidget.dart';
import 'package:zodiac/ads/ads_provider.dart';
import 'package:zodiac/bodyWidget/detail/view/detail.dart';
import 'package:zodiac/bodyWidget/favorite/control/favoriteControl.dart';
import 'package:zodiac/utils/utils.dart';


class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  AdsProvider adsProvider = AdsProvider();
  BannerAd _bannerAd;
@override
  void initState() {
    super.initState();
      _bannerAd = adsProvider.createBannerAdUnitId();
            FirebaseAdMob.instance.initialize(appId: adsProvider.getAppId()).then((response){
_bannerAd..load()..show(anchorType: AnchorType.bottom,
anchorOffset: 50.0,

);
    });
  }

@override
  void dispose() {
    super.dispose();
   _bannerAd?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<FavoriteControl>(context);
    return SafeArea(
          child: Scaffold(

      body: Container(
            color: Theme.of(context).brightness == Brightness.dark ? Color(0xff121212) : Color(0xFFFFFFFF),
            child: Stack(
              children: [
                 ClipWidget(),

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
      height: 50,
  
      width: MediaQuery.of(context).size.width,
  
      child:Text("Favorite",style: Theme.of(context).textTheme.headline1,),
  
  ),
),
         Padding(
             padding: const EdgeInsets.only(top:50),
             child: Container(
                child: control.favoriteList.isNotEmpty ? 
                Container(
                  child: GridView.builder(
                    itemCount: control.favoriteList.length ,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 1.0,crossAxisSpacing: 1.0,childAspectRatio: 0.7),
                   itemBuilder: (_,i)=>Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: InkWell(
                       onTap: (){
                         _bannerAd?.dispose();
                         _bannerAd = null;
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Detail(manga: control.favoriteList[i])));
                          },
                                      child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: [BoxShadow(blurRadius: 1.0,color: Colors.grey[600],spreadRadius: 0.5)],
                                              image:  DecorationImage(
                                                fit: BoxFit.cover,
                                                scale: 1.0,
                                                image: CachedNetworkImageProvider(control.favoriteList[i].img.url)
                                              )
                                              ),
                                              ),
                     ),
                   ),),
                )
                 : Container(
                   child: Center(
                     child: Container(
                       margin: EdgeInsets.only(left:70),
                       child: Image.asset("assets/image/levi.png",fit: BoxFit.cover,)),
                   ),
                 ),
              ),
         ),
                 
         
              ],
            ),
          ),
      ),
    );
  }
}
