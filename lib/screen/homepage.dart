// ignore_for_file: unnecessary_import, implementation_imports, non_constant_identifier_names, avoid_print, prefer_const_constructors, unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/helper/HorizontalScroll.dart';
import 'package:music_app/helper/repository.dart';
import 'package:music_app/model/data.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:music_app/screen/detailpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String firstHalf;
  late String secondHalf;
  bool flag = false;
  AppBar MyAppBar = AppBar();
  List<Data> dataMovie = [];
  Repository repository = Repository();

  getData() async {
    dataMovie = await repository.getDataListMovie();
  }

  @override
  Widget build(BuildContext context) {
    double bodyHight = MediaQuery.of(context).size.height -
        MyAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double bodyWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.home),
                        onPressed: () {}),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                // Spacer(),
                Column(
                  children: [
                    IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.movie),
                        onPressed: () {}),
                    Text(
                      'Film',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {}),
                    Text(
                      'Calender',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.account_circle),
                        onPressed: () {}),
                    Text(
                      'Account',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          )),
      appBar: AppBar(
        leadingWidth: 110,
        leading: SizedBox(
          //   height: 300,
          //   width: 900,
          child: Image.asset('assets/logo.png'),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.all(40),
          height: 40,
          width: bodyWidht * 0.9,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 117, 115, 115),
              borderRadius: BorderRadius.circular(20)),
          child: const TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 12.90),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                // hoverColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: bodyWidht,
              padding: const EdgeInsets.all(30),
              // color: Color.fromARGB(123, 18, 18, 19),
              child: Row(
                children: [
                  Text(
                    'In Theaters',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'On TV',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 117, 115, 115)),
                  )
                ],
              ),
            ),
            Container(
              height: bodyHight * 1.0,
              // width: bodyWidht,
              // color: Colors.red,
              child: ScrollConfiguration(
                behavior: MyCustomeScrollBehavior(),
                child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshoot) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataMovie.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 12,
                            );
                          },
                          itemBuilder: (((context, index) {
                            // print(datas[index]);
                            final singleData = dataMovie[index];
                            // print(singleData.title.length);
                            if (singleData.title.length > 50) {
                              firstHalf = singleData.title.substring(0, 50);
                              secondHalf = singleData.title
                                  .substring(50, singleData.title.length);
                            } else {
                              firstHalf = singleData.title;
                              secondHalf = "";
                            }
                            return GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          idMovie: singleData.id,
                                          poster: singleData.image,
                                          title: singleData.title)),
                                );
                              }),
                              child: Column(
                                children: [
                                  Container(
                                    // padding: EdgeInsets.all(1),
                                    margin: EdgeInsets.all(10),
                                    height: 250,
                                    width: 200,
                                    // color: Colors.amber,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 22, 22, 22),
                                              blurRadius: 5,
                                              spreadRadius: 10,
                                              offset: Offset(0, 10))
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            // alignment: Alignment.bottomCenter,
                                            image: NetworkImage(
                                                singleData.image))),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(15),
                                      height: 250,
                                      width: 200,
                                      child: secondHalf.isEmpty
                                          ? Text(
                                              firstHalf,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          : Column(
                                              children: [
                                                new Text(
                                                  singleData.isShow
                                                      ? (firstHalf + "...")
                                                      : (firstHalf +
                                                          secondHalf),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                new InkWell(
                                                  child: new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      new Text(
                                                        singleData.isShow
                                                            ? "show more"
                                                            : "show less",
                                                        style: new TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      // flag = !flag;
                                                      // singleData.isShow = flag;
                                                      singleData.isShow =
                                                          !singleData.isShow;
                                                      flag = singleData.isShow;
                                                    });
                                                    print(singleData.isShow);
                                                  },
                                                ),
                                              ],
                                            )),
                                ],
                              ),
                            );
                          })));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
