import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/data/repository/tdbmovie_repository.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';
import 'package:movie_app/logic/bloc/search_movie/search_movie_bloc.dart';
import 'package:movie_app/ui/search_page/components/search_page_appbar.dart';
import 'package:movie_app/ui/search_page/components/search_page_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieRepository movieRepository =
        MovieRepository(tmdbApiClient: TMDBApiClient());

    return BlocProvider(
      create: (context) => SearchMovieBloc(movieRepository: movieRepository),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(5),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SearchPageAppbar(),
                const SearchPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
