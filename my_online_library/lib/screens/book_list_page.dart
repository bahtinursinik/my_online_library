import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/book/book_bloc.dart';
import 'package:my_online_library/bloc/book/book_event.dart';
import 'package:my_online_library/bloc/book/book_state.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_bloc.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_event.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_state.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/models/book.dart';
import 'package:my_online_library/screens/book_detail_page.dart';
import 'package:my_online_library/services/book_service.dart';
import 'package:my_online_library/widgets/custom_app_bar.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc(BookService())..add(LoadBooks()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).bookListTitle,
          showSearchBox: true,
          searchController: _searchController,
          onClearSearch: _clearSearch,
        ),
        body: BlocBuilder<BookListBloc, BookListState>(
          builder: (context, state) {
            if (state is BookListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookListLoaded) {
              final filteredBooks = state.books
                  .where((book) => book.Title.toLowerCase()
                      .contains(_searchQuery.toLowerCase()))
                  .toList();

              return ListView.builder(
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  final theme = Theme.of(context);

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        book.Title,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        book.Publisher,
                        style: theme.textTheme.bodyMedium,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<FavoriteBooksBloc, FavoriteBooksState>(
                            builder: (context, favoriteState) {
                              final isFavorite =
                                  favoriteState is FavoriteBooksLoaded &&
                                      favoriteState.favoriteBooks.any(
                                          (favoriteBook) =>
                                              favoriteBook.id == book.id);

                              return IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.star : Icons.star_border,
                                  color: isFavorite ? Colors.red : null,
                                  size: 25,
                                ),
                                onPressed: () {
                                  if (isFavorite) {
                                    context
                                        .read<FavoriteBooksBloc>()
                                        .add(RemoveFromFavorites(book));
                                  } else {
                                    final copiedBook = Book(
                                      id: book.id,
                                      Title: book.Title,
                                      Publisher: book.Publisher,
                                      Year: book.Year,
                                      handle: book.handle,
                                      ISBN: book.ISBN,
                                      Pages: book.Pages,
                                      Notes: [],
                                      created_at: '',
                                      villains: [],
                                    );
                                    context
                                        .read<FavoriteBooksBloc>()
                                        .add(AddToFavorites(copiedBook));
                                  }
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetailPage(
                                      bookId: book.id, bookTitle: book.Title),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is BookListError) {
              return Center(
                  child: Text(
                      '${S.of(context).errorLoadingBooks} ${state.message}'));
            }
            return Center(child: Text(S.of(context).noBooksAvailable));
          },
        ),
      ),
    );
  }
}
