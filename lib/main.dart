import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zodiac/ads/ads_provider.dart';
import 'package:zodiac/splashScreen.dart';
import 'theme/theme_provider.dart';
import 'utils/utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
   bool isThemeDark =  sharedPreferences.getBool('theme')??false;
  print(isThemeDark);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider(isThemeDark: isThemeDark)),
      ChangeNotifierProvider<HomeControl>(create: (_)=> HomeControl()),
      ChangeNotifierProvider<GenreControl>(create: (_)=> GenreControl()), 
      ChangeNotifierProvider<DetailControl>(create: (_)=> DetailControl()), 
      ChangeNotifierProvider<FavoriteControl>(create: (_)=> FavoriteControl()),    
      ChangeNotifierProvider<AdsProvider>(create: (_)=> AdsProvider()),          
    ],
    child: MyApp( )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
     ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'ZodiacBook',
      theme: themeProvider.themeData(),
     home: SplashScreen(),
    );
  }
}
