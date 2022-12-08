import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/logic/bloc/search_movie/search_movie_bloc.dart';
import 'package:movie_app/ui/movie_detail/movie_detail_page.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, SearchMovieSearched>(
      builder: (context, state) {
        if (state.searchingMovies.isEmpty) {
          return const Center(
            child: Text("Search Movie"),
          );
        }
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.searchingMovies.isNotEmpty) {
          return _searchingMovie(state, context);
        }
        return const Center(
          child: Text("Search Movie"),
        );
      },
    );
  }

  Widget _searchingMovie(SearchMovieSearched state, BuildContext context) {
    final List<Movie> movies = state.searchingMovies;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetailPage(id: movies[index].id),
              ));
            },
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${movies[index].backdrop_path}"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ListTile(
                    title: Text(
                      movies[index].original_title.toString(),
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
