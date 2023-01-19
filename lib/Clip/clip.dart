import 'package:flutter/material.dart';

class LargeClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 350;
    final double _yScaling = size.height / 812;
    path.lineTo(0.5 * _xScaling,136.5 * _yScaling);
    path.cubicTo(0.5 * _xScaling,136.5 * _yScaling,0 * _xScaling,337 * _yScaling,0 * _xScaling,337 * _yScaling,);
    path.cubicTo(0 * _xScaling,337 * _yScaling,360 * _xScaling,337 * _yScaling,360 * _xScaling,337 * _yScaling,);
    path.cubicTo(360 * _xScaling,337 * _yScaling,360 * _xScaling,41 * _yScaling,360 * _xScaling,41 * _yScaling,);
    path.cubicTo(310.176 * _xScaling,40.3993 * _yScaling,282.043 * _xScaling,36.0462 * _yScaling,231.5 * _xScaling,21 * _yScaling,);
    path.cubicTo(134.81 * _xScaling,-25.1408 * _yScaling,75.7815 * _xScaling,12.896 * _yScaling,43 * _xScaling,78 * _yScaling,);
    path.cubicTo(10.2185 * _xScaling,143.104 * _yScaling,2.70363 * _xScaling,126.116 * _yScaling,0.5 * _xScaling,136.5 * _yScaling,);
    path.cubicTo(0.5 * _xScaling,136.5 * _yScaling,0.5 * _xScaling,136.5 * _yScaling,0.5 * _xScaling,136.5 * _yScaling,);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class MediumCliper extends CustomClipper<Path> {

 @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(1 * _xScaling,266 * _yScaling);
    path.cubicTo(1 * _xScaling,266 * _yScaling,322 * _xScaling,266 * _yScaling,322 * _xScaling,266 * _yScaling,);
    path.cubicTo(322 * _xScaling,266 * _yScaling,322 * _xScaling,1 * _yScaling,322 * _xScaling,1 * _yScaling,);
    path.cubicTo(255.145 * _xScaling,37.1276 * _yScaling,213.918 * _xScaling,48.3306 * _yScaling,135.5 * _xScaling,56.5 * _yScaling,);
    path.cubicTo(71.1122 * _xScaling,69.1932 * _yScaling,44.9877 * _xScaling,87.5237 * _yScaling,32 * _xScaling,158 * _yScaling,);
    path.cubicTo(28.911 * _xScaling,205.643 * _yScaling,23.3853 * _xScaling,230.055 * _yScaling,1 * _xScaling,266 * _yScaling,);
    path.cubicTo(1 * _xScaling,266 * _yScaling,1 * _xScaling,266 * _yScaling,1 * _xScaling,266 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class SmallCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(1 * _xScaling,106 * _yScaling);
    path.cubicTo(1 * _xScaling,106 * _yScaling,135 * _xScaling,106 * _yScaling,135 * _xScaling,106 * _yScaling,);
    path.cubicTo(135 * _xScaling,106 * _yScaling,135 * _xScaling,1.5 * _yScaling,135 * _xScaling,1.5 * _yScaling,);
    path.cubicTo(102.028 * _xScaling,26.5935 * _yScaling,82.955 * _xScaling,38.8885 * _yScaling,48.5 * _xScaling,59.5 * _yScaling,);
    path.cubicTo(30.6905 * _xScaling,70.6826 * _yScaling,20.3924 * _xScaling,79.9023 * _yScaling,1 * _xScaling,106 * _yScaling,);
    path.cubicTo(1 * _xScaling,106 * _yScaling,1 * _xScaling,106 * _yScaling,1 * _xScaling,106 * _yScaling,);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(0, size.height * .75);
    path.lineTo(0, size.height * 0.95);

    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.elliptical(40,0.5),

    //  radius: Radius.elliptical(5, 0.5),

    );
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
