import 'package:flutter/material.dart';

class FavouriteMoviesProvider with ChangeNotifier {
  List<int> _favouritedMovies = [];

  List<int> get favouritedMovies => _favouritedMovies;

  void addMovie(int? mov) {
    if (mov != null) {
      print("add");
      print(mov);
      favouritedMovies.add(mov);
      print(_favouritedMovies);
      notifyListeners();
    }
  }

  void removeMovie(int? mov) {
    if (mov != null) {
      print("remove");
      print(mov);
      favouritedMovies.remove(mov);
      print(_favouritedMovies);
      notifyListeners();
    }
  }
}
