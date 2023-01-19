import 'package:flutter/cupertino.dart';

class FirstClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 350;
    final double _yScaling = size.height / 700;
    path.lineTo(0.5 * _xScaling,64.5 * _yScaling);
    path.cubicTo(62.1528 * _xScaling,80.2595 * _yScaling,95.6312 * _xScaling,92.5883 * _yScaling,153.5 * _xScaling,120.5 * _yScaling,);
    path.cubicTo(207.081 * _xScaling,139.79 * _yScaling,230.742 * _xScaling,137.627 * _yScaling,262 * _xScaling,111.5 * _yScaling,);
    path.cubicTo(287.219 * _xScaling,85.1989 * _yScaling,307 * _xScaling,61.5 * _yScaling,322 * _xScaling,48 * _yScaling,);
    path.cubicTo(337 * _xScaling,34.5 * _yScaling,344.77 * _xScaling,29.1223 * _yScaling,360 * _xScaling,24 * _yScaling,);
    path.cubicTo(360 * _xScaling,24 * _yScaling,360 * _xScaling,-0.5 * _yScaling,360 * _xScaling,-0.5 * _yScaling,);
    path.cubicTo(360 * _xScaling,-0.5 * _yScaling,0.5 * _xScaling,-0.5 * _yScaling,0.5 * _xScaling,-0.5 * _yScaling,);
    path.cubicTo(0.5 * _xScaling,-0.5 * _yScaling,0.5 * _xScaling,64.5 * _yScaling,0.5 * _xScaling,64.5 * _yScaling,);
    path.cubicTo(0.5 * _xScaling,64.5 * _yScaling,0.5 * _xScaling,64.5 * _yScaling,0.5 * _xScaling,64.5 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class SecondClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 350;
    final double _yScaling = size.height / 600;
    path.lineTo(0 * _xScaling,0 * _yScaling);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,33.2452 * _yScaling,0 * _xScaling,33.2452 * _yScaling,);
    path.cubicTo(13.0404 * _xScaling,43.0955 * _yScaling,19.938 * _xScaling,48.9529 * _yScaling,31.5 * _xScaling,60 * _yScaling,);
    path.cubicTo(51.6305 * _xScaling,79.4945 * _yScaling,61.8674 * _xScaling,90.9639 * _yScaling,79 * _xScaling,112 * _yScaling,);
    path.cubicTo(101.273 * _xScaling,135.461 * _yScaling,115.016 * _xScaling,146.271 * _yScaling,142.5 * _xScaling,160 * _yScaling,);
    path.cubicTo(157.922 * _xScaling,165.919 * _yScaling,166.889 * _xScaling,167.077 * _yScaling,183.5 * _xScaling,165 * _yScaling,);
    path.cubicTo(204.141 * _xScaling,161.147 * _yScaling,214.995 * _xScaling,157.353 * _yScaling,233 * _xScaling,147.5 * _yScaling,);
    path.cubicTo(256.932 * _xScaling,133.593 * _yScaling,270.712 * _xScaling,127.612 * _yScaling,296 * _xScaling,120.5 * _yScaling,);
    path.cubicTo(323.677 * _xScaling,113.791 * _yScaling,337.684 * _xScaling,114.359 * _yScaling,360 * _xScaling,123 * _yScaling,);
    path.cubicTo(360 * _xScaling,123 * _yScaling,360 * _xScaling,0 * _yScaling,360 * _xScaling,0 * _yScaling,);
    path.cubicTo(360 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ThirdClipper extends CustomClipper<Path> {

   @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 365;
    final double _yScaling = size.height / 600;
    path.lineTo(1.5 * _xScaling,1 * _yScaling);
    path.cubicTo(8.15044 * _xScaling,8.03516 * _yScaling,24.5 * _xScaling,35 * _yScaling,30.5 * _xScaling,44.5 * _yScaling,);
    path.cubicTo(36.5 * _xScaling,54 * _yScaling,52.1463 * _xScaling,83.3003 * _yScaling,61 * _xScaling,108 * _yScaling,);
    path.cubicTo(79.07 * _xScaling,165.769 * _yScaling,89.8052 * _xScaling,197.546 * _yScaling,122.5 * _xScaling,240.5 * _yScaling,);
    path.cubicTo(148.415 * _xScaling,263.628 * _yScaling,165.837 * _xScaling,269.567 * _yScaling,201.5 * _xScaling,269 * _yScaling,);
    path.cubicTo(261.317 * _xScaling,263.541 * _yScaling,290.902 * _xScaling,265.653 * _yScaling,331 * _xScaling,286 * _yScaling,);
    path.cubicTo(331 * _xScaling,286 * _yScaling,331 * _xScaling,1 * _yScaling,331 * _xScaling,1 * _yScaling,);
    path.cubicTo(331 * _xScaling,1 * _yScaling,1.5 * _xScaling,1 * _yScaling,1.5 * _xScaling,1 * _yScaling,);
    path.cubicTo(1.5 * _xScaling,1 * _yScaling,1.5 * _xScaling,1 * _yScaling,1.5 * _xScaling,1 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}