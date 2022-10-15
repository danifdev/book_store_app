import 'package:books/core/bloc/app_bloc.dart';
import 'package:books/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/storage.dart';

class MainService {
  MainService._setEnvironment();

  static final instance = MainService._setEnvironment();

  AppBloc appBloc = AppBloc();

  startApp() async {
    var storage = (await LocalStorage.instance);
    if (storage.getTheme != null) {
      String? currentTheme = (await LocalStorage.instance).getTheme;
      await appBloc.setThemeFromStorage(currentTheme ?? 'light');
      print(currentTheme);
    }

    runApp(
      BlocProvider(
        create: (context) => AppBloc(),
        child: const BookStoreApp(),
      ),
    );
  }
}
