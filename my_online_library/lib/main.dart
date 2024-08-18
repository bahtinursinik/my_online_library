import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_online_library/bloc/book/book_bloc.dart';
import 'package:my_online_library/bloc/book/book_event.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_bloc.dart';
import 'package:my_online_library/bloc/favorite_books/favorite_books_event.dart';
import 'package:my_online_library/bloc/theme/theme_bloc.dart';
import 'package:my_online_library/bloc/theme/theme_event.dart';
import 'package:my_online_library/cubit/locale_cubit.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/models/book.dart';
import 'package:my_online_library/models/villains.dart';
import 'package:my_online_library/screens/book_detail_page.dart';
import 'package:my_online_library/screens/splash_screen_page.dart';
import 'package:my_online_library/services/book_service.dart';
import 'package:my_online_library/services/notification_service.dart';
import 'package:my_online_library/theme/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

// Yerel bildirim entegrasyonu için gerekli olan FlutterLocalNotificationsPlugin nesnesi
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();

  // Hive başlatma ve adapter kaydetme
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(VillainsAdapter());

  // Kitap kutusunu açma
  final bookBox = await Hive.openBox<Book>('favoriteBooksBox');

  // SharedPreferences ile tema bilgisini alma
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;

  // Kitap servisi oluşturma
  final bookService = BookService();

  // Android için bildirim ayarları
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS (Darwin) için bildirim ayarları
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification:
              (int id, String? title, String? body, String? payload) async {});

  // Bildirim başlatma ayarları
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  // Bildirim eklentisini başlatma
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Uygulamayı başlatma
  runApp(MyApp(
    bookService: bookService,
    bookBox: bookBox,
    isDarkMode: isDarkMode,
  ));
}

class MyApp extends StatefulWidget {
  final BookService? bookService;
  final Box<Book>? bookBox;
  final bool? isDarkMode;

  const MyApp({
    super.key,
    this.bookService,
    this.bookBox,
    this.isDarkMode,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupNotificationListener();
  }

  void _setupNotificationListener() {
    NotificationService.notificationStream.listen((bookId) {
      // `context`'in geçerli olduğundan emin olmak için `addPostFrameCallback` kullanın
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              bookId: bookId,
              bookTitle:
                  '', // Kitap başlığını dinamik olarak burada alabilirsiniz
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Tema durumu sağlayıcısı
        BlocProvider(
          create: (context) =>
              ThemeBloc()..add(ThemeChanged(isDark: widget.isDarkMode!)),
        ),
        // Kitap listesi sağlayıcısı
        BlocProvider(
          create: (context) =>
              BookListBloc(widget.bookService!)..add(LoadBooks()),
        ),
        // Favori kitaplar sağlayıcısı
        BlocProvider(
          create: (context) =>
              FavoriteBooksBloc(widget.bookBox!)..add(LoadFavoriteBooks()),
        ),
        // Dil desteği sağlayıcısı
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                locale: locale, // Dil ayarı
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate, // Dil desteği için
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Book App',
                theme: lightTheme, // Açık tema
                darkTheme: darkTheme, // Karanlık tema
                themeMode: themeMode, // Güncel tema modu
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
