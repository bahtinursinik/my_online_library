import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  ////kaydedilmiş dil tercihini yükler
  LocaleCubit() : super(const Locale('en')) {
    _loadLocale();
  }
//dil kodunu (languageCode) alır ve bu dili uygulamanın dili olarak ayarlar.
  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', languageCode);
    emit(Locale(languageCode));
  }

// uygulama başlatıldığında çağrılır ve SharedPreferences'den saklanan dil kodunu alır,varsayılan olarak 'en' kullanır
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('selectedLanguage') ?? 'en';
    emit(Locale(languageCode));
  }
}
