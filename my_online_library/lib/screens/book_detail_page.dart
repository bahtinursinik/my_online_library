import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/book/book_bloc.dart';
import 'package:my_online_library/bloc/book/book_event.dart';
import 'package:my_online_library/bloc/book/book_state.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/services/book_service.dart';
import 'package:my_online_library/widgets/custom_app_bar.dart';

//book detail page
class BookDetailPage extends StatefulWidget {
  final int bookId;
  final String bookTitle;

  const BookDetailPage({
    super.key,
    required this.bookId,
    required this.bookTitle,
  });

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc(BookService())..add(LoadBooks()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: '${widget.bookTitle} ${S.of(context).bookDetailTitle} ',
          showSearchBox: false,
        ),
        body: BlocBuilder<BookListBloc, BookListState>(
          builder: (context, state) {
            if (state is BookListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookListLoaded) {
              final book =
                  state.books.firstWhere((book) => book.id == widget.bookId);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.Title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${S.of(context).publisherLabel} ${book.Publisher}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  //  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Additional Book Information
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow(S.of(context).yearLabel,
                                  book.Year.toString()),
                              _buildInfoRow(S.of(context).isbnLabel, book.ISBN),
                              _buildInfoRow(S.of(context).pagesLabel,
                                  book.Pages.toString()),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Villains List
                      Text(
                        S.of(context).villainsTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: book.villains.map((villain) {
                            return ListTile(
                              title: Text(villain.name),
                              subtitle: Text(villain.url),
                              leading: const Icon(
                                Icons.person,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is BookListError) {
              return Center(
                  child: Text(
                      '${S.of(context).errorLoadingBooks} ${state.message}'));
            }
            return Center(child: Text(S.of(context).noDetailsAvailable));
          },
        ),
      ),
    );
  }

  // Method to build information rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
