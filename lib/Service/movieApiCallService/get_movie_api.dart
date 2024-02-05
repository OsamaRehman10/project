import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/Network/api_links.dart';

import '../../Model/MovieModel/movie_model.dart';

class MovieService {
  Future<MovieModel> getMovieApi() async {
    final response = await http.get(Uri.parse(ApiLinks.movieApi));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print('Data Fetched');
      print(response.body);

      return MovieModel.fromJson(data);
    } else {
      print('Error');

      return MovieModel.fromJson(data);
    }
  }
}
