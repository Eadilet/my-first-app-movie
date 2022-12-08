import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/people_details/people_details_bloc.dart';

import 'package:movie_app/const/api_const/text_const/text_const.dart';

class PeopleDetailsBody extends StatelessWidget {
  const PeopleDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleDetailsBloc, PeopleDetailsState>(
      builder: (context, state) {
        if (state is PeopleDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PeopleDetailsFailed) {
          return const Center(child: Text("Failed "));
        }
        if (state is PeopleDetailsLoaded) {
          return _peopleDetailsBody(state, context);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _peopleDetailsBody(PeopleDetailsLoaded state, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final popularPeople = state.peopleDetails;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${popularPeople.profile_path}'),
              ),
            ),
          ),
          SizedBox(
            child: ListTile(
              title: Text(
                popularPeople.name,
                style: name,
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                    "${popularPeople.birthday} - ${popularPeople.place_of_birth}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
