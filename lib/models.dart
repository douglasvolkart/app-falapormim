import 'package:meta/meta.dart';

class App {
  App({
    @required this.name,
    @required this.avatar,
    @required this.backdropPhoto,
    @required this.location,
    @required this.biography,
    @required this.videos,
  });

  final String name;
  final String avatar;
  final String backdropPhoto;
  final String location;
  final String biography;
  final List<Acao> videos;
}

class Acao {
  Acao({
    @required this.title,
    @required this.thumbnail,
    this.id
  });

  final String title;
  final String thumbnail;
  int id;

  Function setId(int id){
    this.id = id;
  }
  
}
