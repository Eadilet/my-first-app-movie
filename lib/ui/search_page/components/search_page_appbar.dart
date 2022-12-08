import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/search_movie/search_movie_bloc.dart';

class SearchPageAppbar extends StatelessWidget {
  const SearchPageAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController value = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 30,
          child: TextField(
            decoration: const InputDecoration(hintText: "Movie name"),
            controller: value,
          ),
        ),
        SizedBox(
          width: 50,
          height: 30,
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              BlocProvider.of<SearchMovieBloc>(context)
                  .add(FetchSearchingMovie(movieName: value.text));
            },
          ),
        ),
      ],
    );
  }
}
