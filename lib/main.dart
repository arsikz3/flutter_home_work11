import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_home_work11/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: spaces.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              space: spaces[index],
                            )),
                  );
                },
                child: Card(
                    shadowColor: Colors.red,
                    color: Colors.grey,
                    child: Hero(
                      tag: spaces[index].id,
                      child: Column(
                        children: [
                          Image.asset(spaces[index].image),
                          Text(spaces[index].description),
                        ],
                      ),
                    )),
              );
            }));
  }
}

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage({Key? key, required Space this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(tag: space.id, child: Image.asset(space.image)));
  }
}
