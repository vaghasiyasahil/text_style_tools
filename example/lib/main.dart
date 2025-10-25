import 'package:flutter/material.dart';
import 'package:text_style_tools/text_style_tools.dart';

void main() {
  runApp(
    MaterialApp(home: const HomePage(), debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Style Tools"),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          homeTile("Sentence", "hello, my name is sahil.".toSentenceCase()),
          homeTile("Title", "hello, my name is sahil.".toTitleCase()),
          homeTile("camelCase", "hello, my name is sahil.".toCamelCase()),
          homeTile("UPPER", "hello, my name is sahil.".toUpperCaseExt()),
          homeTile("lower", "HELLO, MY NAME IS SAHIL.".toLowerCaseExt()),
        ],
      ),
    );
  }
}

Widget homeTile(String title, String subTitle) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      tileColor: Colors.teal,
      title: Text(title),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      subtitle: Text(subTitle),
      subtitleTextStyle: TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}
