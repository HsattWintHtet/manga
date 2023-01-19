import '../../../utils/utils.dart';

class FavoriteControl extends ChangeNotifier {
  static FavoriteControl _this;
  FavoriteControl._() : super();
  factory FavoriteControl() {
    if (_this == null) _this = FavoriteControl._();
    return _this;
  }

  List<MangaModel> favoriteList = List<MangaModel>();
  favorute(MangaModel manga) {
    if (manga.isFavorite) {
      if (favoriteList.isEmpty) {
        favoriteList.add(manga);

        notifyListeners();
      } else {
        var result = favoriteList.where((e) => e.objectId == manga.objectId);
        if (result.isEmpty) {
          favoriteList.add(manga);

          notifyListeners();
        }
      }
    } else {
      int index =
          favoriteList.indexWhere((item) => item.objectId == manga.objectId);

      favoriteList.removeAt(index);

      notifyListeners();
    }
    saveFavorite();
  }

  saveFavorite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (favoriteList.isNotEmpty) {
      var result =
          json.encode(favoriteList.map((e) => MangaModel.toMap(e)).toList());

      sharedPreferences.setString("favorite", result);
      notifyListeners();
    } else {
      var result = json.encode(favoriteList);
      sharedPreferences.setString("favorite", result);
      notifyListeners();
    }
  }

  getFavorite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = sharedPreferences.getString("favorite") ?? null;
    if (result != null) {
      var json = JsonDecoder().convert(result);
      favoriteList.clear();
      for (var item in json) {
        favoriteList.add(MangaModel.fromJson(item));
        var itemQuery = QueryBuilder<ParseObject>(ParseObject('Genre'))
          ..whereRelatedTo('genre', 'Manga', item['objectId']);
        var query = await itemQuery.query();
        if (query.success) {
          var jsons = await jsonDecode(query.results.toString());
          List<Genre> customList = List<Genre>();
          jsons
              .map((e) => customList.add(Genre(
                  name: e['name'] ?? null, objectId: e['objectId'] ?? null)))
              .toList();
          favoriteList[favoriteList.length - 1].genre = customList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    }
  }
}
