import 'dart:async';

import 'package:ciclo_helper/model/manual.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ManualScreen extends StatefulWidget{
  final Manual manual;


  ManualScreen({this.manual});

  @override
  _ManualScreenState createState() => _ManualScreenState();

}

class _ManualScreenState extends State<ManualScreen>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.manual.titulo),
      ),
      body: WebView(
        initialUrl: widget.manual.siteUrl,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

//class _ManualScreenState extends State<ManualScreen> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Html(
//  data: """
//    <div>
//      <h1>Bike</h1>
//      <p>Minha bike é mt bem cuidada</p>
//      <h2>Motivos</h2>
//      <p>pq eu lavo com sabão. lave a sua também.</p>
//    </div>
//  """,
//  //Optional parameters:
//  padding: EdgeInsets.all(8.0),
//  backgroundColor: Colors.white,
//  defaultTextStyle: TextStyle(
//    fontFamily: 'serif',
//    color: Colors.blueAccent,
//    ),
//  linkStyle: const TextStyle(
//    color: Colors.blueAccent,
//    ),
//  );}
}