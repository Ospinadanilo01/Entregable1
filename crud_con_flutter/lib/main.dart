import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicacion con Flutter',
      home: Home_Page("Inventario de Productos en lista"),
      color: Color.fromARGB(255, 1, 160, 49),
    );
  }
}
