import 'package:flutter/material.dart';

class BackSearchButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
splashColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.arrow_back_ios,color: Colors.blue,),
          SizedBox(width: 10.0),
          Text('Search',style: TextStyle(fontSize: 20.0,color: Colors.blue,fontWeight: FontWeight.w300),),
        ],
      ),
    );
  }
}
