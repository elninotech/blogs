import 'package:book_example/model/book.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  final Book _book;

  BookScreen(this._book);

  @override
  _BookScreen createState() => new _BookScreen(_book);
}

class _BookScreen extends State<BookScreen> {
  Book _book;

  _BookScreen(this._book);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_book.title + '  - ' + _book.author),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Image.network(
              _book.thumb,
              fit: BoxFit.cover,
              height: 250.0,
            ),
            new ListTile(
              title: new Text(_book.title),
              subtitle: new Text("Title"),
            ),
            new ListTile(
              title: new Text(_book.author),
              subtitle: new Text("Author"),
            ),
            new ListTile(
              title: new Text(_book.description),
            ),
          ],
        ),
      ),
    );
  }
}
