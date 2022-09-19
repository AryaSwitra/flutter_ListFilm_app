import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/model/data.dart';

class Repository {
  final _baseUrlListMovie =
      'https://www.omdbapi.com/?s=thor&page=tt3896198&apikey=cff1bb9c';

  Future getDataListMovie() async {
    try {
      final response = await http.get(Uri.parse(_baseUrlListMovie));
      if (response.statusCode == 200) {
        Iterable list = jsonDecode(response.body)['Search'];
        List<Data> data = list.map((e) => Data.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
