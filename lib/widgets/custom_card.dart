import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/detail_screen.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    this.title = '',
    this.type = '',
    this.description = '',
    this.imgUrl = '',
    this.siteName = '',
  });

  final String title;
  final String type;
  final String description;
  final String imgUrl;
  final String siteName;

  @override
  Widget build(BuildContext context) {
    var heading = title;
    var subheading = siteName;
    var cardImage = NetworkImage(imgUrl);
    var supportingText = description;
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 300.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {Get.to(DetailScreen(), arguments: [{'title': title, 'description': description, 'imgUrl': imgUrl}]);},
                )
              ],
            )
          ],
        ));
  }
}
