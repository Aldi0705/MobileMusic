import 'package:flutter/material.dart';
import 'package:kelompok/Models/FavoriteModel.dart';
import 'package:kelompok/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({required this.item});

  final Item item;

  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double _currentSliderValue = 0.0;
  double _maxSliderValue = 210.0;
  bool _isPlaying = false;
  var uuid = Uuid();

  String getFormattedTime(double value) {
    int minutes = value ~/ 60;
    int seconds = value.toInt() % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  bool click = true;

  @override
  Widget build(BuildContext context) {
    // final VoidCallback? onPressed = enable ? () {} : null;
    var prov = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Musik',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(widget.item.cover),
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            '${widget.item.title}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${widget.item.subtitle}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${widget.item.genre}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Slider(
              inactiveColor: Colors.white10,
              activeColor: Colors.white,
              thumbColor: Colors.black,
              value: _currentSliderValue,
              min: 0.0,
              max: _maxSliderValue,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getFormattedTime(_currentSliderValue),
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  getFormattedTime(_maxSliderValue),
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                hoverColor: Colors.white,
                icon: Icon(Icons.skip_previous),
                onPressed: () {},
              ),
              IconButton(
                hoverColor: Colors.white,
                icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
              IconButton(
                hoverColor: Colors.white,
                icon: Icon(Icons.skip_next),
                onPressed: () {},
              ),
              IconButton(
                  icon: !prov.favoriteList.contains(widget.item)
                      ? Icon(Icons.favorite_border)
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    !prov.favoriteList.contains(widget.item)
                        ? prov.addFavorite(widget.item)
                        : prov.removeFavorite(widget.item);
                    // Provider.of<FavoriteProvider>(context).addFavorite(Item(
                    //     id: uuid.v1(),
                    //     cover: widget.cover.toString(),
                    //     title: widget.title.toString(),
                    //     subtitle: widget.subtitle.toString(),
                    //     genre: widget.genre.toString()));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
