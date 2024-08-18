import 'package:my_online_library/models/book.dart';

abstract class BookListState {}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState {}

class BookListLoaded extends BookListState {
  final List<Book> books;

  BookListLoaded(this.books);
}

class BookListError extends BookListState {
  final String message;

  BookListError(this.message);
}
