import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:my_online_library/models/book.dart';
import 'package:my_online_library/services/book_service.dart';

void main() {
  group('BookService', () {
    late BookService bookService;

    setUp(() async {
      bookService = BookService();
      // Hive veritabanını başlatma
      Hive.init('test/hive');
      await Hive.openBox<Book>('books');
    });

    test(
        'fetchBooks returns a list of books when the HTTP call completes successfully',
        () async {
      // Arrange
      json.encode({
        'data': [
          {'id': 1, 'title': 'Book 1'},
          {'id': 2, 'title': 'Book 2'}
        ]
      });

      // Act
      final books = await bookService.fetchBooks();

      // Assert
      expect(books, isA<List<Book>>());
      expect(books.length, 2);
      expect(books[0].Title, 'Book 1');
    });

    test(
        'fetchBookDetail returns a book when the HTTP call completes successfully',
        () async {
      // Arrange
      json.encode({'id': 1, 'title': 'Book Detail'});

      // Act
      final book = await bookService.fetchBookDetail(1);

      // Assert
      expect(book, isA<Book>());
      expect(book.Title, 'Book Detail');
    });
  });
}
