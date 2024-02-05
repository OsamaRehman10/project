import 'package:flutter/material.dart';
import 'package:movie/Provider/favourite_provider.dart';
import 'package:movie/Service/movieApiCallService/get_movie_api.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Model/MovieModel/movie_model.dart';
import '../../Utils/app_constants.dart';

class FavMoviesList extends StatefulWidget {
  const FavMoviesList({super.key});

  @override
  State<FavMoviesList> createState() => _FavMoviesListState();
}

class _FavMoviesListState extends State<FavMoviesList> {
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider = Provider.of<FavouriteMoviesProvider>(context);

    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Movie'),
        ),
        body: FutureBuilder<MovieModel>(
          future: MovieService().getMovieApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Consumer<FavouriteMoviesProvider>(
                builder: (
                  context,
                  value,
                  child,
                ) {
                  List<Items> moviesu = snapshot.data!.items!
                      .where((element) =>
                          value.favouritedMovies.contains(element.id))
                      .toList();

                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: moviesu.length,
                    itemBuilder: (context, index) {
                      Items movie = moviesu[index];
                      bool isFavorite =
                          value.favouritedMovies.contains(movie.id);

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image.network(
                              '${AppConstants.posterBaseUrl}${movie.posterPath}',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: InkWell(
                                onTap: () {
                                  isFavorite
                                      ? value.removeMovie(movie.id)
                                      : value.addMovie(movie.id);
                                },
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                alignment: Alignment.center,
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
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
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('No Data found'));
          },
        ),
      );
    });
  }
}
