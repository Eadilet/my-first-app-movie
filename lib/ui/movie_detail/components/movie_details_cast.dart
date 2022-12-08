import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/cast/cast_bloc.dart';

import 'package:movie_app/ui/people_details_page/people_details_page.dart';

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CastFailed) {
          return const Center(
            child: Text("There was error"),
          );
        }
        if (state is CastLoaded) {
          if (state.cast.isEmpty) {
            return const Center(
              child: Text("No cast"),
            );
          }
          return _buildMovieDetailsCast(state, context);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildMovieDetailsCast(CastLoaded state, BuildContext context) {
    final cast = state.cast;
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PeopleDetailsPage(id: cast[index].id)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${cast[index].profile_path}'),
                      onError: (exception, stackTrace) => const Text('Warning'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    "${cast[index].character} - ${cast[index].name}",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
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
