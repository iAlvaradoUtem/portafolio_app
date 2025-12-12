import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _highContrastYellow = Colors.yellowAccent;
  static const Color _normalSeed = Color(0xFF1A73E8);

  static ThemeData build({
    required Brightness mode,
    required bool isHighContrast,
  }) {
    final effectiveBrightness = isHighContrast ? Brightness.dark : mode;
    
    // Si es alto contraste, forzamos los colores clave
    final Color seed = isHighContrast ? _highContrastYellow : _normalSeed;
    
    // Color de texto principal
    final Color textColor = isHighContrast 
        ? _highContrastYellow 
        : (mode == Brightness.dark ? Colors.white : Colors.black87);
        
    // Color secundario (subtítulos)
    final Color subtitleColor = isHighContrast
        ? _highContrastYellow
        : (mode == Brightness.dark ? Colors.white70 : Colors.black54);

    return ThemeData(
      useMaterial3: true,
      brightness: effectiveBrightness,
      
      // Definimos el esquema de color completo
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: effectiveBrightness,
        surface: isHighContrast ? Colors.black : null,
        onSurface: textColor,
        onSurfaceVariant: subtitleColor, // subtítulos
        primary: isHighContrast ? _highContrastYellow : null,
        onPrimary: isHighContrast ? Colors.black : null,
      ),
      
      scaffoldBackgroundColor: isHighContrast ? Colors.black : null,
      
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 26, color: textColor),
        displayMedium: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 22, color: textColor),
        titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, color: textColor),
        bodyLarge: GoogleFonts.openSans(fontSize: 16, height: 1.5, color: textColor),
        bodyMedium: GoogleFonts.openSans(fontSize: 14, color: textColor),
        labelLarge: GoogleFonts.openSans(fontSize: 13, color: subtitleColor),
      ),
      
      iconTheme: IconThemeData(
        color: isHighContrast 
            ? _highContrastYellow 
            : (mode == Brightness.dark ? Colors.white : _normalSeed),
      ),
      
      appBarTheme: AppBarTheme(
        backgroundColor: isHighContrast ? Colors.black : null,
        foregroundColor: isHighContrast ? _highContrastYellow : null,
        elevation: 0,
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, 
          fontSize: 20,
          color: isHighContrast ? _highContrastYellow : (mode == Brightness.dark ? Colors.white : Colors.black87)
        ),
      ),
    );
  }
}