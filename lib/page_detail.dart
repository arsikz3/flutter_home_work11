import 'package:flutter/material.dart';
import 'package:flutter_home_work11/space.dart';

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
