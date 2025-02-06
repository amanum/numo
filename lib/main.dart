import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numo/ui/screen/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // fontFamily: GoogleFonts.comicNeue().toString(),
        textTheme: GoogleFonts.montserratTextTheme(),
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Colors.grey[200],
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide.none,
        //   ),
        //   hintStyle: TextStyle(color: Colors.grey),
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //
        //   ),
        // ),
      ),
      home: MainScreen(),
    );
  }
}
