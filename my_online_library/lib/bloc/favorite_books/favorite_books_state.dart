import 'package:equatable/equatable.dart';
import 'package:my_online_library/models/book.dart';

abstract class FavoriteBooksState extends Equatable {
  const FavoriteBooksState();
}

class FavoriteBooksInitial extends FavoriteBooksState {
  @override
  List<Object> get props => [];
}

class FavoriteBooksLoaded extends FavoriteBooksState {
  final List<Book> favoriteBooks;

  const FavoriteBooksLoaded(this.favoriteBooks);

  @override
  List<Object> get props => [favoriteBooks];
}
