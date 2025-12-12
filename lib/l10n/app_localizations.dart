import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @profileTitle.
  ///
  /// In es, this message translates to:
  /// **'Ignacio Alvarado Toledo'**
  String get profileTitle;

  /// No description provided for @profileRole.
  ///
  /// In es, this message translates to:
  /// **'Ingeniero en Informática'**
  String get profileRole;

  /// No description provided for @profileTagline.
  ///
  /// In es, this message translates to:
  /// **'Especializado en Desarrollo Web & Soluciones Accesibles'**
  String get profileTagline;

  /// No description provided for @profileAboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Sobre Mí'**
  String get profileAboutTitle;

  /// No description provided for @profileAboutText1.
  ///
  /// In es, this message translates to:
  /// **'Como estudiante de ingeniería de 25 años, mi vida transcurre entre líneas de código y la búsqueda constante de soluciones eficientes. Soy un apasionado por la tecnología que cree firmemente en el aprendizaje práctico.'**
  String get profileAboutText1;

  /// No description provided for @profileAboutText2.
  ///
  /// In es, this message translates to:
  /// **'Me motiva resolver problemas reales utilizando tecnología moderna, manteniendo un enfoque en la innovación sostenible y la ética profesional.'**
  String get profileAboutText2;

  /// No description provided for @navProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get navProfile;

  /// No description provided for @navEducation.
  ///
  /// In es, this message translates to:
  /// **'Formación'**
  String get navEducation;

  /// No description provided for @navSkills.
  ///
  /// In es, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navProjects.
  ///
  /// In es, this message translates to:
  /// **'Proyectos'**
  String get navProjects;

  /// No description provided for @navContact.
  ///
  /// In es, this message translates to:
  /// **'Contacto'**
  String get navContact;

  /// No description provided for @headerEducationTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Camino Académico'**
  String get headerEducationTitle;

  /// No description provided for @headerEducationSubtitle.
  ///
  /// In es, this message translates to:
  /// **'El aprendizaje es un viaje continuo. Aquí están los hitos académicos que han forjado mi perfil profesional.'**
  String get headerEducationSubtitle;

  /// No description provided for @edu1Inst.
  ///
  /// In es, this message translates to:
  /// **'Universidad Tecnológica Metropolitana'**
  String get edu1Inst;

  /// No description provided for @edu1Title.
  ///
  /// In es, this message translates to:
  /// **'Ingeniería en Informática'**
  String get edu1Title;

  /// No description provided for @edu1Period.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get edu1Period;

  /// No description provided for @edu1Desc.
  ///
  /// In es, this message translates to:
  /// **'Formación integral con énfasis en arquitectura de software, gestión de proyectos TI y ciencia de datos.'**
  String get edu1Desc;

  /// No description provided for @edu1Ext.
  ///
  /// In es, this message translates to:
  /// **'• Especialización en metodologías ágiles (Scrum/Kanban).\n• Liderazgo en proyectos semestrales de desarrollo web.\n• Ayudantía en cátedra de Bases de Datos.\n• Promedio destacado en asignaturas de programación.'**
  String get edu1Ext;

  /// No description provided for @edu2Inst.
  ///
  /// In es, this message translates to:
  /// **'Santander Open Academy'**
  String get edu2Inst;

  /// No description provided for @edu2Title.
  ///
  /// In es, this message translates to:
  /// **'Certificaciones Varias'**
  String get edu2Title;

  /// No description provided for @edu2Period.
  ///
  /// In es, this message translates to:
  /// **'2025'**
  String get edu2Period;

  /// No description provided for @edu2Desc.
  ///
  /// In es, this message translates to:
  /// **'Cursos intensivos enfocados en complementar habilidades técnicas y blandas.'**
  String get edu2Desc;

  /// No description provided for @edu2Ext.
  ///
  /// In es, this message translates to:
  /// **'• Python Avanzado: Manejo de datos con Pandas y NumPy.\n• Power BI: Creación de dashboards interactivos para toma de decisiones.\n• SEO Marketing: Optimización de motores de búsqueda para e-commerce.\n• Inglés B2: Comunicación fluida en entornos de negocios.'**
  String get edu2Ext;

  /// No description provided for @headerSkillsTitle.
  ///
  /// In es, this message translates to:
  /// **'Arsenal Tecnológico'**
  String get headerSkillsTitle;

  /// No description provided for @headerSkillsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Un conjunto equilibrado de herramientas técnicas y habilidades interpersonales para crear valor real.'**
  String get headerSkillsSubtitle;

  /// No description provided for @skillTechTitle.
  ///
  /// In es, this message translates to:
  /// **'Tecnologías'**
  String get skillTechTitle;

  /// No description provided for @skillTechExt.
  ///
  /// In es, this message translates to:
  /// **'Mi enfoque es agnóstico a la tecnología, eligiendo siempre la herramienta adecuada para el problema. Tengo experiencia sólida en el ciclo de vida completo del desarrollo, desde el diseño de base de datos relacionales hasta el despliegue en entornos cloud y móviles.'**
  String get skillTechExt;

  /// No description provided for @skillSoftTitle.
  ///
  /// In es, this message translates to:
  /// **'Habilidades Blandas'**
  String get skillSoftTitle;

  /// No description provided for @skillSoftExt.
  ///
  /// In es, this message translates to:
  /// **'Valoro el factor humano por encima del código. Me esfuerzo por crear ambientes de trabajo psicológicamente seguros donde las ideas puedan fluir libremente. Creo que la técnica sin comunicación no escala, por lo que priorizo la claridad y la empatía.'**
  String get skillSoftExt;

  /// No description provided for @softComm.
  ///
  /// In es, this message translates to:
  /// **'Comunicación Efectiva'**
  String get softComm;

  /// No description provided for @softLead.
  ///
  /// In es, this message translates to:
  /// **'Liderazgo'**
  String get softLead;

  /// No description provided for @softTeam.
  ///
  /// In es, this message translates to:
  /// **'Trabajo en Equipo'**
  String get softTeam;

  /// No description provided for @softCrit.
  ///
  /// In es, this message translates to:
  /// **'Pensamiento Crítico'**
  String get softCrit;

  /// No description provided for @softProb.
  ///
  /// In es, this message translates to:
  /// **'Resolución de Problemas'**
  String get softProb;

  /// No description provided for @headerProjectsTitle.
  ///
  /// In es, this message translates to:
  /// **'Portafolio de Proyectos'**
  String get headerProjectsTitle;

  /// No description provided for @headerProjectsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'De la idea a la producción. Una selección de desarrollos que demuestran mi capacidad de ejecución.'**
  String get headerProjectsSubtitle;

  /// No description provided for @proj1Title.
  ///
  /// In es, this message translates to:
  /// **'Web Pyme Bazar'**
  String get proj1Title;

  /// No description provided for @proj1Role.
  ///
  /// In es, this message translates to:
  /// **'Desarrollador Fullstack'**
  String get proj1Role;

  /// No description provided for @proj1Desc.
  ///
  /// In es, this message translates to:
  /// **'Plataforma de gestión completa para pymes con inventario y control de ventas.'**
  String get proj1Desc;

  /// No description provided for @proj1Ext.
  ///
  /// In es, this message translates to:
  /// **'Sistema de gestión de inventario en tiempo real. Incluye módulos de reportes de ventas diarios y mensuales, autenticación de usuarios con roles diferenciados y alertas automáticas de stock bajo.'**
  String get proj1Ext;

  /// No description provided for @proj2Title.
  ///
  /// In es, this message translates to:
  /// **'App Alimentación'**
  String get proj2Title;

  /// No description provided for @proj2Role.
  ///
  /// In es, this message translates to:
  /// **'UX/UI & Mobile Dev'**
  String get proj2Role;

  /// No description provided for @proj2Desc.
  ///
  /// In es, this message translates to:
  /// **'Aplicación móvil para seguimiento de dietas saludables. MVP lanzado con éxito.'**
  String get proj2Desc;

  /// No description provided for @proj2Ext.
  ///
  /// In es, this message translates to:
  /// **'Desarrollada con Flutter y backend en Firebase. Integra notificaciones push personalizadas, seguimiento de calorías mediante gráficos interactivos y una interfaz diseñada bajo principios de Material Design 3.'**
  String get proj2Ext;

  /// No description provided for @proj3Title.
  ///
  /// In es, this message translates to:
  /// **'Smart Collar IoT'**
  String get proj3Title;

  /// No description provided for @proj3Role.
  ///
  /// In es, this message translates to:
  /// **'Ingeniero IoT'**
  String get proj3Role;

  /// No description provided for @proj3Desc.
  ///
  /// In es, this message translates to:
  /// **'Dispositivo de rastreo GPS para mascotas con comunicación en tiempo real.'**
  String get proj3Desc;

  /// No description provided for @proj3Ext.
  ///
  /// In es, this message translates to:
  /// **'Integración de hardware Arduino con módulos GPS/GSM. El dispositivo envía coordenadas en tiempo real a un servidor central, permitiendo la visualización de la ruta de la mascota en un mapa interactivo con geocercas.'**
  String get proj3Ext;

  /// No description provided for @headerContactTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Tienes un proyecto?'**
  String get headerContactTitle;

  /// No description provided for @headerContactSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Estoy disponible para colaboraciones y nuevas oportunidades laborales. ¡Hablemos!'**
  String get headerContactSubtitle;

  /// No description provided for @btnEmail.
  ///
  /// In es, this message translates to:
  /// **'Enviar Correo'**
  String get btnEmail;

  /// No description provided for @btnGithub.
  ///
  /// In es, this message translates to:
  /// **'Ver GitHub'**
  String get btnGithub;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get settingsAppearance;

  /// No description provided for @settingsDarkMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Oscuro'**
  String get settingsDarkMode;

  /// No description provided for @settingsDarkModeSub.
  ///
  /// In es, this message translates to:
  /// **'Cambiar a tema oscuro para descansar la vista.'**
  String get settingsDarkModeSub;

  /// No description provided for @settingsAccessibility.
  ///
  /// In es, this message translates to:
  /// **'Accesibilidad'**
  String get settingsAccessibility;

  /// No description provided for @settingsHighContrast.
  ///
  /// In es, this message translates to:
  /// **'Alto Contraste'**
  String get settingsHighContrast;

  /// No description provided for @settingsHighContrastSub.
  ///
  /// In es, this message translates to:
  /// **'Forzar modo oscuro con colores de alta visibilidad.'**
  String get settingsHighContrastSub;

  /// No description provided for @settingsReduceMotion.
  ///
  /// In es, this message translates to:
  /// **'Reducir Movimiento'**
  String get settingsReduceMotion;

  /// No description provided for @settingsReduceMotionSub.
  ///
  /// In es, this message translates to:
  /// **'Desactivar animaciones de interfaz.'**
  String get settingsReduceMotionSub;

  /// No description provided for @settingsLanguage.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSub.
  ///
  /// In es, this message translates to:
  /// **'Cambiar el idioma de la aplicación.'**
  String get settingsLanguageSub;

  /// No description provided for @settingsAbout.
  ///
  /// In es, this message translates to:
  /// **'Sobre la App'**
  String get settingsAbout;

  /// No description provided for @settingsSourceCode.
  ///
  /// In es, this message translates to:
  /// **'Código Fuente'**
  String get settingsSourceCode;

  /// No description provided for @settingsVersion.
  ///
  /// In es, this message translates to:
  /// **'Versión'**
  String get settingsVersion;

  /// No description provided for @settingsMadeWith.
  ///
  /// In es, this message translates to:
  /// **'Hecho con 💙 en Flutter'**
  String get settingsMadeWith;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
