class MangaModel{
  final String objectId, createdAt, name, description,author,share,status;
  final double rate;
  final bool recommend;
  final Img img;
  final Cover cover;
  bool isFavorite ;
   List<Genre> genre;
  MangaModel({this.objectId, this.createdAt, this.name, this.rate,this.genre,this.author,this.share,this.status,
      this.description, this.recommend, this.img, this.cover,this.isFavorite});
  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
        objectId: json['objectId']??null,
        createdAt: json['createdAt']??null,
        name: json['name']??null,
        rate: json['rate']??null,
        share: json['share']??null,
        description: json['description']??null,
        recommend: json['recommend']??null,
        author: json['author']??null,
        status: json['status']??null,
        img: Img.fromJson(json['img'])??null,
        cover:Cover.fromJson(json['cover'])??null,
        isFavorite: json['isFavorite']??false,
        
       );
  }
  static Map<String, dynamic> toMap(MangaModel mangaModel) => {
        'objectId': mangaModel.objectId,
        'createdAt': mangaModel.createdAt,
        'name': mangaModel.name,
        'rate': mangaModel.rate,
        'share':mangaModel.share,
        'description': mangaModel.description,
        'recommend': mangaModel.recommend,
        'author': mangaModel.author,
        'status': mangaModel.status,
        'img': Img.toMap(mangaModel.img),
        'cover': Cover.toMap(mangaModel.cover),
        'isFavorite':mangaModel.isFavorite,
      };
}

class Img{
  final String url;
  Img({this.url});
  factory Img.fromJson(Map<String,dynamic> json){
    return Img(
      url: json['url']??null
    );
  }
   static Map<String, dynamic> toMap(Img img) => {
        'url': img.url 
      };
}

class Cover{
  final String url;
  Cover({this.url});
    factory Cover.fromJson(Map<String,dynamic> json){
    return Cover(
       url: json['url']??null
    );
  }
  static Map<String, dynamic> toMap(Cover cover) => {
        'url': cover.url 
      };
}

class Chapter{
final String objectId,createdAt,name;
final List<String> imgList;
Manga manga;
  Chapter({this.objectId, this.createdAt, this.name,this.imgList,this.manga});
  factory Chapter.fromJson(Map<String,dynamic> json){
    return Chapter(
      objectId: json['objectId']??null,
      createdAt: json['createdAt']??null,
      name: json['name']??null,
      imgList: List<String>.from(json['imgList'])??null
    );
  }
}

class Manga{
   String name;
  Manga({ this.name});
  factory Manga.fromJson(Map<String,dynamic> json){
    return Manga(
      name: json['name']??null,
    );
  }
}
class Genre{
   String objectId,name;
   int genreIndex;

  Genre({this.objectId, this.name,this.genreIndex});
  factory Genre.fromJson(Map<String,dynamic> json){
    return Genre(
       objectId: json['objectId']??null,
      name: json['name']??null,
      genreIndex: json['genreIndex']
    );
  }
}
