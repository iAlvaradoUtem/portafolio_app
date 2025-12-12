import 'package:flutter/material.dart';
import 'base_expandable_card.dart';

// TARJETA EDUCACION
class ExpandableTimelineCard extends StatelessWidget {
  final String institution, title, period, description, extendedInfo;
  final IconData icon;
  final Color color;

  const ExpandableTimelineCard({
    super.key,
    required this.institution,
    required this.title,
    required this.period,
    required this.icon,
    required this.description,
    required this.extendedInfo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSurface;

    return BaseExpandableCard(
      color: color,
      header: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1), 
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(institution, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: titleColor)),
              ],
            ),
          ),
        ],
      ),
      collapsedContent: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(period, style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 12)),
            ),
          ],
        ),
      ),
      expandedContent: Text(
        extendedInfo,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
          height: 1.6,
        ),
      ),
    );
  }
}

// TARJETA SKILLS
class ExpandableSkillCard extends StatelessWidget {
  final String title, extendedInfo;
  final IconData icon;
  final List<String> skills;
  final Color color;

  const ExpandableSkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.skills,
    required this.extendedInfo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSurface;

    return BaseExpandableCard(
      color: color,
      header: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: titleColor)),
          ),
        ],
      ),
      collapsedContent: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Wrap(
          spacing: 8,
          runSpacing: 10,
          children: skills.map((skill) => Chip(
            label: Text(
              skill, 
              style: TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.w600, 
                color: titleColor.withValues(alpha: 0.9)
              )
            ),
            backgroundColor: color.withValues(alpha: 0.1),
            side: BorderSide(color: color.withValues(alpha: 0.5), width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )).toList(),
        ),
      ),
      expandedContent: Text(
        extendedInfo,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
          height: 1.6,
        ),
      ),
    );
  }
}

// TARJETA PROYECTOS
class ExpandableProjectItem extends StatelessWidget {
  final String title, role, image, description, extendedInfo;
  final List<String> tags;
  final Color tagColor;

  const ExpandableProjectItem({
    super.key,
    required this.title,
    required this.role,
    required this.image,
    required this.description,
    required this.extendedInfo,
    required this.tags,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSurface;
    final roleColor = Theme.of(context).brightness == Brightness.dark 
        ? Colors.white 
        : Theme.of(context).primaryColor;

    return BaseExpandableCard(
      color: tagColor, // Usado para el borde activo
      // Pasamos la imagen como topImage para que quede fuera del padding
      topImage: Container(
        height: 180,
        width: double.infinity,
        color: Colors.grey[200],
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
        ),
      ),
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role.toUpperCase(), style: TextStyle(color: roleColor, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: titleColor)),
        ],
      ),
      collapsedContent: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
             Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags.map((tag) => Chip(
                label: Text(
                  tag, 
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: titleColor.withValues(alpha: 0.8))
                ),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                backgroundColor: tagColor.withValues(alpha: 0.05),
                side: BorderSide(color: tagColor.withValues(alpha: 0.5), width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              )).toList(),
            ),
          ],
        ),
      ),
      expandedContent: Text(
        extendedInfo,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
          height: 1.6,
        ),
      ),
    );
  }
}