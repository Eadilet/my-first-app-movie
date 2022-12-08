import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/connectivity/connectivity_bloc.dart';

import 'package:movie_app/ui/homepage/components/home_page_appbar.dart';
import 'package:movie_app/ui/homepage/components/home_page_no_connection.dart';
import 'package:movie_app/ui/homepage/components/home_page_popular_persons.dart';
import 'package:movie_app/ui/homepage/components/home_page_slider.dart';
import 'package:movie_app/ui/homepage/components/home_page_upcoming.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityStateSuccessed) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: ListView(
                children: [
                  const HomePageAppBar(),
                  const HomePageSlider(),
                  const UpcomingMoive(),
                  const PopularPersons(),
                ],
              ),
            ),
          );
        }
        return const HomePageNoConnection();
      },
    );
  }
}
