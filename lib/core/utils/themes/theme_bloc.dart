import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/utils/themes/theme_event.dart';
import 'package:flutter_template/core/utils/themes/theme_state.dart';
import 'package:flutter_template/features/domain/repository/repository.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Repository repository;

  ThemeBloc(this.repository) : super(ThemeState.lightTheme) {
    on<FetchThemeEvent>((event, emit) async {
      bool isDark = await repository.isDark();
      emit(isDark ? ThemeState.darkTheme : ThemeState.lightTheme);
    });

    on<UpdateThemeEvent>((event, emit) async {
      bool success = await repository.updateThemeMode(isDark: event.isDarkMode);
      if (success) {
        emit(event.isDarkMode ? ThemeState.darkTheme : ThemeState.lightTheme);
      }
    });
  }
}
