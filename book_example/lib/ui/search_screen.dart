import 'package:book_example/api/google.dart';
import 'package:book_example/model/book.dart';
import 'package:book_example/ui/book_tile.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => new _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  List<Book> _books = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Search'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: 'Search for a book',
              ),
              onChanged: _onChanged,
            ),
            new Flexible(
              child: _buildBookList(_books),
            ),
          ],
        ),
      ),
    );
  }

  void _onChanged(text) {
    if (text == "") {
      return;
    }

    var results = GoogleApi.search(text);
    results.then((results) {
      _books = [];
      for (var _volume in results.items) {
        _books.add(Book.fromVolume(_volume));
      }
      setState(() {});
    });
  }

  Widget _buildBookList(List<Book> books) {
    if (books == null) {
      return new Container();
    }

    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new BookTile(books[index]),
      itemCount: books.length,
    );
  }
}
