import 'package:firebase_database/firebase_database.dart';
import 'package:googleapis/books/v1.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String thumb;

  Book(this.id, this.title, this.author, this.description, this.thumb);

  factory Book.fromVolume(Volume volume) {
    return new Book(
      volume.id,
      volume.volumeInfo.title,
      volume.volumeInfo.authors != null ? volume.volumeInfo.authors.first : '',
      volume.volumeInfo.description ?? '',
      volume.volumeInfo.imageLinks != null
          ? volume.volumeInfo.imageLinks.thumbnail
          : '',
    );
  }

  factory Book.fromSnapshot(DataSnapshot snapshot) {
    return new Book(
      snapshot.value['id'],
      snapshot.value['title'],
      snapshot.value['author'],
      snapshot.value['description'],
      snapshot.value['thumb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'author': this.author,
      'description': this.description,
      'thumb': this.thumb,
    };
  }
}
