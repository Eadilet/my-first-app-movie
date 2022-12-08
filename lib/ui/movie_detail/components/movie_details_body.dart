import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/movie_details/movie_details_bloc.dart';

import '../../../const/api_const/text_const/text_const.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieDetailsFailed) {
          return const Center(
            child: Text("There was error"),
          );
        }
        if (state is MovieDetailsLoaded) {
          return _buildMovieDetailsBody(state, context);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildMovieDetailsBody(
      MovieDetailsLoaded state, BuildContext context) {
    final movie = state.movie;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.backdrop_path}'),
            ),
          ),
        ),
        Center(
          child: Text(
            "${movie.title}",
            style: name,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "GENRES",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.genres!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    "${movie.genres![index].name}",
                    style: genresName,
                  ),
                ),
              );
            },
          ),
        ),
        Text(
          "${movie.overview}",
          style: const TextStyle(letterSpacing: 0.3),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 20,
          ),
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    "${movie.release_date}",
                    style: genresName,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.thumb_up, size: 10),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "${movie.popularity}",
                        style: genresName,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    "${movie.vote_average}",
                    style: genresName,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    "${movie.vote_count}",
                    style: genresName,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text(
          "CASTS",
          style: TextStyle(letterSpacing: 0.3),
        ),
      ],
    );
  }
}
