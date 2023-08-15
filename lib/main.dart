import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/portfolioView/portfolioView.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          displayMedium: GoogleFonts.montserrat(
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}


