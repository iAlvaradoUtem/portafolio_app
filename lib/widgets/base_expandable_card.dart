import 'package:flutter/material.dart';

/// Su proposito es manejar TODA la logica de animacion y estado (abrir/cerrar) en un solo lugar, para no repetir código en cada tipo de tarjeta
class BaseExpandableCard extends StatefulWidget {
  final Widget header;
  final Widget collapsedContent;
  final Widget expandedContent;  // Contenido que aparece al abrir
  final Color color;
  final VoidCallback? onTap;
  
  // Para tarjetas que tienen una imagen de cabecera fuera del padding (como Proyectos)
  final Widget? topImage; 

  const BaseExpandableCard({
    super.key,
    required this.header,
    required this.expandedContent,
    required this.color,
    this.collapsedContent = const SizedBox.shrink(),
    this.onTap,
    this.topImage,
  });

  @override
  State<BaseExpandableCard> createState() => _BaseExpandableCardState();
}

class _BaseExpandableCardState extends State<BaseExpandableCard> {
  bool _isExpanded = false;
  static const _duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    // Detectamos el tema para asegurar que el Blanco no rompa el modo oscuro
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.55), // Sombra suave y moderna

      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,

      margin: widget.topImage != null ? const EdgeInsets.only(bottom: 24) : null,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _isExpanded ? widget.color : Colors.transparent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          setState(() => _isExpanded = !_isExpanded);
          widget.onTap?.call();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.topImage != null) widget.topImage!,

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabecera (icono + titulo + flecha)
                  Row(
                    children: [
                      Expanded(child: widget.header),
                      const SizedBox(width: 8),
                      AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0,
                        duration: _duration,
                        child: Icon(Icons.keyboard_arrow_down, color: widget.color),
                      ),
                    ],
                  ),
                  
                  // Contenido colapsado (siempre visible pero debajo del header)
                  widget.collapsedContent,

                  // Contenido expandible (animado)
                  AnimatedSize(
                    duration: _duration,
                    curve: Curves.easeInOut,
                    child: SizedBox(
                      width: double.infinity,
                      height: _isExpanded ? null : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: widget.color.withValues(alpha: 0.2)),
                            const SizedBox(height: 8),
                            widget.expandedContent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}