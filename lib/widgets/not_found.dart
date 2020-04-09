import 'package:flutter/material.dart';
class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    Key key,
    @required this.noData,
  }) : super(key: key);

  final bool noData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Visibility(
          visible: noData,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.error_outline,size: 50.0,color: Colors.black26,),

                Text('word not found',style: TextStyle(fontFamily: 'ContentFont',color:Colors.black38),)
              ],
            ),
          )),
    );
  }
}
