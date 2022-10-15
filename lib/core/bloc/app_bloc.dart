import 'package:books/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/storage.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());

  toSetTheme(AppThemeType appThemeType) async {
    var storage = await LocalStorage.instance;
    if (appThemeType == AppThemeType.light) {
      storage.setTheme = 'light';
    } else {
      storage.setTheme = 'dark';
    }

    emit(
      state.copyWith(
        appThemeType: appThemeType,
      ),
    );
  }

  setThemeFromStorage(String v) {
    if (v == 'light') {
      emit(
        state.copyWith(appThemeType: AppThemeType.light),
      );
    } else {
      emit(
        state.copyWith(
          appThemeType: AppThemeType.dark,
        ),
      );
    }
  }
}

class AppState {
  final AppThemeType? appThemeType;

  AppState({
    this.appThemeType = AppThemeType.light,
  });

  AppState copyWith({
    AppThemeType? appThemeType,
  }) {
    return AppState(
      appThemeType: appThemeType ?? this.appThemeType,
    );
  }
}
