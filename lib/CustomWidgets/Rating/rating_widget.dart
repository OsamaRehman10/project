import 'package:flutter/material.dart';
import 'package:movie/Model/MovieModel/movie_model.dart';
import 'package:movie/Utils/app_colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.movie,
  });

  final Items movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.orangeColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${movie.voteAverage!.toInt() ?? 0.0}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
