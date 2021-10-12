import 'package:flutter/material.dart';

class AskualaPalette {
  static const MaterialColor askualadark = MaterialColor(
    0xff5b0a36, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
     <int, Color>{
       50: Color(0xff520931),//10%
       100: Color(0xff49082b),//20%
       200: Color(0xff400726),//30%
       300: Color(0xff370620),//40%
       400: Color(0xff2e051b),//50%
       500: Color(0xff240416),//60%
       600: Color(0xff1b0310),//70%
       700: Color(0xff12020b),//80%
       800: Color(0xff090105),//90%
       900: Color(0xff000000),//100%
    },
  );
} // you can define define in