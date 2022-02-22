import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
       ),
      title: "Flutter demo",
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _sugesstions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text("Startup name generator"),
        actions: [
          IconButton(onPressed: _pushNamed, icon: const Icon(Icons.list))
        ],
      ),
      body: ListView.builder(itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _sugesstions.length) {
          _sugesstions.addAll(generateWordPairs().take(10));
        }
        final alreadySaved = _saved.contains(_sugesstions[index]);
        return ListTile(
          title: Text(
            _sugesstions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            semanticLabel: alreadySaved ? 'Remove from Saved' : 'saved',
          ),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(_sugesstions[index]);
              } else {
                _saved.add(_sugesstions[index]);
              }
            });
          },
        );
      }),
    );
  }

  void _pushNamed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return ListTile(
          title:Text(pair.asPascalCase,style: _biggerFont,),
        );
      });
      final divided=tiles.isNotEmpty? ListTile.divideTiles(tiles: tiles,context: context).toList():<Widget>[];
      return Scaffold(
        appBar: AppBar(title:const Text("saved suggestion"),),
        body:ListView(children: divided,)
      );
    }));
  }
}
