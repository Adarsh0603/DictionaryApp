import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'services/NetworkHelper.dart';
import 'screens/search_page.dart';

void main() => runApp(DictionaryApp());

class DictionaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SearchPage(),
    );
  }
}
