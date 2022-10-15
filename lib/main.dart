import 'package:books/core/bloc/app_bloc.dart';
import 'package:books/core/service/app_service.dart';
import 'package:books/presentation/screens/main_screen.dart';
import 'package:books/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  init();
  MainService.instance.startApp();
}

Future init() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();
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
