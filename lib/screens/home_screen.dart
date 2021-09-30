import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/widgets/custom_card.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse('https://codesundar.com/wp-json/wp/v2/posts'),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["id"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                imgUrl: data[index]["yoast_head_json"]['og_image'][0]['url']
                    .toString(),
                title: data[index]["yoast_head_json"]['title'],
                description: data[index]["yoast_head_json"]['og_description'],
                siteName: data[index]["yoast_head_json"]['og_site_name'],
              );
            }));
  }
}
