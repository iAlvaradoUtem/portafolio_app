import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../widgets/page_layout.dart';
import '../utils/external_links.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PageLayout(
      title: l10n.headerContactTitle,
      subtitle: l10n.headerContactSubtitle,
      icon: Icons.mark_email_unread_outlined,
      color: const Color(0xFFE91E63),
      centerContent: true, // centrado vertical
      children: [
        const SizedBox(height: 20), // Espacio extra de esta vista
        _ContactButton(
          label: l10n.btnEmail,
          icon: Icons.email,
          onPressed: () => ExternalLinks.launch('mailto:ialvarado@utem.cl', context: context),
          isPrimary: true,
        ),
        const SizedBox(height: 16),
        _ContactButton(
          label: l10n.btnGithub,
          icon: FontAwesomeIcons.github,
          onPressed: () => ExternalLinks.launch('https://github.com/iAlvaradoUtem', context: context),
          isPrimary: false,
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _ContactButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 55;
    const TextStyle textStyle = TextStyle(fontSize: 18);

    return SizedBox(
      width: double.infinity,
      height: height,
      child: isPrimary
          ? FilledButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
              style: FilledButton.styleFrom(textStyle: textStyle),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: FaIcon(icon),
              label: Text(label),
              style: OutlinedButton.styleFrom(textStyle: textStyle),
            ),
    );
  }
}