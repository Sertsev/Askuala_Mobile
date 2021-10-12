import 'package:askuala/askualapallete.dart';
import 'package:flutter/material.dart';

class Forums extends StatelessWidget {
  const Forums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: const Text('Forums'),
      centerTitle: true,
      backgroundColor: AskualaPalette.askualadark,
    ),
  );
}