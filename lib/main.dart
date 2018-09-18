import 'package:blurry_artist_details_page/artist_details_page.dart';
import 'package:blurry_artist_details_page/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final App andy = App(
    name: 'Fala por mim',
    backdropPhoto: 'assets/backdrop.png',
    location: 'by Douglas Volkart de Carvalho',
    biography: 'Selecione as figuras que representam ações para demonstrar '
        'o que deseja fazer. ',
        
    videos: <Acao>[
      Acao(
        title: 'Comer',
        thumbnail: 'assets/video1_thumb.png',
        
      ),
      Acao(
        title: 'Ir ao banheiro',
        thumbnail: 'assets/video2_thumb.png',
        
      ),
      Acao(
        title: 'Sede',
        thumbnail: 'assets/video3_thumb.png',
       
      ),
      Acao(
        title: 'Pracinha',
        thumbnail: 'assets/video4_thumb.png',
        
      ),
    ],
  );
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
   

    return MaterialApp(
      title: 'Fala por mim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArtistDetailsPage(artist: andy),
    );
  }
}
