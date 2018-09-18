import 'package:blurry_artist_details_page/models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcaoMiniatura extends StatelessWidget {
  AcaoMiniatura(this.video, this.removeCard);
  final Acao video;
  final Function removeCard;

  BoxDecoration _buildShadowAndRoundedCorners() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: 2.0,
          blurRadius: 10.0,
          color: Colors.black26,
        ),
      ],
    );
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Image.asset(video.thumbnail),
          Positioned(
            bottom: 2.0,
            right: 2.0,
            child: _buildPlayButton(video),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayButton(Acao acao) {
    return Material(
      color: Colors.red,
      type: MaterialType.circle,
      child: InkWell(
        onTap: () {
          //adicionar a timeline
          removeCard(acao);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
      child: Center(
        child: Text(
          video.title,
          style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 15.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _buildShadowAndRoundedCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 3, child: _buildThumbnail()),
          Flexible(flex: 2, child: _buildInfo()),
        ],
      ),
    );
  }
}
