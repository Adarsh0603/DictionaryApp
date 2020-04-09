import 'package:dictionaryapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dictionaryapp/widgets/back_button.dart';

import 'package:html/parser.dart' show parse;

class WordPage extends StatelessWidget {
  final wordDetails;

  WordPage(this.wordDetails);

  Widget definitionListView(BuildContext context) {
    return ListView.builder(
      itemCount: wordDetails.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(wordDetails[index]['def']),
        );
      },
    );
  }

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
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackSearchButton(),
                Text(
                  'dummy',
                  // wordDetails['word'],
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
                Expanded(
                  child: DefinitionsListView(wordDetails: wordDetails),
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
                  'dummy',
                  //  wordDetails['example'],
                  style: kDefinitionTextStyle,
                ),
              ],
            ),
          ),
        ));
  }
}

class DefinitionsListView extends StatelessWidget {
  final wordDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wordDetails.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Type Text
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '(${wordDetails[index]['type']}) ',
                style:
                    TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 3.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Index Text
                Text(
                  '${(index + 1).toString()}. ',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),

                //Definition Text
                Expanded(
                  child: Text(
                    wordDetails[index]['def']
                        .toString()
                        .replaceAll(new RegExp(r'[^\w\s]+'), ''),
                    style: kDefinitionTextStyle,
                  ),
                ),
              ],
            ),
           //Example text
            Text(
              '    Eg.- ${wordDetails[index]['eg'].toString().replaceAll(new RegExp(r'[^\w\s]+'), ' ')}',
              style: TextStyle(color:Colors.black54,fontStyle: FontStyle.italic),
            ),

            Divider(),
          ],
        );
      },
    );
  }

  DefinitionsListView({this.wordDetails});
}
