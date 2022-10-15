import 'package:books/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());

  toSetTheme(AppThemeType appThemeType) {
    emit(state.copyWith(
      appThemeType: appThemeType,
    ));
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
