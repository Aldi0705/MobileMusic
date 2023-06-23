import 'package:flutter/material.dart';
import 'package:kelompok/views/homepage.dart';
import 'package:kelompok/views/player.dart';
import 'package:kelompok/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';

class lagufavorit extends StatefulWidget {
  @override
  _lagufavorit createState() => _lagufavorit();
}

class _lagufavorit extends State<lagufavorit> {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favorite = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: favorite.favoriteList.length,
        itemBuilder: (context, index) {
          final data = favorite.favoriteList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MusicPlayer(item: favorite.favoriteList[index])));
            },
            child: Row(
              children: [
                Divider(
                  color: Colors.purple,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(14),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(data.cover),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, top: 5),
                      child: Text(
                        data.subtitle,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      data.genre,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: !favorite.favoriteList.contains(data)
                        ? Icon(Icons.delete)
                        : Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                    onPressed: () {
                      if (!favorite.favoriteList.contains(data)) {
                        favorite.addFavorite(data);
                      } else {
                        favorite.removeFavorite(data);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
