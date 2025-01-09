import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(locale: const Locale('en', 'US'))) {
    // on<LanguageEvent>((event, emit) async {
    //   final newLocale = state.locale.languageCode == 'en'
    //       ? const Locale('vi', 'VN')
    //       : const Locale('en', 'US');

    //   print('ngon ngữ:$newLocale');
    //   emit(LanguageState(locale: newLocale));
    // });
    // on<LanguageChanged>((event, emit) async {
    //   emit(LanguageState(locale: event.locale));
    // });
    on<LanguageChanged>(
      (event, emit) async {
        emit(LanguageState(locale: event.locale));
      },
    );
  }
}
