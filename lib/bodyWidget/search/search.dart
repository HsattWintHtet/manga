import 'dart:convert';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:zodiac/Clip/clipwidget.dart';
import 'package:zodiac/ads/ads_provider.dart';
import 'package:zodiac/bodyWidget/detail/view/detail.dart';
import 'package:zodiac/model/model.dart';
import 'package:zodiac/utils/utils.dart';

import '../../utils/img.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();
  AdsProvider adsProvider = AdsProvider();
  BannerAd _bannerAd;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    _bannerAd = adsProvider.createBannerAdUnitId();
    FirebaseAdMob.instance
        .initialize(appId: adsProvider.getAppId())
        .then((response) {
      _bannerAd
        ..load()
        ..show();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    searchList.clear();
      _bannerAd?.dispose();
  }

  void clearSearchQuery() {
    _controller.clear();
  }

  List<MangaModel> searchList = List<MangaModel>();

  searchManga(value) async {
    var manga = QueryBuilder<ParseObject>(ParseObject('Manga'))
      ..whereContains('name', value);
    var queryResult = await manga.query();
    if (queryResult.success) {
      var json = jsonDecode(queryResult.results.toString());
      searchList.clear();

      for (var item in json) {
        setState(() {
          searchList.add(MangaModel.fromJson(item));
        });
        var itemQuery = QueryBuilder<ParseObject>(ParseObject('Genre'))
          ..whereRelatedTo('genre', 'Manga', item['objectId']);
        var query = await itemQuery.query();
        if (query.success) {
          var jsons = await jsonDecode(query.results.toString());
          List<Genre> customList = List<Genre>();
          setState(() {
            jsons
                .map((e) => customList.add(Genre(
                    name: e['name'] ?? null, objectId: e['objectId'] ?? null)))
                .toList();
            searchList[searchList.length - 1].genre = customList;
          });
        }
      }
    }
    print(searchList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? Color(0xff121212)
              : Color(0xFFFFFFFF),
          child: Stack(
            children: [
              ClipWidget(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigo,
                                      spreadRadius: 0.1,
                                      blurRadius: 0.1)
                                ]),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  child: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_left,
                                          color: Colors.black),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      // focusNode: _focusNode,
                                      onSubmitted: (value) {
                                        searchManga(value);
                                      },
                                      style: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.search,
                                      controller: _controller,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                              fontSize: 14.5,
                                              color: Colors.black26),
                                          suffixIcon:
                                              _controller.text.length > 0
                                                  ? (InkWell(
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.black,
                                                      ),
                                                      onTap: clearSearchQuery,
                                                    ))
                                                  : Container(
                                                      width: 50,
                                                    )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white70
                                        : Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    searchManga(_controller.text);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                  })),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: searchList.isNotEmpty
                        ? Container(
                            child: ListView.builder(
                                itemCount: searchList.length,
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => Detail(
                                                      manga: searchList[i],
                                                    )));
                                      },
                                      child: Container(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 1.0,
                                                      color: Colors.grey[600],
                                                      spreadRadius: 0.5)
                                                ],
                                              ),
                                              child: ImgView(
                                                  url: searchList[i].img.url),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                        searchList[i].name,
                                                        style: GoogleFonts
                                                            .publicSans(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Container(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
