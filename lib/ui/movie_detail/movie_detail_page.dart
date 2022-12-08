import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/data/repository/tdbmovie_repository.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';
import 'package:movie_app/logic/bloc/cast/cast_bloc.dart';
import 'package:movie_app/logic/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/ui/movie_detail/components/movie_details_appbar.dart';
import 'package:movie_app/ui/movie_detail/components/movie_details_body.dart';
import 'package:movie_app/ui/movie_detail/components/movie_details_cast.dart';

class MovieDetailPage extends StatelessWidget {
  final int id;
  MovieDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieRepository movieRepository =
        MovieRepository(tmdbApiClient: TMDBApiClient());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MovieDetailsBloc(movieRepository: movieRepository)
                ..add(FetchingMovieDetails(id: id)),
        ),
        BlocProvider(
            create: (context) => CastBloc(movieRepository: movieRepository)
              ..add(FetchMovieCast(movieId: id)))
      ],
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: [
              const MovieDetailsAppBar(),
              const MovieDetailsBody(),
              const MovieDetailsCast()
            ],
          ),
        ),
      ),
    );
  }
}
