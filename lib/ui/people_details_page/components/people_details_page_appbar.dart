import 'package:flutter/material.dart';

class PeopleDetailsPageAppBar extends StatelessWidget {
  const PeopleDetailsPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomLeft,
      width: width,
      height: 50,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
