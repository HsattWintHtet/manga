import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zodiac/theme/theme_provider.dart';
import 'package:zodiac/utils/utils.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 150,
                // width: 150,
                child: Image.asset("assets/image/logo1.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500, fontSize: 20)),
                  Container(
                    height: 50,
                    width: 60,
                    child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.grey[300],
                        value: control.isThemeDark,
                        onChanged: (v) {
                          control.toggleThemeData();
                          setState(() {
                            control.isThemeDark = v;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 10, bottom: 10),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("App Version",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 18,color: Colors.grey[400]))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 10, bottom: 20),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Current Version 1.1.1",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 18))),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 10, bottom: 10),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Contacts",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 18,color: Colors.grey[400]))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(AntDesign.facebook_square,color: Colors.blue[600],size: 40,), onPressed: (){
                        openFacebook();
                      }),
                  IconButton(
                      icon: Icon(MaterialCommunityIcons.facebook_messenger,color: Colors.blue[600],size: 40,),
                      onPressed: (){
                        openMessenger();
                      })
                ],
              ),
            ),
             Container(
              height: 0.5,
              color: Colors.grey[300],
            ),
                        Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 10, bottom: 10),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Developer Name",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 18,color: Colors.grey[400]))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 10, bottom: 20),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Hsatt Wint Htet",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 18))),
            ),
          ],
        )),
      ),
    );
  }
}
openMessenger()async{
      String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/116708840199066';
    } else {
      fbProtocolUrl = 'fb://messaging/116708840199066';
    }

    String fallbackUrl = 'https://web.facebook.com/zodiacbook.mm';

    try {
      bool launched = await launch(fbProtocolUrl,
          forceSafariVC: false, forceWebView: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
}
openFacebook()async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/116708840199066';
    } else {
      fbProtocolUrl = 'fb://page/116708840199066';
    }

    String fallbackUrl = 'https://www.facebook.com/zodiacbook.mm';

    try {
      bool launched = await launch(fbProtocolUrl,
          forceSafariVC: false, forceWebView: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
