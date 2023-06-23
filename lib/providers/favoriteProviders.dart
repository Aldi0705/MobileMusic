import 'package:flutter/material.dart';
import 'package:kelompok/Models/FavoriteModel.dart';
import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<Item> _favoriteListPage = [];

  List<Item> get favoriteList => _favoriteListPage;

  void addFavorite(Item todo) {
    print(todo.genre);
    _favoriteListPage.add(todo);
    notifyListeners();
  }

  void removeFavorite(Item todo) {
    print(todo);
    _favoriteListPage.remove(todo);
    notifyListeners();
  }
}
