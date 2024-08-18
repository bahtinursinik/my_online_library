import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_bloc.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_event.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_state.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/screens/book_detail_page.dart';
import 'package:my_online_library/widgets/custom_app_bar.dart';

//Favori kitap listesi
class FavoriteBooksPage extends StatefulWidget {
  const FavoriteBooksPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteBooksPageState createState() => _FavoriteBooksPageState();
}

class _FavoriteBooksPageState extends State<FavoriteBooksPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).favoriteBooks,
      ),
      body: BlocBuilder<FavoriteBooksBloc, FavoriteBooksState>(
        builder: (context, state) {
          if (state is FavoriteBooksLoaded) {
            final filteredBooks = state.favoriteBooks
                .where((book) => book.Title.toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
                .toList();

            if (filteredBooks.isEmpty) {
              return Center(
                  child: Text(S.of(context).noFavoriteBooks,
                      style: const TextStyle(fontSize: 18)));
            }

            return ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                final theme = Theme.of(context);

                return Card(
                  color: theme.cardColor, // Temaya uygun kart rengi
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
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context
                                .read<FavoriteBooksBloc>()
                                .add(RemoveFromFavorites(book));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetailPage(
                                  bookId: book.id,
                                  bookTitle: book.Title,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      //detay sayfasına yönlendirme işlemi
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(
                            bookId: book.id,
                            bookTitle: book.Title,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
