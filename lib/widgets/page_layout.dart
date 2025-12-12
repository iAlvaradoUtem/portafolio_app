import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<Widget> children;
  final bool centerContent;

  const PageLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.children,
    this.centerContent = false,
  });

  @override
  Widget build(BuildContext context) {
    // Definimos la fisica:
    // BouncingScrollPhysics: Da el efecto rebote/chicle
    // AlwaysScrollableScrollPhysics: Fuerza a que el efecto funcione incluso si hay poco contenido
    const scrollPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

    // Header reutilizable
    final headerWidget = _SectionHeader(
      icon: icon,
      title: title,
      subtitle: subtitle,
      color: color,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: scrollPhysics,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: centerContent && constraints.maxHeight > 30 
                  ? constraints.maxHeight - 30 
                  : 0,
            ),
            child: Column(
              mainAxisAlignment: centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                headerWidget,
                const SizedBox(height: 20),
                ...children,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(icon, size: 50, color: color.withValues(alpha: 0.8)),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: onSurface.withValues(alpha: 0.7),
            height: 1.4,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 3, 
          width: 30, 
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.5), 
            borderRadius: BorderRadius.circular(2)
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}