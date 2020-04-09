import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  String _token = '557aae5b53fb2dadc0fec74ee944cdc6ef704e05';
  String url = 'https://owlbot.info/api/v4/dictionary/';

  Future<List<Map>> getData(String word) async {
    Response response =
        await get(url + word, headers: {'Authorization': 'Token ' + _token});
    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body);

        List<Map> definitions = [];
        for (int i = 0; i < jsonResponse['definitions'].length; i++) {
          var oneDefinition = {
            'def': jsonResponse['definitions'][i]['definition'],
            'type': jsonResponse['definitions'][i]['type'],
            'eg': jsonResponse['definitions'][i]['example'],
          };
definitions.add(oneDefinition);
        }

//        Map<String, Map> wordDetail = {
//          'word': jsonResponse['word'],
//          'type': jsonResponse['definitions'][0]['type'],
//          'definition': jsonResponse['definitions'][0]['definition'],
//          'example': jsonResponse['definitions'][0]['example'],
//        };

        return definitions;
      } catch (e) {
        print(e);
      }
    } else {
      print('Cannot Find the word');
    }
    return null;
  }
}
