import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_online_library/bloc/theme/theme_event.dart';

// Bloc sınıfı
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChanged>(
      (event, emit) {
        emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
