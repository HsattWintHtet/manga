
import '../../../utils/utils.dart';


class HomeControl extends ChangeNotifier{
  static HomeControl _this;
  HomeControl._() : super();
  factory HomeControl(){
    if(_this == null) _this = HomeControl._();
    return _this;
  }
List<Chapter> newChapterList =  List<Chapter>();
List<MangaModel> recommendManga = List<MangaModel>();
List<MangaModel> carouseldManga = List<MangaModel>();
getInitial()async{
 await Parse().initialize(
            "AriesZodiacAriesZodiacAriesZodiac",
        // "http://54.254.14.46:1337/parse",
        "http://www.zodiacbook.net:1337/parse",
         masterKey:'Ilove3000Ilove3000Ilove3000',
         );
        // getAllManga();
        getRecommendManga();
        getCarousel();
        getNewChapters();
          
}


  getRecommendManga()async{
    var mangaRecommendquery =  QueryBuilder<ParseObject>(ParseObject('Manga'))
      ..whereEqualTo('recommend', true);
     var queryResult = await mangaRecommendquery.query();
  if(queryResult.success){
    var json = jsonDecode(queryResult.results.toString());
    recommendManga.clear();
    
        for (var item in json) {
          recommendManga.add(MangaModel.fromJson(item));
               var itemQuery = QueryBuilder<ParseObject>(ParseObject('Genre'))
          ..whereRelatedTo('genre', 'Manga', item['objectId']);
          var query = await itemQuery.query();
          if(query.success){
    var jsons =await jsonDecode(query.results.toString());
     List<Genre> customList = List<Genre>();
    jsons.map((e)=> customList.add(Genre(name: e['name']??null,objectId: e['objectId']??null))).toList();
   recommendManga[recommendManga.length -1].genre = customList;
  notifyListeners();
}    
  notifyListeners();
    }

  }
  }

    getCarousel()async{
    var mangaCarousel =  QueryBuilder<ParseObject>(ParseObject('Manga'))
     ..whereEqualTo('carousel', true);
     var queryResults = await mangaCarousel.query();
  if(queryResults.success){
    var json = jsonDecode(queryResults.results.toString());
    carouseldManga.clear();
     for (var item in json) {
          carouseldManga.add(MangaModel.fromJson(item));
               var itemQuery = QueryBuilder<ParseObject>(ParseObject('Genre'))
          ..whereRelatedTo('genre', 'Manga', item['objectId']);
          var query = await itemQuery.query();
          if(query.success){
    var jsons =await jsonDecode(query.results.toString());
     List<Genre> customList = List<Genre>();
    jsons.map((e)=> customList.add(Genre(name: e['name']??null,objectId: e['objectId']??null))).toList();
   carouseldManga[carouseldManga.length -1].genre = customList;
  notifyListeners();
}    
  notifyListeners();
    }
  }
  }


  getNewChapters()async{
      var newChapter =  QueryBuilder<ParseObject>(ParseObject('Chapter'))
      ..orderByDescending("createdAt")
    ..setLimit(5);
     var queryResults = await newChapter.query();
  if(queryResults.success){
    var json = jsonDecode(queryResults.results.toString());
    newChapterList.clear();
        for (var item in json) {
          newChapterList.add(Chapter.fromJson(item));
              var manga = QueryBuilder(ParseObject('Manga'))
      ..whereContains('objectId', item['manga']['objectId']);
          var query = await manga.query();
          if(query.success){
    var jsons =await jsonDecode(query.results.first.toString());
   newChapterList[newChapterList.length -1].manga = Manga(name:jsons['name']);
  notifyListeners();
}
  notifyListeners();
    }
  }
  }

}

