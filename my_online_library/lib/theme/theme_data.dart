import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary, // App Bar rengi burada
    foregroundColor:
        lightColorScheme.onPrimary, // Başlık ve ikon renkleri burada
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.primary, // Bottom Bar arka plan rengi
    selectedItemColor: lightColorScheme.onPrimary, // Seçili item rengi
    unselectedItemColor: Colors.grey, // Seçili olmayan item rengi
    elevation: 8, // Bottom Bar gölge yüksekliği
  ),
  iconTheme: IconThemeData(
    color: lightColorScheme.onPrimary, // İkon renkleri burada belirlenir
    size: 24, // İkon boyutu burada belirlenir
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.background,
  iconTheme: IconThemeData(
      color:
          lightColorScheme.primary // İkon renklerini `onSurface` ile ayarladık
      ),
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary, // App Bar rengi burada
    foregroundColor:
        darkColorScheme.onPrimary, // Başlık ve ikon renkleri burada
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.primary, // Bottom Bar arka plan rengi
    selectedItemColor: lightColorScheme.onPrimary, // Seçili item rengi
    unselectedItemColor:
        darkColorScheme.inverseSurface, // Seçili olmayan item rengi
    elevation: 8, // Bottom Bar gölge yüksekliği
  ),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff8bd5b5),
  surfaceTint: Color(0xff8bd5b5),
  onPrimary: Color(0xff003827),
  primaryContainer: Color(0xff00513a),
  onPrimaryContainer: Color(0xffa7f2d0),
  secondary: Color(0xffb3ccbf),
  onSecondary: Color(0xff1f352b),
  secondaryContainer: Color(0xff354b41),
  onSecondaryContainer: Color(0xffcfe9da),
  tertiary: Color(0xffa6cce0),
  onTertiary: Color(0xff093544),
  tertiaryContainer: Color(0xff254b5c),
  onTertiaryContainer: Color(0xffc2e8fc),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffdad6),
  surface: Color(0xff3a3a3a), // Daha açık gri
  onSurface: Color(0xffe0e0e0), // Daha açık gri
  onSurfaceVariant: Color(0xffbfc9c2),
  outline: Color(0xff89938d),
  outlineVariant: Color(0xff404944),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffdee4df),
  inversePrimary: Color(0xff1c6b50),
  background: Color(0xff000000), // Daha koyu gri
  onBackground: Color(0xffe0e0e0),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff004d37),
  surfaceTint: Color(0xff1c6b50),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff378166),
  onPrimaryContainer: Color(0xffffffff),
  secondary: Color(0xff31483d),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xff627a6e),
  onSecondaryContainer: Color(0xffffffff),
  tertiary: Color(0xff214757),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xff557a8b),
  onTertiaryContainer: Color(0xffffffff),
  error: Color(0xff8c0009),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffda342e),
  onErrorContainer: Color(0xffffffff),
  surface: Color(0xfff0f0f0), // Daha açık gri
  onSurface: Color(0xff000000),
  onSurfaceVariant: Color(0xff3c4540),
  outline: Color(0xff58615c),
  outlineVariant: Color(0xff737d77),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2c322e),
  inversePrimary: Color(0xff8bd5b5),
  background: Colors.white,
  onBackground: Colors.black54,
);
