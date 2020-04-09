import 'package:dictionaryapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dictionaryapp/widgets/back_button.dart';

import 'package:html/parser.dart' show parse;

class WordPage extends StatelessWidget {
  final wordDetails;

  WordPage(this.wordDetails);

  List<Widget> definitions(){
    List<Text> definitions=[];
    for(int i=0;i<wordDetails.length;i++) {
      var oneDefinition = Text(
        wordDetails[i]['def'],
        style: kDefinitionTextStyle,
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
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackSearchButton(),
                Text(
                  wordDetails['word'],
                  style: kTitleStyle,
                ),
                SizedBox(height: 20.0),
                Text(
                  'DEFINITIONS',
                  style: kCategoryTextStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Column(
                  children: definitions(),
                ),
                SizedBox(height: 20.0),
                Text(
                  'EXAMPLE',
                  style: kCategoryTextStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                 wordDetails['example'],
                  style: kDefinitionTextStyle,
                ),
              ],
            ),
          ),
        ));
  }
}
//                Text(
//                  wordDetails['definition'],
//                  style: kDefinitionTextStyle,
//                ),