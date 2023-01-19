import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:zodiac/ads/ads_provider.dart';
import '../../../utils/utils.dart';

class Detail extends StatefulWidget {
  final MangaModel manga;

  const Detail({Key key, this.manga}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DetailControl detailControl = DetailControl();
  FavoriteControl favoriteControl = FavoriteControl();
  AdsProvider adsProvider = AdsProvider();
  BannerAd _bannerAd;

  @override
  void initState() {
    detailControl.getChapter(widget.manga.objectId);
    setBool();
    _bannerAd = adsProvider.createBannerAdUnitId();
    FirebaseAdMob.instance
        .initialize(appId: adsProvider.getAppId())
        .then((response) {
      _bannerAd
        ..load()
        ..show();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
  }

  setBool() {
    if (favoriteControl.favoriteList.isNotEmpty) {
      var result = favoriteControl.favoriteList
          .where((e) => e.objectId == widget.manga.objectId);
      if (result.length == 1) {
        int index = favoriteControl.favoriteList
            .indexWhere((item) => item.objectId == widget.manga.objectId);
        setState(() {
          widget.manga.isFavorite =
              favoriteControl.favoriteList[index].isFavorite;
        });
      }
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Manga Share',
        text: 'Manga Share',
        linkUrl: widget.manga.share,
        chooserTitle: 'Manga Share');
  }

  bool reversed = false;

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<DetailControl>(context);
    final favorite = Provider.of<FavoriteControl>(context);
    return Material(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.manga.cover.url),
                      fit: BoxFit.cover)),
            ),
            Scaffold(
              backgroundColor: Colors.black26,
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  IconButton(
                      icon: Icon(
                          widget.manga.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.manga.isFavorite
                              ? Colors.pink
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          widget.manga.isFavorite = !widget.manga.isFavorite;
                        });
                        favorite.favorute(widget.manga);
                      }),
                  IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: share)
                ],
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                    child: Container(
                      child: Row(
                          children: widget.manga.genre
                              .map((e) => genreText(e.name))
                              .toList()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.manga.name,
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(widget.manga.author,
                            style: GoogleFonts.ubuntu(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.manga.rate.toString(),
                            // "9.5",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                  "RATE",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 10.0, top: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ChapterView(
                                    img: control.chapterList.first.imgList,
                                  )));
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Go to 1st Ep. >",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 10.0, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Description(
                                    description: widget.manga.description,
                                  )));
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Description",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${control.chapterList.length} Chapter"),
                        IconButton(
                            icon: Icon(reversed
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down),
                            onPressed: () {
                              setState(() {
                                reversed = !reversed;
                              });
                            })
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  control.chapterList.length != 0
                      ? reversed
                          ? Column(
                              children: control.chapterList.reversed
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => ChapterView(
                                                    img: e.imgList)));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.white60,
                                            height: 80,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          scale: 1.0,
                                                          image:
                                                              CachedNetworkImageProvider(
                                                                  e.imgList
                                                                      .first))),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(e.name,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black)),
                                                    Text(
                                                        // DateFormat('d  MMM  y')
                                                        DateFormat(
                                                                'dd - MM - yyyy')
                                                            .format(
                                                                DateTime.parse(e
                                                                    .createdAt)),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .grey[600]))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.grey[300],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Column(
                              children: control.chapterList
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => ChapterView(
                                                    img: e.imgList)));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.white60,
                                            height: 80,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          scale: 1.0,
                                                          image: CachedNetworkImageProvider(
                                                              '${e.imgList.first}'))),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(e.name,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black)),
                                                    Text(
                                                        // DateFormat('d  MMM  y')
                                                        DateFormat(
                                                                'dd - MM - yyyy')
                                                            .format(
                                                                DateTime.parse(e
                                                                    .createdAt)),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .grey[600]))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.grey[300],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genreText(String text) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.grey[100],
          // borderRadius: BorderRadius.circular(5)
          ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(text,
            style: GoogleFonts.ubuntu(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
      ),
    );
  }
}
