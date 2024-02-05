import 'package:flutter/material.dart';
import 'package:movie/CustomWidgets/Drawer/custom_drawer.dart';
import 'package:movie/Provider/favourite_provider.dart';
import 'package:movie/Service/movieApiCallService/get_movie_api.dart';
import 'package:movie/Utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CustomWidgets/Favourite/poster.dart';
import '../../CustomWidgets/Rating/rating_widget.dart';
import '../../Model/MovieModel/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: const Text('Welcome to Movie App'),
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 35.0,
              ),
            ),
          ),
          backgroundColor:
              AppColors.orangeColor, // Set the background color to red
        ),
        drawer: const CustomDrawer(),
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
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: snapshot.data!.items!.length,
                    itemBuilder: (context, index) {
                      Items movie = snapshot.data!.items![index];
                      bool isFavorite =
                          value.favouritedMovies.contains(movie.id);

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Poster(movie: movie),
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
                                  color: AppColors.redColor,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: RatingWidget(movie: movie),
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
