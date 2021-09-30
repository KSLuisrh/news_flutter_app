import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img = Get.arguments[0]['imgUrl'];
    String title = Get.arguments[0]['title'];
    String description = Get.arguments[0]['description'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Detail screen'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 300.0,
                child: Ink.image(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(title),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(description),
              ),
              Expanded(
                child: Container(),
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 60)), onPressed: (){}, child: Text('Watch Video'))
            ],
          ),
        ));
  }
}
