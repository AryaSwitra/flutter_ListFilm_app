import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/model/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detail extends StatefulWidget {
  final String? idMovie;
  final String? poster;
  final String? title;

  const Detail({
    super.key,
    required this.idMovie,
    required this.poster,
    required this.title,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future getData() async {
    try {
      var myResponse = await http.get(Uri.parse(
          "https://www.omdbapi.com/?i=${widget.idMovie}&apikey=cff1bb9c"));

      if (myResponse.statusCode == 200) {
        final dataResponse = json.decode(myResponse.body);

        return dataResponse;
      }
    } catch (e) {
      print((e).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // final String title = widget.title.toString();
    // final String poster = widget.poster.toString();
    // final String idMovie = widget.idMovie.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshoot) {
            if (snapshoot.connectionState == ConnectionState.waiting ||
                snapshoot.hasError) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshoot.data != null) {
                return Container(
                  child: Text(snapshoot.data['Title']),
                );
              } else {
                return Center(child: Text('Koneski Terputus'));
              }
            }
          }),
    );
  }
}
