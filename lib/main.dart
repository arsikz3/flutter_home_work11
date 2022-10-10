import 'package:flutter/material.dart';
import 'package:flutter_home_work11/space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  const HomeView({Key? key, required this.title}) : super(key: key);

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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Hero(
                                  tag: spaces[index].id,
                                  child: SizedBox(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        spaces[index].image,
                                        fit: BoxFit.fitWidth,
                                      ))),
                              Hero(
                                tag: '${spaces[index].id}text',
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Material(
                                    color: Colors.grey,
                                    child: Text(
                                      spaces[index].description,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            //left: 100,
                            //top: 35,
                            right: 20,
                            bottom: 20,
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.yellow,
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            }));
  }
}

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Hero(tag: space.id, child: Image.asset(space.image)),
            Hero(
              tag: '${space.id}text',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(child: Text(space.description)),
              ),
            )
          ],
        ));
  }
}
