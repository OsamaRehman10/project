import 'package:flutter/material.dart';

import '../../Model/MovieModel/movie_model.dart';
import '../../Utils/app_constants.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.movie,
  });

  final Items movie;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${AppConstants.posterBaseUrl}${movie.posterPath}',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
