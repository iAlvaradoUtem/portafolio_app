import 'package:flutter/material.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../config/assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final titleColor = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    // Aplicamos la misma fisica que en PageLayout para asegurar el efecto "chicle"
    // y permitir el rebote incluso si el contenido es pequeño.
    const scrollPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

    return SingleChildScrollView(
      physics: scrollPhysics,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          
          // Uso de constante de Assets
          const _ProfileAvatar(imagePath: AppAssets.profile),
          
          const SizedBox(height: 24),
          Text(
            l10n.profileTitle,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: isDark ? titleColor : primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.profileRole,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: titleColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          _RoleChip(label: l10n.profileTagline),
          
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(l10n.profileAboutTitle, style: Theme.of(context).textTheme.displayMedium),
          ),
          const SizedBox(height: 16),
          Text(l10n.profileAboutText1, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.justify),
          const SizedBox(height: 16),
          Text(l10n.profileAboutText2, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final String imagePath;

  const _ProfileAvatar({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).primaryColor, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  final String label;

  const _RoleChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}