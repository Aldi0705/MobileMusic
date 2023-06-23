import 'package:flutter/material.dart';
import 'package:kelompok/Models/FavoriteModel.dart';
import 'package:kelompok/views/about.dart';
import 'package:kelompok/views/player.dart';
import 'package:kelompok/views/premium.dart';
import 'package:kelompok/views/login.dart';
import 'package:kelompok/providers/favoriteProviders.dart';
import 'package:kelompok/views/setting.dart';
import 'package:kelompok/views/favorit.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:kelompok/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool check = true;
  var uuid = Uuid();

  List<Item> listData = [
    Item(
      id: Uuid().v1(),
      cover: "Mahalini.jpeg",
      title: "Eight",
      subtitle: "IU",
      genre: "Korea",
    ),
    Item(
      id: Uuid().v1(),
      cover: "Jisoo.jpeg",
      title: "Flower",
      subtitle: "JISOO",
      genre: "Korea",
    ),
    Item(
      id: Uuid().v1(),
      cover: "Mahalini.jpeg",
      title: "Sial",
      subtitle: "Mahalini",
      genre: "Indonesia",
    ),
    Item(
      id: Uuid().v1(),
      cover: "Dynamite.jpeg",
      title: "Dynamite",
      subtitle: "BTS",
      genre: "Korea",
    ),
    // ["Jisoo.jpeg", "Flower", "JISOO", "Korea"],
    // ["Mahalini.jpeg", "Sial", "Mahalini", "Indonesia"]
  ];

  _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          // color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Account Musik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.star),
                  iconColor: Colors.yellow,
                  title: Text('Premium'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Premium();
                    }));
                  },
                ),
              ),
              Card(
                  child: ListTile(
                leading: Icon(Icons.favorite),
                iconColor: Colors.red,
                title: Text('Favorite'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return lagufavorit();
                  }));
                },
              )),
              Card(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  iconColor: Colors.black,
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingsScreen();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.contact_support),
                  title: Text('AboutUs'),
                  iconColor: Colors.blueGrey,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutUsPage();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: Colors.purple,
                  title: Text('Logout'),
                  onTap: () {
                    _showLogoutConfirmationDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Find Your Favorite Song',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            // ! Recomended
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Text(
                'Recommended',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MusicPlayer(item: listData[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(listData[index].cover),
                          ),
                        ),
                      ),
                      Text(
                        listData[index].title,
                        style: TextStyle(color: Colors.purple),
                      ),
                      Text(
                        listData[index].subtitle,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 5, right: 5, top: 8),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Text(
                'Top Chart',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return Row(
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
                            image: AssetImage(listData[index].cover),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listData[index].title,
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            listData[index].subtitle,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            listData[index].genre,
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
                          icon: !prov.favoriteList.contains(listData[index])
                              ? Icon(Icons.favorite_border)
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                          onPressed: () {
                            if (!prov.favoriteList.contains(listData[index])) {
                              prov.addFavorite(listData[index]);
                            } else {
                              prov.removeFavorite(listData[index]);
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
