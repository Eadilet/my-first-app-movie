import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/people/bloc/people_bloc.dart';
import 'package:movie_app/ui/people_details_page/people_details_page.dart';

class PopularPersons extends StatelessWidget {
  const PopularPersons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        if (state is PeopleInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PeopleFailed) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (state is PeopleSuccess) {
          if (state.persons.isEmpty) {
            return const Text(
              "No popular actors",
            );
          }
          return _buildPopularPeople(state);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  _buildPopularPeople(PeopleSuccess state) {
    final popularPeoples = state.persons;
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularPeoples.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PeopleDetailsPage(
                        id: popularPeoples[index].id,
                      )));
            },
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 150,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${popularPeoples[index].profile_path}'),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) =>
                          const Icon(Icons.warning),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Text(popularPeoples[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}
