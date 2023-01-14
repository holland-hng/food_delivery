// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  const Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    welcome: 'Welcome to Pikapoint',
  ),
  const Locale.fromSubtags(languageCode: 'zh'): const AppLocalizationsData(
    welcome: '欢迎来到 Pikapoint',
  ),
  const Locale.fromSubtags(languageCode: 'fr'): const AppLocalizationsData(
    welcome: 'Bienvenue sur Pikapoint',
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.welcome,
  });

  final String welcome;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        welcome: map['welcome']! as String,
      );

  AppLocalizationsData copyWith({
    String? welcome,
  }) =>
      AppLocalizationsData(
        welcome: welcome ?? this.welcome,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData && welcome == other.welcome);
  @override
  int get hashCode => runtimeType.hashCode ^ welcome.hashCode;
}
