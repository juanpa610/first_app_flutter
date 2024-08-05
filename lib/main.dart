import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(title: 'Mi primera app'));
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Column(
        children: [
          Text('Una paabra cualquiera:'),
          Bigcard(pair: pair),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Nueva palabra aleatoria en ingles'),
          ),
        ],
      ),
    );
  }
}

class Bigcard extends StatelessWidget {
  final WordPair pair;

  const Bigcard({
    super.key,
    required this.pair,
  });

  @override
  Widget build(BuildContext context) {
    return Text(pair.asUpperCase);
  }
}
