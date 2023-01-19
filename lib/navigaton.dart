import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bodyWidget/favorite/view/favorite.dart';
import 'bodyWidget/genre/view/genre.dart';
import 'bodyWidget/home/control/homeControl.dart';
import 'bodyWidget/home/view/home.dart';
import 'bodyWidget/setting/setting.dart';


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  List<Widget> _body = [Home(), Genres(), Favorite(), Setting()];
    HomeControl homeControl = HomeControl();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: _body[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Theme.of(context).brightness ==  Brightness.dark ? Color(0xff121212) : Color(0xFFFFFFFF),
          selectedItemColor:Colors.blue[500] ,
          unselectedItemColor:Theme.of(context).brightness ==  Brightness.light ?  Colors.black54 : Colors.white70,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            navItem(AntDesign.home, "HOME"),
            navItem(Feather.layers, "GENRE"),
            navItem(AntDesign.hearto, "FAVORITE"),
            navItem(FontAwesome.gears, "SETTING"),
          ],
        ),
      
    );
  }

  navItem(
    IconData icon,
    String title,
  ) {
    return BottomNavigationBarItem(
      // backgroundColor: Colors.red,
      icon: new Icon(icon),
      title: new Text(
        title,
        style: GoogleFonts.pangolin(),
      ),
      activeIcon: new Icon(icon)
    );
  }
}
