import '../../../utils/utils.dart';

class DetailControl extends ChangeNotifier {
  static DetailControl _this;
  DetailControl._() : super();
  factory DetailControl() {
    if (_this == null) _this = DetailControl._();
    return _this;
  }
  List<Chapter> chapterList = List<Chapter>();
  getChapter(String mangaId) async {
    chapterList.clear();
    notifyListeners();
    var chapter = QueryBuilder(ParseObject('Chapter'))
      ..whereContains('manga', mangaId);
    var query = await chapter.query();
    if (query.success) {
      
      var json = JsonDecoder().convert(query.results.toString());
      json.map((e) => chapterList.add(Chapter.fromJson(e))).toList();
      notifyListeners();
    }
  }

reverse(){
  chapterList.reversed;
  notifyListeners();
  print("object");
} 
}
