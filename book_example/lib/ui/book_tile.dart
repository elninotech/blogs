import 'package:book_example/api/firebase.dart';
import 'package:book_example/model/book.dart';
import 'package:book_example/ui/book_screen.dart';
import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final Book _book;

  BookTile(this._book);

  @override
  _BookTile createState() => new _BookTile(_book);
}

class _BookTile extends State<BookTile> {
  Book _book;
  bool _favourite = false;

  _BookTile(this._book) {
    FirebaseApi.containsBook(_book).then((val) {
      setState(() {
        _favourite = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_book.title),
      subtitle: new Text(_book.author),
      leading:
          _book.thumb != '' ? new Image.network(_book.thumb) : new Container(),
      trailing: new IconButton(
        icon: new Icon(Icons.favorite),
        color: _favourite ? Colors.red : null,
        onPressed: _onFavourite,
      ),
      onTap: _onTapped,
    );
  }

  void _onTapped() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new BookScreen(_book)),
    );
  }

  void _onFavourite() {
    if (_favourite) {
      FirebaseApi.removeBook(_book);
    } else {
      FirebaseApi.addBook(_book);
    }
    setState(() {
      _favourite = !_favourite;
    });
  }
}
