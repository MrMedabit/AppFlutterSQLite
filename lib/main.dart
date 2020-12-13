import 'package:flutter/material.dart';
import 'package:app_libreria/librosConsulta.dart';
import 'package:app_libreria/librosCrear.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: LibroConsulta.ROUTE,
        routes: {
          LibroConsulta.ROUTE: (_) => LibroConsulta(),
          LibroCrear.ROUTE: (_) => LibroCrear(),
        },
        theme: ThemeData(primaryColor: Colors.indigo[900]));
  }
}
