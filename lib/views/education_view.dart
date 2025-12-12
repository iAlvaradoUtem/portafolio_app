import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../widgets/page_layout.dart';
import '../widgets/expandable_cards.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const Color sectionColor = Color(0xFF0D9488);
    const Color secondaryColor = Color(0xFFE8900C);

    // Definicion de Datos
    final educationItems = [
      _EduData(
        institution: l10n.edu1Inst,
        title: l10n.edu1Title,
        period: l10n.edu1Period,
        icon: FontAwesomeIcons.buildingColumns,
        description: l10n.edu1Desc,
        extendedInfo: l10n.edu1Ext,
        color: sectionColor,
      ),
      _EduData(
        institution: l10n.edu2Inst,
        title: l10n.edu2Title,
        period: l10n.edu2Period,
        icon: FontAwesomeIcons.certificate,
        description: l10n.edu2Desc,
        extendedInfo: l10n.edu2Ext,
        color: secondaryColor,
      ),
    ];

    return PageLayout(
      title: l10n.headerEducationTitle,
      subtitle: l10n.headerEducationSubtitle,
      icon: FontAwesomeIcons.userGraduate,
      color: sectionColor,
      children: educationItems.map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ExpandableTimelineCard(
          institution: item.institution,
          title: item.title,
          period: item.period,
          icon: item.icon,
          description: item.description,
          extendedInfo: item.extendedInfo,
          color: item.color,
        ),
      )).toList(),
    );
  }
}

class _EduData {
  final String institution, title, period, description, extendedInfo;
  final IconData icon;
  final Color color;

  _EduData({
    required this.institution,
    required this.title,
    required this.period,
    required this.icon,
    required this.description,
    required this.extendedInfo,
    required this.color,
  });
}