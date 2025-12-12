import 'package:flutter/material.dart';

class AppPreferences {
  final ThemeMode themeMode;
  final bool highContrast;
  final bool reduceMotion;
  final Locale locale;
  final double textScale;

  const AppPreferences({
    this.themeMode = ThemeMode.system,
    this.highContrast = false,
    this.reduceMotion = false,
    this.locale = const Locale('es'),
    this.textScale = 1.0,
  });

  AppPreferences copyWith({
    ThemeMode? themeMode,
    bool? highContrast,
    bool? reduceMotion,
    Locale? locale,
    double? textScale,
  }) {
    return AppPreferences(
      themeMode: themeMode ?? this.themeMode,
      highContrast: highContrast ?? this.highContrast,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      locale: locale ?? this.locale,
      textScale: textScale ?? this.textScale,
    );
  }
}

class PreferencesNotifier extends ValueNotifier<AppPreferences> {
  PreferencesNotifier() : super(const AppPreferences());

  void toggleTheme(bool isDark) {
    value = value.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleHighContrast(bool isHigh) {
    // Si activa alto contraste, forzamos el modo oscuro en la UI logica
    value = value.copyWith(highContrast: isHigh);
  }

  void toggleReduceMotion(bool reduce) {
    value = value.copyWith(reduceMotion: reduce);
  }

  void toggleLanguage() {
    final newLocale = value.locale.languageCode == 'es' 
        ? const Locale('en') 
        : const Locale('es');
    value = value.copyWith(locale: newLocale);
  }
}

final preferencesNotifier = PreferencesNotifier();