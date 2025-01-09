part of 'language_bloc.dart';

class LanguageChanged extends LanguageEvent {
  final Locale locale;

  LanguageChanged(this.locale);
}

class LanguageEvent {}
