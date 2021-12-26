import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await http.get(url);
    // print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('Loading Screen')),
    );
  }
}