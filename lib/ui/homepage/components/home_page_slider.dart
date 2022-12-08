import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/const/api_const/text_const/text_const.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/logic/bloc/movie/movie_bloc.dart';
import 'package:movie_app/ui/movie_detail/movie_detail_page.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieFailed) {
          return const Center(child: Text("There was a problem "));
        }

        if (state is MovieSuccess) {
          if (state.movies.isEmpty) {
            return const Center(
              child: Text("No movies"),
            );
          }
          return _builPopulardMovies(state);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget _builPopulardMovies(MovieSuccess state) {
  List<Movie> movies = state.movies;
  return SizedBox(
    height: 425,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.hasReachedMax ? movies.length : movies.length - 1,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetailPage(id: movies[index].id)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 400,
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movies[index].backdrop_path}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "${movies[index].title}",
                style: name,
              ),
            ],
          ),
        );
      }),
    ),
  );
}
