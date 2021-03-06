import 'package:flutter/material.dart';

const kTitleStyle = TextStyle(
  fontSize: 40.0,

  //fontWeight: FontWeight.w700,
  fontFamily: 'TitleFont',
);

const kSearchBoxDecoration = InputDecoration(
  filled: true,

  fillColor: Color(0xFFEAEAEA),
  hintText: 'search here',
  hintStyle: TextStyle(
    color: Colors.black26,
  ),
  prefixIcon: Icon(
    Icons.search,
    size: 30.0,
    color: Colors.black26,
  ),

  border: InputBorder.none,
);

const kCategoryTextStyle=TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
//  fontFamily: 'ContentFont',
);
const kDefinitionTextStyle=TextStyle(
  fontSize: 18.0,
  height: 1.2,
  fontFamily: 'ContentFont',
);

const kWordStyle=TextStyle(
  fontSize: 60.0,

  //fontWeight: FontWeight.w700,
  fontFamily: 'TitleFont',
);

const kExampleTextStyle= TextStyle(color: Colors.black54, fontStyle: FontStyle.italic);