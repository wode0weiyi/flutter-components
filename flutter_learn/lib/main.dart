import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/demo.dart';
import 'package:flutter_learn/expand_text.dart';
import 'package:flutter_learn/provider/Counters.dart';
import 'package:flutter_learn/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_learn/home.dart';

void main() {
  var themeProvider = ThemeProvider();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: Counter()),
      ChangeNotifierProvider.value(value: ThemeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget home;
  final ThemeData theme;

  const MyApp({Key key, this.home, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theme',
      theme: ThemeProvider().getTheme(),
      darkTheme: ThemeProvider().getTheme(isDarkMode: true),
      home: DemoDart(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '调原生',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      body: Container(
        height: 100,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Provider.of<Counter>(context, listen: false).increment();
                },
                child: Text(
                  '动态改变颜色色值${Provider.of<Counter>(context).count}',
                  style: Provider.of<ThemeProvider>(context).style18,
                )
                // UiKitView(
                //   viewType: 'com.flutter_to_native_test_textview',
                //   creationParams: {'content': '我是flutter传过来的数据'},
                //   creationParamsCodec: new StandardMessageCodec(),
                //   gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                //     new Factory<OneSequenceGestureRecognizer>(
                //         () => new EagerGestureRecognizer())
                //   ].toSet(),
                // ),
                ),
            IconButton(
                icon: Icon(Icons.archive),
                onPressed: () {
                  List<Color> colors = [
                    Colors.red,
                    Colors.teal,
                    Colors.yellow,
                    Colors.black
                  ];
                  int i = Random.secure().nextInt(4);
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setTextColor(colors[i]);
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setFontScale(scale: 1.5);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ExpandText(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Staetup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blue);
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
            title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(title: new Text('saved suggestions')),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoritedCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoritedCount -= 1;
        _isFavorited = false;
      } else {
        _favoritedCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0),
          child: new IconButton(
            icon: _isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        new Text('$_favoritedCount')
      ],
    );
  }
}
