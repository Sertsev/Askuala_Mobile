import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import './askualapallete.dart';
import 'package:askuala/button_widget.dart';
import 'package:askuala/navigation_drawer_widget.dart';


// to student dashboard
class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboard();
}

class _StudentDashboard extends State<StudentDashboard> {

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: const NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text("Dashboard", style: GoogleFonts.slabo27px(
            fontSize: 25,
            fontWeight: FontWeight.normal
      ),),
    ),
    body: Builder(
      builder: (context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            const SizedBox(height: 12),
            buildSearchField(),
          ],
        ),
          
        ),
    ),
  );

    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: AppBar(
    //     title: Text("Dashboard", style: GoogleFonts.akronim(
    //         fontSize: 40,
    //         fontWeight: FontWeight.normal),),
    //     toolbarHeight: 70,
    //     centerTitle: true,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         bottom: Radius.circular(20),
    //       ),
    //     ),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         SizedBox(
    //           height: 500,
    //           child: GridView.count(
    //             crossAxisCount: 2,
    //             children: [
    //             Container(
    //               height: 100,
    //               decoration: const BoxDecoration(
    //                 image: DecorationImage(
    //                   image: AssetImage('assets/img/courses.jpeg')
    //                 ),
    //
    //               ),
    //             ),
    //               const Text("Hello There", style: TextStyle(fontSize: 60),)
    //             ],
    //           ),
    //
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
}

Widget buildSearchField() {
  const color = Colors.white;

  return TextField(
    style: const TextStyle(color: color),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: const TextStyle(color: color),
      prefixIcon: const Icon(Icons.search, color: color),
      filled: true,
      fillColor: Colors.white12,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
    ),
  );
}