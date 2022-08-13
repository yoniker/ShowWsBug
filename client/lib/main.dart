import 'dart:io';

import 'package:flutter/material.dart';
import 'package:websocket_client/websocket_service.dart';

class MyHttpOverrides extends HttpOverrides{ //We are using a self-signed certificate - so make Flutter accept it anyways (we want a self-containing example).
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
  super.key,
  required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String allMessages='';

  @override
  void initState() {
    ServiceWebsocket.instance.stream.listen((message) {
      setState(() {
        allMessages+=message.toString();
      }); });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text(allMessages),)
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      //ServiceWebsocket.instance.stream.;
    }
  }

  @override
  void dispose() {
    //_channel?.sink.close();
    _controller.dispose();
    super.dispose();
  }
}