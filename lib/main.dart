import 'package:calorie/kullan%C4%B1c%C4%B1.dart';
import 'package:flutter/material.dart';
import 'anasayfa.dart';
import 'giris.dart';
import 'uyelik.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Üyelik ve Giriş',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => AnaSayfa(),
        '/üyelik': (context) => UyelikSayfasi(),
        '/giriş': (context) => GirisSayfasi(),
        '/kullanici': (context) => KullaniciSayfasi(),
      },
    );
  }
}
