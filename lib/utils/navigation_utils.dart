import 'package:flutter/material.dart';
import '../config/preferences_notifier.dart';

/// Centraliza la logica de transicion entre pantallas
/// Maneja automaticamente la preferencia de "Reducir movimiento"
class NavigationUtils {
  
  /// Realiza un Push a una nueva página respetando la accesibilidad
  static void push(BuildContext context, Widget page) {
    final reduceMotion = preferencesNotifier.value.reduceMotion;
    
    if (reduceMotion) {
      // Transición instantánea (sin animación)
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    } else {
      // Transicion estandar nativa
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  /// Cambia de tab en un PageController respetando la accesibilidad
  static void animatePage(PageController controller, int page) {
    final reduceMotion = preferencesNotifier.value.reduceMotion;

    if (reduceMotion) {
      controller.jumpToPage(page);
    } else {
      controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}