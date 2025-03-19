import 'package:flutter/material.dart';
import 'login_page.dart';
import 'converter_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Konversi Suhu',
      home: LoginPage(),
    );
  }
}
