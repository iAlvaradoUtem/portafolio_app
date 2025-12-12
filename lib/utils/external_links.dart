import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Evita repetir la logica de validacion y manejo de errores en cada vista
class ExternalLinks {
  static Future<void> launch(String url, {BuildContext? context}) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        // Verificar si el contexto sigue montado antes de usarlo
        if (context != null && !context.mounted) return;
        _showError(context, url);
      }
    } catch (e) {
      if (context != null && !context.mounted) return;
      _showError(context, url);
    }
  }

  static void _showError(BuildContext? context, String url) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir el enlace: $url')),
      );
    } else {
      debugPrint('Error al abrir $url');
    }
  }
}