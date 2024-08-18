import 'package:bloc/bloc.dart';
import 'package:my_online_library/bloc/book/book_event.dart';
import 'package:my_online_library/bloc/book/book_state.dart';
import 'package:my_online_library/services/book_service.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  final BookService _bookService;

  BookListBloc(this._bookService) : super(BookListInitial()) {
    on<LoadBooks>(_onLoadBooks);
  }

  Future<void> _onLoadBooks(
      LoadBooks event, Emitter<BookListState> emit) async {
    emit(BookListLoading());
    try {
      final books = await _bookService.fetchBooks();
      emit(BookListLoaded(books));
    } catch (e) {
      emit(BookListError('Online veri yüklenemedi: ${e.toString()}'));
      try {
        final books = await _bookService.fetchBooksFromHive();
        emit(BookListLoaded(books));
      } catch (e) {
        emit(BookListError('Offline veri yüklenemedi: ${e.toString()}'));
      }
    }
  }
}
