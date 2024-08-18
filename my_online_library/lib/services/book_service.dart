import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_online_library/models/book.dart';

class BookService {
  final String baseUrl = 'https://stephen-king-api.onrender.com/api/';

  Future<List<Book>> fetchBooks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/books'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'] ?? jsonResponse;

        final books = data.map((json) => Book.fromJson(json)).toList();

        // Kitapları Hive'a kaydetme
        final box = await Hive.openBox<Book>('books');
        await box.clear(); // Eski verileri temizle
        await box.addAll(books);

        return books;
      } else {
        throw Exception('Kitaplar yüklenemedi.');
      }
    } catch (e) {
      // İnternet yoksa Hive'dan kitapları getir
      return await fetchBooksFromHive();
    }
  }

  Future<List<Book>> fetchBooksFromHive() async {
    final box = await Hive.openBox<Book>('books');
    return box.values.toList();
  }

  Future<Book> fetchBookDetail(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/books/$id'));

      if (response.statusCode == 200) {
        return Book.fromJson(json.decode(response.body));
      } else {
        throw Exception('Kitap detayı yüklenemedi.');
      }
    } catch (e) {
      return await fetchBookDetailFromHive(id);
    }
  }

  Future<Book> fetchBookDetailFromHive(int id) async {
    final box = await Hive.openBox<Book>('books');
    return box.values.firstWhere((book) => book.id == id);
  }
}
