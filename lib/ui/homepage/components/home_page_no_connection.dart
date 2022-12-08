import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/bloc/connectivity/connectivity_bloc.dart';

class HomePageNoConnection extends StatelessWidget {
  const HomePageNoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Icon(Icons.wifi_off),
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ConnectivityBloc>(context)
                .add(CheckConnectionEvent());
          },
          child: const Center(
            child: Text("Повторить"),
          ),
        ),
      ],
    );
  }
}
