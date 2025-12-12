import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';
import '../widgets/page_layout.dart';
import '../widgets/expandable_cards.dart';
import '../config/assets.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const Color utemTealColor = Color(0xFF0D9488);

    final projects = [
      _ProjectData(
        title: l10n.proj1Title,
        role: l10n.proj1Role,
        image: AppAssets.projBazar, // Uso de constante
        tags: const ["PHP", "SQL", "HTML/CSS"],
        description: l10n.proj1Desc,
        extendedInfo: l10n.proj1Ext,
      ),
      _ProjectData(
        title: l10n.proj2Title,
        role: l10n.proj2Role,
        image: AppAssets.projFood, // Uso de constante
        tags: const ["Flutter", "Figma", "Firebase"],
        description: l10n.proj2Desc,
        extendedInfo: l10n.proj2Ext,
      ),
      _ProjectData(
        title: l10n.proj3Title,
        role: l10n.proj3Role,
        image: AppAssets.projIot, // Uso de constante
        tags: const ["C++", "Arduino", "Networking"],
        description: l10n.proj3Desc,
        extendedInfo: l10n.proj3Ext,
      ),
    ];

    return PageLayout(
      title: l10n.headerProjectsTitle,
      subtitle: l10n.headerProjectsSubtitle,
      icon: FontAwesomeIcons.laptopCode,
      color: const Color(0xFF1976D2),
      children: projects.map((proj) => ExpandableProjectItem(
        title: proj.title,
        role: proj.role,
        image: proj.image,
        tags: proj.tags,
        description: proj.description,
        extendedInfo: proj.extendedInfo,
        tagColor: utemTealColor,
      )).toList(),
    );
  }
}

class _ProjectData {
  final String title, role, image, description, extendedInfo;
  final List<String> tags;

  _ProjectData({
    required this.title,
    required this.role,
    required this.image,
    required this.tags,
    required this.description,
    required this.extendedInfo,
  });
}