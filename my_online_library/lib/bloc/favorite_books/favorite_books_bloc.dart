import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_online_library/models/book.dart';
import 'package:my_online_library/services/notification_service.dart'; // NotificationService'i import et

import 'favorite_books_event.dart';
import 'favorite_books_state.dart';

class FavoriteBooksBloc extends Bloc<FavoriteBooksEvent, FavoriteBooksState> {
  final Box<Book> favoriteBooksBox;

  FavoriteBooksBloc(this.favoriteBooksBox) : super(FavoriteBooksInitial()) {
    on<LoadFavoriteBooks>((event, emit) {
      final books = favoriteBooksBox.values.toList();
      emit(FavoriteBooksLoaded(books));
    });

    on<AddToFavorites>((event, emit) {
      if (state is FavoriteBooksLoaded) {
        final updatedBooks =
            List<Book>.from((state as FavoriteBooksLoaded).favoriteBooks)
              ..add(event.book);
        favoriteBooksBox.add(event.book);

        // Favorilere kitap eklendiğinde bildirim gönder
        Timer(const Duration(seconds: 5), () {
          NotificationService.showInstantNotification(
            'Yeni Favori Kitap',
            'Yeni bir favori kitap eklendi: ${event.book.Title}',
            event.book.id, // Kitap ID'sini payload olarak ekleyin
          );
        });

        emit(FavoriteBooksLoaded(updatedBooks));
      }
    });

    on<RemoveFromFavorites>((event, emit) {
      if (state is FavoriteBooksLoaded) {
        final updatedBooks =
            List<Book>.from((state as FavoriteBooksLoaded).favoriteBooks)
              ..remove(event.book);
        favoriteBooksBox.delete(event.book.key);
        emit(FavoriteBooksLoaded(updatedBooks));
      }
    });
  }
}
