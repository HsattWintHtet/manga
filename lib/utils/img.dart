import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zodiac/utils/utils.dart';
class ImgView extends StatelessWidget {
  final String url;

  const ImgView({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                                      borderRadius:BorderRadius.circular(5) ,
                                    
                                      child:Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: CachedNetworkImage(imageUrl:url,fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(child: SpinKitRipple(color: Colors.blue[900],)),
        errorWidget: (context, url, error) => Center(child: Icon(FontAwesome5Solid.sad_tear)),
        ),
                                      ) ,
                                    );
  }
}