import 'package:flutter/material.dart';
import 'package:zodiac/Clip/genreClip/genreClip.dart';



class ClipWidget extends StatefulWidget {
  @override
  _ClipWidgetState createState() => _ClipWidgetState();
}

class _ClipWidgetState extends State<ClipWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Stack(
            children: [
           Positioned(
             left: MediaQuery.of(context).size.width*0.1,
                        child: Container(
              child: ClipPath(
                clipper: ThirdClipper(),
                child: Container(
                  color:Theme.of(context).brightness == Brightness.light ?Colors.blue[100].withOpacity(1.0) : Colors.blue[100].withOpacity(0.4),
                  
                   width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
                ),
              ),
          ),
           ),
                      Container(
            child: ClipPath(
              clipper: SecondClipper(),
              child: Container(

                color:Theme.of(context).brightness == Brightness.light ? Colors.blue[50].withOpacity(0.6) : Colors.blue[50].withOpacity(0.2),
                 width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
               Container(
              child: ClipPath(
                clipper: FirstClip(),
                child: Container(
                  color:Theme.of(context).brightness == Brightness.light ?  Colors.blue[50].withOpacity(0.6) :  Colors.blue[50].withOpacity(0.2),
                   width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height*0.87,
//                 left: MediaQuery.of(context).size.width*0.65,
//                               child: 
//                               Container(
//                   child: ClipPath(
// clipper: SmallCliper(),
// child: Container(
//   color: Colors.white10,
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height,
// ),
//                   ),
//                 ),
                            
//               ),
//                Positioned(
//                 top: MediaQuery.of(context).size.height*0.69,
//                 left: MediaQuery.of(context).size.width*0.2,
//                               child: 
//                               Container(
//                   child: ClipPath(
// clipper: MediumCliper(),
// child: Container(
//   color: Colors.white10,
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height,
// ),
//                   ),
//                 ),
                            
//               ),

// Positioned(
//                 top: MediaQuery.of(context).size.height*0.6,
//                 left: MediaQuery.of(context).size.width*0.0,
//                               child: 
//                               Container(
//                   child: ClipPath(
// clipper: LargeClipper(),
// child: Container(
//   color: Colors.white10,
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height,
// ),
//                   ),
//                 ),
                            
//               ),

            ],
          ),
        );
  }
}