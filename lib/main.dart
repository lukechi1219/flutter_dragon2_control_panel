import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _iframeWidget;

  ///
  /// https://github.com/AseemWangoo/experiments_with_web/blob/master/lib/iframe/iframe.dart
  ///
  /// https://github.com/AseemWangoo/experiments_with_web/tree/master/lib
  ///
  /// https://flatteredwithflutter.com/flutter-web-and-iframe/
  ///
  /// https://dev.to/aseemwangoo/flutter-web-and-iframe-n2d

  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    _iframeElement.src = 'https://www.youtube.com/embed/DDU-rZs-Ic4?autoplay=1';
    _iframeElement.style.border = 'none';
    _iframeElement.allow =
        'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  uiBlock(
                    title: 'Crew',
                    value: 'DRAGON',
                  ),
                  uiBlock(
                    title: 'Perigee',
                    value: '185.013m',
                  ),
                  uiBlock(
                    title: 'Apogee',
                    value: '360.304m',
                  ),
                  uiBlock(
                    title: 'Relative Altitude',
                    value: '50,948m',
                  ),
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.blueGrey,
                child: _iframeWidget,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  uiBlock(
                    title: 'Day 131',
                    value: '13:46:11',
                  ),
                  uiBlock(
                    value: '625,713m',
                  ),
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  uiBlock(
                    value: '0 ALARMS, ALL SYSTEMS NORMAL',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  uiBlock(
                    title: 'Range to ISS',
                    value: '625,713m',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded uiBlock({
    String title,
    @required String value,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            (title != null)
                ? widthExpanded(
                    Colors.grey,
                    Text(
                      title,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                : Container(),
            widthExpanded(
              Colors.blueGrey,
              Text(
                value,
                style: TextStyle(fontSize: 24),
              ),
              2,
            ),
          ],
        ),
      ),
    );
  }

  Expanded widthExpanded(Color _color, Text _child, [int _flex]) {
    return Expanded(
      flex: _flex,
      child: Container(
        color: _color,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: _child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
