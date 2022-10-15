import 'package:books/core/bloc/app_bloc.dart';
import 'package:books/presentation/screens/main_screen.dart';
import 'package:books/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => AppBloc(),
      child: const BookStoreApp(),
    ),
  );
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (p, c) => p.appThemeType != c.appThemeType,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance.get(state.appThemeType),
          home: const MainScreen(),
        );
      },
    );
  }
}
