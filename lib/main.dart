import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // More than 30, makes the page unresponsive
  final htmlElementViewCount = 20;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < htmlElementViewCount; i++) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        i.toString(),
        (int viewId) => DivElement()..innerHtml = 'Text',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < htmlElementViewCount; i++) ...{
                SizedBox(
                  height: 400,
                  child: HtmlElementView(viewType: i.toString()),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
