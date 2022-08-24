import 'package:flutter/material.dart';
import 'package:inventario/frames/pagescontainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventário',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.deepPurple.shade200,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[600],
          opacity: 1,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        cardColor: Colors.purple.shade200,
        backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        dialogBackgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[600],
          opacity: 1,
        )
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: PagesContainer(),
    );
  }
}
