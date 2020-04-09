import 'package:flutter/material.dart';
import 'package:dictionaryapp/constants.dart';
import 'package:html/parser.dart' show parse;

class Definition extends StatelessWidget {
  final int index;
  final wordDetails;

  Definition({this.index, this.wordDetails});

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);

    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Type Text
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
          child: Text(
            '(${wordDetails[index]['type']}) ',
            style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Index Text
            Text(
              '${(index + 1).toString()}.  ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'ContentFont',
                  fontSize: 14.0),
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
        SizedBox(height: 3.0),

        //Example text
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            _parseHtmlString('${wordDetails[index]['eg'].toString()}')
                .replaceAll(new RegExp(r'[^\w\s]+'), ' '),
            style: kExampleTextStyle,
          ),
        ),

        Divider(
          height: 40.0,
//          thickness: 2.0,
        ),
      ],
    );
  }
}
