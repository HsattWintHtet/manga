import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../../../utils/utils.dart';

class GenreControl extends ChangeNotifier{
  static GenreControl _this;
   GenreControl._() : super();
  factory GenreControl(){
    if(_this == null)_this = GenreControl._();
    return _this;
  }
  List<Genre> genreList = List<Genre>();
  List allmangaList;

  
  getGenre()async{
    var genre =await ParseObject('Genre').getAll();
    if(genre.success){
      var json = JsonDecoder().convert(genre.results.toString());
      genreList.clear();
      json.map((i)=> genreList.add(Genre.fromJson(i))).toList();
      allmangaList = List.generate(genreList.length,(int index) => <MangaModel>[]);
      notifyListeners();
    }
    notifyListeners();
  }
 

getGenreList(id,index) async {
      var genre = ParseObject("Genre")..objectId = id;
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Manga'))
          ..whereEqualTo('genre', genre);
    var response = await query.query();
    if (response.success) {
      var json = jsonDecode(response.results.toString());
      if (json != null) {
          // mangaList.clear();
        for (var item in json) {
           allmangaList[index].add(MangaModel.fromJson(item));
         notifyListeners();
          var itemQuery = QueryBuilder<ParseObject>(ParseObject('Genre'))
            ..whereRelatedTo('genre', 'Manga', item['objectId']);
          var query = await itemQuery.query();
          if (query.success) {
            var jsons = await jsonDecode(query.results.toString());
           List<Genre> customList = List<Genre>();
    jsons.map((e)=> customList.add(Genre(name: e['name']??null,objectId: e['objectId']??null))).toList();
   allmangaList[index][allmangaList[index].length - 1].genre  = customList;
  notifyListeners();

          }
        }
      }
    }
notifyListeners();
  }

}