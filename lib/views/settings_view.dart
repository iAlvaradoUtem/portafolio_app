import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../config/preferences_notifier.dart';
import '../utils/external_links.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const Scaffold();

    // Acceso directo al tema
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final iconColor = theme.iconTheme.color ?? colorScheme.primary;

    return ValueListenableBuilder<AppPreferences>(
      valueListenable: preferencesNotifier,
      builder: (context, prefs, child) {
        
        final languageName = prefs.locale.languageCode == 'es' ? 'Español' : 'English';

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.settingsTitle),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _SectionTitle(title: l10n.settingsAppearance, color: iconColor),
              _SettingsSwitch(
                title: l10n.settingsDarkMode,
                subtitle: l10n.settingsDarkModeSub,
                value: prefs.themeMode == ThemeMode.dark,
                icon: Icons.dark_mode_outlined,
                onChanged: preferencesNotifier.toggleTheme,
              ),
              
              const Divider(height: 30),

              _SectionTitle(title: l10n.settingsAccessibility, color: iconColor),
              _SettingsSwitch(
                title: l10n.settingsHighContrast,
                subtitle: l10n.settingsHighContrastSub,
                value: prefs.highContrast,
                icon: Icons.contrast,
                onChanged: preferencesNotifier.toggleHighContrast,
              ),
              _SettingsSwitch(
                title: l10n.settingsReduceMotion,
                subtitle: l10n.settingsReduceMotionSub,
                value: prefs.reduceMotion,
                icon: Icons.animation,
                onChanged: preferencesNotifier.toggleReduceMotion,
              ),

              const Divider(height: 30),

              _SectionTitle(title: l10n.settingsLanguage, color: iconColor),
              ListTile(
                leading: _IconBox(icon: Icons.translate, color: iconColor),
                title: Text(l10n.settingsLanguage, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
                subtitle: Text(languageName, style: theme.textTheme.labelLarge),
                trailing: Icon(Icons.sync, size: 16, color: iconColor.withValues(alpha: 0.5)),
                onTap: () {
                  preferencesNotifier.toggleLanguage();
                  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("Idioma cambiado / Language changed"), duration: Duration(milliseconds: 500)),
                  );
                },
              ),

              const Divider(height: 30),

              _SectionTitle(title: l10n.settingsAbout, color: iconColor),
              ListTile(
                leading: Icon(FontAwesomeIcons.github, size: 24, color: iconColor),
                title: Text(l10n.settingsSourceCode, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
                subtitle: Text("GitHub: iAlvaradoUtem", style: theme.textTheme.labelLarge),
                trailing: Icon(Icons.open_in_new, size: 16, color: iconColor),
                onTap: () => ExternalLinks.launch('https://github.com/iAlvaradoUtem', context: context),
              ),
              ListTile(
                leading: Icon(Icons.verified_user_outlined, size: 24, color: iconColor),
                title: Text(l10n.settingsVersion, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
                subtitle: Text("v1.0.0 (Build 2025)", style: theme.textTheme.labelLarge),
              ),
              
              const SizedBox(height: 40),
              Center(
                child: Text(
                  l10n.settingsMadeWith,
                  // CORRECCIÓN AQUÍ: Aplicamos withValues al color, no al copyWith directamente
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 12, 
                    color: theme.textTheme.labelLarge?.color?.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Widgets para limpiar el layout principal
class _SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const _SectionTitle({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: color), 
          const SizedBox(width: 10),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSwitch extends StatelessWidget {
  final String title, subtitle;
  final bool value;
  final IconData icon;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitch({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.iconTheme.color ?? theme.primaryColor;

    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      secondary: _IconBox(icon: icon, color: iconColor),
      title: Text(title, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
      subtitle: Text(subtitle, style: theme.textTheme.labelLarge),
      value: value,
      onChanged: onChanged,
      activeTrackColor: iconColor,
      thumbColor: WidgetStateProperty.all(Colors.white),
    );
  }
}

class _IconBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconBox({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color),
    );
  }
}