import 'package:book_example/api/firebase.dart';
import 'package:book_example/model/book.dart';
import 'package:book_example/ui/book_tile.dart';
import 'package:book_example/ui/search_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ShelfScreen extends StatefulWidget {
  @override
  _ShelfScreen createState() => new _ShelfScreen();
}

class _ShelfScreen extends State<ShelfScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Shelf'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add)
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: new FirebaseAnimatedList(
                query: FirebaseApi.bookRef,
                padding: new EdgeInsets.all(8.0),
                itemBuilder: _buildBookTiles,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _add() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SearchScreen()),
    );
  }

  Widget _buildBookTiles(
      _, DataSnapshot snapshot, Animation<double> animation, index) {
    return new BookTile(new Book.fromSnapshot(snapshot));
  }
}
