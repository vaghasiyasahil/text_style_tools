import 'package:flutter/material.dart';
import 'package:text_style_tools/text_style_tools.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("hello, my name is sahil.".toSentenceCase()),
          Text("hello, my name is sahil.".toTitleCase()),
          Text("hello, my name is sahil.".toCamelCase()),
          Text("hello, my name is sahil.".toUpperCaseExt()),
          Text("HELLO, MY NAME IS SAHIL.".toLowerCaseExt()),
        ],
      ),
    );
  }
}