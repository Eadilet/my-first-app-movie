import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/data/repository/tdbmovie_repository.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';
import 'package:movie_app/logic/bloc/people_details/people_details_bloc.dart';
import 'package:movie_app/ui/people_details_page/components/people_details_page_appbar.dart';
import 'package:movie_app/ui/people_details_page/components/people_details_page_body.dart';

class PeopleDetailsPage extends StatelessWidget {
  final int id;
  PeopleDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieRepository = MovieRepository(tmdbApiClient: TMDBApiClient());
    return BlocProvider(
      create: (context) => PeopleDetailsBloc(movieRepository: movieRepository)
        ..add(FetchPeopleDetails(id: id)),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: ListView(
              children: [
                const PeopleDetailsPageAppBar(),
                const PeopleDetailsBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
