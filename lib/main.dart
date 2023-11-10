import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_practice/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return   MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(textTheme: TextTheme(bodyMedium: GoogleFonts.bebasNeue(color: Colors.grey[900]))),
      home: WeatherPage()
    );
  }
}