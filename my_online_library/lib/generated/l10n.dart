// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get turkish {
    return Intl.message(
      'Turkish',
      name: 'turkish',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get themeMode {
    return Intl.message(
      'Dark Mode',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Books`
  String get favoriteBooks {
    return Intl.message(
      'My Favorite Books',
      name: 'favoriteBooks',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any books yet`
  String get noFavoriteBooks {
    return Intl.message(
      'You haven\'t added any books yet',
      name: 'noFavoriteBooks',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get bookDetailTitle {
    return Intl.message(
      'Detail',
      name: 'bookDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Publisher:`
  String get publisherLabel {
    return Intl.message(
      'Publisher:',
      name: 'publisherLabel',
      desc: '',
      args: [],
    );
  }

  /// `Year:`
  String get yearLabel {
    return Intl.message(
      'Year:',
      name: 'yearLabel',
      desc: '',
      args: [],
    );
  }

  /// `ISBN:`
  String get isbnLabel {
    return Intl.message(
      'ISBN:',
      name: 'isbnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Pages:`
  String get pagesLabel {
    return Intl.message(
      'Pages:',
      name: 'pagesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Villains`
  String get villainsTitle {
    return Intl.message(
      'Villains',
      name: 'villainsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Error:`
  String get errorLoadingBooks {
    return Intl.message(
      'Error:',
      name: 'errorLoadingBooks',
      desc: '',
      args: [],
    );
  }

  /// `No details available.`
  String get noDetailsAvailable {
    return Intl.message(
      'No details available.',
      name: 'noDetailsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Loading books...`
  String get loadingBooks {
    return Intl.message(
      'Loading books...',
      name: 'loadingBooks',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `No books available`
  String get noBooksAvailable {
    return Intl.message(
      'No books available',
      name: 'noBooksAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Books List`
  String get bookListTitle {
    return Intl.message(
      'Books List',
      name: 'bookListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `New Favorite Book`
  String get newFavoriteBook {
    return Intl.message(
      'New Favorite Book',
      name: 'newFavoriteBook',
      desc: '',
      args: [],
    );
  }

  /// `Added a new favorite book:`
  String get addedNewFavoriteBook {
    return Intl.message(
      'Added a new favorite book:',
      name: 'addedNewFavoriteBook',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
