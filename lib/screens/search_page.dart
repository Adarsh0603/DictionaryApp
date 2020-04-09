import 'package:dictionaryapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:dictionaryapp/services/NetworkHelper.dart';
import 'package:dictionaryapp/screens/word_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  void searchWord(String word) async{
    NetworkHelper networkHelper = NetworkHelper();
    List<Map> wordDetails=await networkHelper.getData(word);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => WordPage(wordDetails),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF6f6f6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dictionary',
              style: kTitleStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.0,
              ),
              cursorColor: Colors.grey,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {

                searchWord(value);
              },
              decoration: kSearchBoxDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
