import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/theme/theme_bloc.dart';
import 'package:my_online_library/bloc/theme/theme_event.dart';
import 'package:my_online_library/cubit/locale_cubit.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Dil değişikliği ve tema seçimi için ayarlar sayfası
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).settings,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //tema değişikliği
            BlocBuilder<ThemeBloc, ThemeMode>(
              builder: (context, themeMode) {
                bool isDarkMode = themeMode == ThemeMode.dark;
                return SwitchListTile(
                  title: Text(S.of(context).themeMode),
                  value: isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ThemeChanged(isDark: value));
                    // Tema değişikliği yapıldı, SharedPreferences ile kalıcı hale getirildi.
                    _saveThemePreference(value);
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            //change language
            ListTile(
              title: Text(S.of(context).changeLanguage),
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButton<String>(
                  value: context.watch<LocaleCubit>().state.languageCode,
                  items: [
                    DropdownMenuItem(
                      value: "en",
                      child: Text(S.of(context).english),
                    ),
                    DropdownMenuItem(
                      value: "tr",
                      child: Text(S.of(context).turkish),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocaleCubit>().changeLanguage(newValue);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveThemePreference(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
}
