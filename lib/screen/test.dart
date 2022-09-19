import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/helper/HorizontalScroll.dart';
import 'package:music_app/model/data.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Telur extends StatefulWidget {
  const Telur({super.key});

  @override
  State<Telur> createState() => _TelurState();
}

class _TelurState extends State<Telur> {
  List data = [];
  Future getData() async {
    final myResponse = await http.get(Uri.parse(
        "https://www.omdbapi.com/?s=thor&page=tt3896198&apikey=cff1bb9c"));

    final dataResponse = json.decode(myResponse.body);
    // data = dataResponse['Search'];
    Iterable list = dataResponse["Search"];
    data = list.toList();

    // setState(() {
    //   data1 = dataResponse;
    // });
    // print(list.to);
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshoot) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final dataUser = data[index];
                    print(dataUser);
                    return ListTile(
                      title: Text(dataUser['Title']),
                      leading: Container(
                        margin: EdgeInsets.all(1),
                        height: 800,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(dataUser['Poster']))),
                      ),
                    );
                  });
            }));
  }
}
