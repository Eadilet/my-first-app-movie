import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/logic/cubit/them_cubit/theme_mode_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeModeCubit, ThemeData>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              child: Row(
                children: [
                  const Text("Dark theme"),
                  ElevatedButton(
                      onPressed: () =>
                          context.read<ThemeModeCubit>().toggleTheme(),
                      child: const Text("chandge theme"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
