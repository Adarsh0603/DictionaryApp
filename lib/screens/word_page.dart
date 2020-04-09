import 'package:dictionaryapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dictionaryapp/widgets/back_button.dart';
import 'package:dictionaryapp/widgets/definition_list_view.dart';

class WordPage extends StatelessWidget {
  final wordDetails;
  final word;

  WordPage({this.wordDetails, this.word});

  List<Column> definitions() {
    List<Column> definitions = [];
    for (var word in wordDetails) {
      String singleDefinition = word['def'];

      var oneDefinition = Column(
        children: <Widget>[
          Text(
            singleDefinition,
            style: kDefinitionTextStyle,
          ),
          Divider(),
        ],
      );
      definitions.add(oneDefinition);
    }
    return definitions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackSearchButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    word,
                    // wordDetails['word'],
                    style: kWordStyle,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Text(
                      'DEFINITIONS',
                      style: kCategoryTextStyle,
                    ),
                    SizedBox(width: 3.0),
                    Text(
                      wordDetails.length.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: DefinitionsListView(wordDetails: wordDetails),
                ),
              ],
            ),
          ),
        ));
  }
}
