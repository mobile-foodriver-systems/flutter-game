part of 'localization_bloc.dart';

class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LocalizationEvent {
  const ChangeLanguage({required this.selectedLanguage});
  final Locale selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}
