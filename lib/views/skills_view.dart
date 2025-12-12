import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../widgets/page_layout.dart';
import '../widgets/expandable_cards.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const Color sectionColor = Color(0xFF673AB7);

    final skillsData = [
      _SkillData(
        title: l10n.skillTechTitle,
        icon: FontAwesomeIcons.code,
        skills: const ["HTML5", "CSS3", "JavaScript", "Python", "C++", "PHP", "SQL", "Git / GitHub", "Flutter"],
        extendedInfo: l10n.skillTechExt,
        color: const Color(0xFF1A73E8),
      ),
      _SkillData(
        title: l10n.skillSoftTitle,
        icon: FontAwesomeIcons.users,
        skills: [l10n.softComm, l10n.softLead, l10n.softTeam, l10n.softCrit, l10n.softProb],
        extendedInfo: l10n.skillSoftExt,
        color: const Color(0xFF9C27B0),
      ),
    ];

    return PageLayout(
      title: l10n.headerSkillsTitle,
      subtitle: l10n.headerSkillsSubtitle,
      icon: FontAwesomeIcons.microchip,
      color: sectionColor,
      children: skillsData.map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ExpandableSkillCard(
          title: item.title,
          icon: item.icon,
          skills: item.skills,
          extendedInfo: item.extendedInfo,
          color: item.color,
        ),
      )).toList(),
    );
  }
}

class _SkillData {
  final String title, extendedInfo;
  final IconData icon;
  final List<String> skills;
  final Color color;

  _SkillData({
    required this.title,
    required this.icon,
    required this.skills,
    required this.extendedInfo,
    required this.color,
  });
}