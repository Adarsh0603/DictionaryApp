import 'package:dictionaryapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:dictionaryapp/services/NetworkHelper.dart';
import 'package:dictionaryapp/screens/word_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:dictionaryapp/widgets/not_found.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool loading = false;
  bool noData = false;

  void searchWord(String word) async {
    NetworkHelper networkHelper = NetworkHelper();

    List<Map> wordDetails = await networkHelper.getData(word);
    loading = false;

    if (wordDetails == null) {
      setState(() {
        noData = true;
      });
    } else {
      noData = false;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                WordPage(wordDetails: wordDetails, word: word),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      color: Colors.black26,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.black12,
        strokeWidth: 0.6,
      ),
      opacity: 0.2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF6f6f6),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
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
                onTap: (){
                  setState(() {
                    noData=false;
                  });
                },
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.0,
                  fontFamily: 'ContentFont',
                ),
                cursorColor: Colors.grey,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  setState(() {
                    loading = true;
                  });

                  searchWord(value);
                },
                decoration: kSearchBoxDecoration,
              ),
              NotFoundWidget(noData: noData),
            ],
          ),
        ),
      ),
    );
  }
}
