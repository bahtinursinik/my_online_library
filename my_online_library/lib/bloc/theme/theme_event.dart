abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final bool isDark;

  ThemeChanged({required this.isDark});
}
