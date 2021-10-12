import 'package:flutter/material.dart';
import 'package:askuala/askualapallete.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserProfile({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: AskualaPalette.askualadark,
      title: Text(name),
      centerTitle: true,
    ),
    body: Image.network(
      urlImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}