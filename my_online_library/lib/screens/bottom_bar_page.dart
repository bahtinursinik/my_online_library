import 'package:flutter/material.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/screens/book_list_page.dart';
import 'package:my_online_library/screens/favorite_books_page.dart';
import 'package:my_online_library/screens/settings_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BookListPage(), // Kitap Sayfası
    const FavoriteBooksPage(), // Favori Kitaplar Sayfası
    const SettingsPage(), // Ayarlar Sayfası
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: S.of(context).books,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: S.of(context).favorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 8,
      ),
    );
  }
}
