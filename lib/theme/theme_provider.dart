// we use provider to manage the app state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zodiac/utils/utils.dart';
// import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  bool isThemeDark ;

  ThemeProvider({this.isThemeDark});

  // the code below is to manage the status bar color when the theme changes
  // getCurrentStatusNavigationBarColor() {
  //   if (isThemeDark) {
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarBrightness: Brightness.dark,
  //       statusBarIconBrightness: Brightness.light,
  //       systemNavigationBarColor: Color(0xFF26242e),
  //       systemNavigationBarIconBrightness: Brightness.light,
  //     ));
  //   } else {
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarColor: Color(0xFFFFFFFF),
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //     ));
  //   }
  // }

  // use to toggle the theme
  toggleThemeData() async {
     isThemeDark = !isThemeDark;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', isThemeDark);
    print(isThemeDark);
    notifyListeners();
  }

  // Global theme data we are always check if the light theme is enabled #isLightTheme
  ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // primarySwatch: isThemeDark ? Colors.green : Colors.green,
      primaryColor: isThemeDark ? Color(0xff121212) : Colors.white,
      brightness: isThemeDark ? Brightness.dark : Brightness.light,
      backgroundColor: isThemeDark ? Color(0xff121212) : Color(0xFFFFFFFF),
      scaffoldBackgroundColor:
          isThemeDark ? Color(0xff121212) : Color(0xFFFFFFFF),
        textTheme: isThemeDark ?TextTheme(
          headline1: GoogleFonts.ubuntu(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w300)
        ) : TextTheme(
          headline1: GoogleFonts.ubuntu(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w300)
        ),
    );
  }

  // Theme mode to display unique properties not cover in theme data
  // ThemeColor themeMode() {
  //   return ThemeColor(
  //     gradient: [
  //       if (isThemeDark) ...[Color(0xDDFF0080), Color(0xDDFF8C00)],
  //       if (!isThemeDark) ...[Color(0xFF8983F7), Color(0xFFA3DAFB)]
  //     ],
  //     textColor: isThemeDark ? Color(0xFF000000) : Color(0xFFFFFFFF),
  //     toggleButtonColor: isThemeDark ? Color(0xFFFFFFFF) : Color(0xFf34323d),
  //     toggleBackgroundColor:
  //         isThemeDark ? Color(0xFFe7e7e8) : Color(0xFF222029),
  //     shadow: [
  //       if (isThemeDark)
  //         BoxShadow(
  //             color: Color(0xFFd8d7da),
  //             spreadRadius: 5,
  //             blurRadius: 10,
  //             offset: Offset(0, 5)),
  //       if (!isThemeDark)
  //         BoxShadow(
  //             color: Color(0x66000000),
  //             spreadRadius: 5,
  //             blurRadius: 10,
  //             offset: Offset(0, 5))
  //     ],
  //   );
  // }
}

// A class to manage specify colors and styles in the app not supported by theme data
class ThemeColor {
  List<Color> gradient;
  Color backgroundColor;
  Color toggleButtonColor;
  Color toggleBackgroundColor;
  Color textColor;
  List<BoxShadow> shadow;

  ThemeColor({
    this.gradient,
    this.backgroundColor,
    this.toggleBackgroundColor,
    this.toggleButtonColor,
    this.textColor,
    this.shadow,
  });
}

// Provider finished
