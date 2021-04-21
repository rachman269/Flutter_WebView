import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(Rachman());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: new WebView(
            initialUrl: "https://portfolio.rachman.dev",
            javascriptMode: JavascriptMode.unrestricted,
            // onPageFinished: (String url) {
            //   print("Page Finished Loading");
            // },
            // onWebResourceError: (WebResourceError error) {
            //   print("error");
            // },
          ),
        ),
      ),
      title: "Portfolio Rachman",
      debugShowCheckedModeBanner: false,
    );
  }
}

class Rachman extends StatefulWidget {
  @override
  _RachmanState createState() => _RachmanState();
}

class _RachmanState extends State<Rachman> {
  WebViewController controller;
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          String url = await controller.currentUrl();
          if (url == "https://portfolio.rachman.dev") {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          body: Container(
            child: SafeArea(
              child: new WebView(
                  initialUrl: "https://portfolio.rachman.dev",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc) {
                    controller = wc;
                  }),
            ),
          ),
        ),
      ),
      title: "Portfolio Rachman",
      debugShowCheckedModeBanner: false,
    );
    return materialApp;
  }
}
