import 'package:flutter/material.dart';
import 'definition.dart';
class DefinitionsListView extends StatelessWidget {
  final wordDetails;



  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: wordDetails.length,
      itemBuilder: (context, index) {
        return Definition(index: index,wordDetails: wordDetails);
      },
    );
  }

  DefinitionsListView({this.wordDetails});
}

