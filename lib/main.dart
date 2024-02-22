import 'package:flutter/material.dart';
import 'package:passngers_recoder/recoder.dart';

void main() {

  var colorsscheem=ColorScheme.fromSeed(seedColor: const  Color.fromARGB(255, 93, 173, 207));
  var darkschrmrcolor=ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 5, 99, 125)); 

  runApp( MaterialApp(

    darkTheme: ThemeData.dark(
      useMaterial3: true).copyWith(
        colorScheme: darkschrmrcolor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme().copyWith(

            foregroundColor: darkschrmrcolor.primaryContainer,
            backgroundColor: Colors.white38),
        cardTheme: const  CardTheme().copyWith(
        //  color: const Color.fromARGB(74, 46, 129, 180),
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10)),
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkschrmrcolor.primaryContainer
          ) ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: darkschrmrcolor.primaryContainer
          
        )
      )


          

      ),
    theme: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white
      ),
      cardTheme: const  CardTheme().copyWith(
          color: const Color.fromARGB(74, 46, 129, 180),
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10)),
        colorScheme: ColorScheme.fromSeed(seedColor: const  Color.fromARGB(255, 93, 173, 207)),
        textTheme: const TextTheme().copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: const TextStyle(
              fontWeight: FontWeight.bold)),
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorsscheem.primaryContainer
          ) ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: colorsscheem.primaryContainer
          
        )
      )
        
       

     
    ),
    home: const Recoder(),

  )
);
}
