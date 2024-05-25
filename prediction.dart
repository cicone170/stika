import 'package:flutter/material.dart';
import 'package:hack/bottom_bar.dart';
import 'package:hack/new_consultation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
String responseText = '';
class PredictionPage extends StatefulWidget {
  final list;
  const PredictionPage({super.key , required this.list});
  @override
  State<PredictionPage> createState() {
    return _PredictionPageState();
  }
}

class _PredictionPageState extends State<PredictionPage> {
  Future<Map<String, dynamic>> sendImage() async {


    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:5000/upload'));

    var response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      setState(() {
        responseText = responseString;
      });
      return Map<String, dynamic>.from(json.decode(responseString));

      //print(responseBody);
    } else {
      print('Failed to upload image. Error code: ${response.statusCode}');
      return {};
    }
  }
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 1.5,
          ),
        ),
        backgroundColor: const Color(0xff1679AB),
        foregroundColor: Colors.white,
        title: const Text(
          "Consultaions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(
        2,
        scrollController: scrollController,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(""),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Suivant",
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
