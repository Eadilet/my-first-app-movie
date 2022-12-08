import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/const/api_const/text_const/text_const.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/logic/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_app/ui/movie_detail/movie_detail_page.dart';

class UpcomingMoive extends StatelessWidget {
  const UpcomingMoive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingBloc, UpcomingState>(
      builder: (context, state) {
        if (state is UpcomingInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UpcomingFailed) {
          return const Center(child: Text("Something went wrong"));
        }
        if (state is UpcomingSuccess) {
          if (state.upComingMovie.isEmpty) {
            return const Center(child: Text("No movies"));
          }
          return _buildupComingMovies(state);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildupComingMovies(UpcomingSuccess state) {
    List<Movie> upComingMovie = state.upComingMovie;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: upComingMovie.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailPage(id: upComingMovie[index].id),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${upComingMovie[index].backdrop_path}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    upComingMovie[index].title.toString(),
                    style: name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
