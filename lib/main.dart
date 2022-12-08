import 'package:flutter/material.dart';

import 'package:movie_app/data/repository/tdbmovie_repository.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';
import 'package:movie_app/logic/bloc/connectivity/connectivity_bloc.dart';
import 'package:movie_app/logic/bloc/movie/movie_bloc.dart';
import 'package:movie_app/logic/bloc/people/bloc/people_bloc.dart';
import 'package:movie_app/logic/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_app/logic/cubit/them_cubit/theme_mode_cubit.dart';
import 'package:movie_app/ui/homepage/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MovieRepository movieRepository =
      MovieRepository(tmdbApiClient: TMDBApiClient());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeModeCubit()),
        BlocProvider(
            create: (context) =>
                ConnectivityBloc()..add(CheckConnectionEvent())),
        BlocProvider(
          create: (context) =>
              MovieBloc(movieRepository: movieRepository)..add(FetchMovie()),
        ),
        BlocProvider(
          create: (context) => UpcomingBloc(movieRepository: movieRepository)
            ..add(FetchUpComingMovie()),
        ),
        BlocProvider(
          create: (context) => PeopleBloc(movieRepository: movieRepository)
            ..add(FetchPopularPeopleEvent()),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
