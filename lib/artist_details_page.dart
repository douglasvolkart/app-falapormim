import 'dart:ui' as ui;

import 'package:blurry_artist_details_page/acao_mini.dart';
import 'package:blurry_artist_details_page/models.dart';
import 'package:blurry_artist_details_page/video_card.dart';
import 'package:flutter/material.dart';

class ArtistDetailsPage extends StatefulWidget {
  final App artist;

  ArtistDetailsPage({Key key, @required this.artist}) : super(key: key);

  @override
  ArtistDetailsPageState createState() => new ArtistDetailsPageState();
}

class ArtistDetailsPageState extends State<ArtistDetailsPage> {
  List<Acao> timeLine = new List<Acao>();
  
  @override
  void initState() {
    super.initState();
  }

  void addcard(Acao acao) {
    acao.setId(DateTime.now().millisecondsSinceEpoch);
    timeLine.add(acao);
    setState(() {
      timeLine = timeLine;
    });
  }

  void removeCard(Acao acao) {
    timeLine.removeWhere((ac) => ac.id == acao.id);
    setState(() {
      timeLine = timeLine;
    });
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildInfo(),
          _buildVideoScroller(),
          _buildTimeLine()
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.artist.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text(
            widget.artist.location,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            widget.artist.biography,
            style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                height: 1.4,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: widget.artist.videos.length,
          itemBuilder: (BuildContext context, int index) {
            var video = widget.artist.videos[index];
            return VideoCard(video, addcard);
          },
        ),
      ),
    );
  }

  Widget _buildTimeLine() {
    return Container(
      height: 180.0,
      decoration: BoxDecoration(color: Colors.orangeAccent.withOpacity(0.4), border: Border(top: BorderSide(color: Colors.black, width: 3.0))),
      margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
      padding: const EdgeInsets.all(3.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: timeLine.length,
          itemBuilder: (BuildContext context, int index) {
            var video = timeLine[index];
            return AcaoMiniatura(video, removeCard);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(widget.artist.backdropPhoto, fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.2),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }
}
