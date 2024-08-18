import 'package:equatable/equatable.dart';
import 'package:my_online_library/models/book.dart';

abstract class FavoriteBooksEvent extends Equatable {
  const FavoriteBooksEvent();
}

class LoadFavoriteBooks extends FavoriteBooksEvent {
  @override
  List<Object> get props => [];
}

class AddToFavorites extends FavoriteBooksEvent {
  final Book book;

  const AddToFavorites(this.book);

  @override
  List<Object> get props => [book];
}

class RemoveFromFavorites extends FavoriteBooksEvent {
  final Book book;

  const RemoveFromFavorites(this.book);

  @override
  List<Object> get props => [book];
}
