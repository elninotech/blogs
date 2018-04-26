import 'dart:async';

import 'package:book_example/credentials.dart';
import 'package:googleapis/books/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleApi {
  static const _SCOPES = const [BooksApi.BooksScope];

  static Future<Volumes> search(q) {
    return clientViaServiceAccount(gccCredentials, _SCOPES).then((httpClient) {
      var books = new BooksApi(httpClient);
      return books.volumes.list(q);
    });
  }
}
