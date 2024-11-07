import 'package:flutter/material.dart';
import 'FirstScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Previewer",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(95, 75, 135, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle:
          TextStyle(fontSize: 14, color: Color.fromRGBO(95, 75, 135, 1)),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color.fromRGBO(95, 75, 135, 1), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color.fromRGBO(95, 75, 135, 1),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              textStyle: const TextStyle(fontSize: 15),
              foregroundColor: const Color.fromRGBO(92, 73, 134, 1),
            )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(95, 75, 135, 1),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(50)
              ),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 15),
            ),
        ),
         sliderTheme: const SliderThemeData(
          activeTrackColor: Color.fromRGBO(92, 73, 134, 1),
          thumbColor: Color.fromRGBO(92, 73, 134, 1),
          valueIndicatorColor: Color.fromRGBO(92, 73, 134, 1),
        ),
      ),
      home: FirstScreen(),
    );
  }
}

