import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Locam',
      'login': 'Login',
      'username' : "Email",
      'password' : 'Password',
      'forgot' : 'Forgot Password?',
      'enterPass' : 'Please enter your password',
      'enterUser' : 'Please enter your username',
      'calculator' : 'Calculator',
      'offices' : 'Offices',
      'contacts' : 'Contacts',
      'exit': 'Exit Application',
      'ext': 'External links:'
    },
    'fr': {
      'ext': 'Liens externes:',
      'exit': 'Demande de sortie',
      'contacts' : 'Contacts',
      'offices' : 'Des bureaux',
      'calculator' : 'Calculatrice',
      'enterUser' : 's\'il vous plaît entrez votre nom d\'utilisateur',
      'enterPass' : 's\'il vous plait entrez votre mot de passe',
      'forgot' : 'Mot de passe oublié?',
      'password' : 'Mot de passe',
      'username': "Nom d'utilisateur",
      'title': 'Locam',
      'login': 's\'identifier'
    },
  };

 String get ext {
    return _localizedValues[locale.languageCode]['ext'];
  }
 String get exit {
    return _localizedValues[locale.languageCode]['exit'];
  }
 String get contacts {
    return _localizedValues[locale.languageCode]['contacts'];
  }
 String get offices {
    return _localizedValues[locale.languageCode]['offices'];
  }
 String get calculator {
    return _localizedValues[locale.languageCode]['calculator'];
  }
 String get enterUser {
    return _localizedValues[locale.languageCode]['enterUser'];
  }
 String get enterPass {
    return _localizedValues[locale.languageCode]['enterPass'];
  }
 String get forgot {
    return _localizedValues[locale.languageCode]['forgot'];
  }
 String get password {
    return _localizedValues[locale.languageCode]['password'];
  }
  String get username {
    return _localizedValues[locale.languageCode]['username'];
  }
  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
    String get login {
    return _localizedValues[locale.languageCode]['login'];
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}