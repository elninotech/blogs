import 'dart:async';

import 'package:book_example/model/book.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final reference = FirebaseDatabase.instance.reference();
  static final bookRef = reference.child('books');

  static void addBook(Book book) {
    bookRef.child(book.id).set(book.toJson());
  }

  static void removeBook(Book book) {
    bookRef.child(book.id).remove();
  }

  static Future<bool> containsBook(Book book) {
    return bookRef.child(book.id).once().then((DataSnapshot snapshot) {
      return snapshot.value != null;
    });
  }
}
