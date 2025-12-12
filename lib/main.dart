import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portafolio_app/l10n/app_localizations.dart';

import 'config/preferences_notifier.dart';
import 'config/app_theme.dart';
import 'utils/navigation_utils.dart';

import 'views/profile_view.dart';
import 'views/education_view.dart';
import 'views/skills_view.dart';
import 'views/projects_view.dart';
import 'views/contact_view.dart';
import 'views/settings_view.dart';

void main() {
  runApp(const PortafolioApp());
}

class PortafolioApp extends StatelessWidget {
  const PortafolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppPreferences>(
      valueListenable: preferencesNotifier,
      builder: (context, prefs, child) {
        return MaterialApp(
          title: 'Ignacio Alvarado',
          debugShowCheckedModeBanner: false,
          
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('es'), Locale('en')],
          locale: prefs.locale,

          theme: AppTheme.build(mode: Brightness.light, isHighContrast: prefs.highContrast),
          darkTheme: AppTheme.build(mode: Brightness.dark, isHighContrast: prefs.highContrast),
          themeMode: prefs.highContrast ? ThemeMode.dark : prefs.themeMode,
          
          home: const MainScreen(),
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  static const List<Widget> _screens = [
    ProfileView(),
    EducationView(),
    SkillsView(),
    ProjectsView(),
    ContactView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onDestinationSelected(int index) {
    setState(() => _selectedIndex = index);
    // Usamos la utilidad centralizada
    NavigationUtils.animatePage(_pageController, index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return const Scaffold();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(l10n, _selectedIndex),
        ),
        centerTitle: false, 
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: l10n.settingsTitle,
              onPressed: () {
                NavigationUtils.push(context, const SettingsView());
              },
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        physics: const BouncingScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: l10n.navProfile),
          NavigationDestination(icon: const Icon(Icons.school_outlined), selectedIcon: const Icon(Icons.school), label: l10n.navEducation),
          NavigationDestination(icon: const Icon(Icons.bolt_outlined), selectedIcon: const Icon(Icons.bolt), label: l10n.navSkills),
          NavigationDestination(icon: const Icon(Icons.code_outlined), selectedIcon: const Icon(Icons.code), label: l10n.navProjects),
          NavigationDestination(icon: const Icon(Icons.mail_outline), selectedIcon: const Icon(Icons.mail), label: l10n.navContact),
        ],
      ),
    );
  }

  String _getTitle(AppLocalizations l10n, int index) {
    switch (index) {
      case 0: return 'Ignacio.Dev';
      case 1: return l10n.navEducation;
      case 2: return l10n.navSkills;
      case 3: return l10n.navProjects;
      case 4: return l10n.navContact;
      default: return 'Ignacio.Dev';
    }
  }
}