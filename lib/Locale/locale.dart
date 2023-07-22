import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/globals.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/kurdish.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tk': turkish(),
    'sw': swahili(),
    'it': italian(),
    'fa': kurdish(),
  };

  String? get posts {
    return _localizedValues[locale.languageCode]!['posts'];
  }
  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }
  String? get map {
    return _localizedValues[locale.languageCode]!['map'];
  }
  String? get wishlist {
    return _localizedValues[locale.languageCode]!['wishlist'];
  }
  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }
  String? get categories {
    return _localizedValues[locale.languageCode]!['categories'];
  }
  String? get search {
    return _localizedValues[locale.languageCode]!['search'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }
  String? get placesToGo {
    return _localizedValues[locale.languageCode]!['placesToGo'];
  }
  String? get sights {
    return _localizedValues[locale.languageCode]!['sights'];
  }
  String? get aboutHiErbil {
    return _localizedValues[locale.languageCode]!['aboutHiErbil'];
  }
  String? get privacyAndPolicy {
    return _localizedValues[locale.languageCode]!['privacyAndPolicy'];
  }
  String? get settings {
    return _localizedValues[locale.languageCode]!['settings'];
  }
  String? get sorryThereIsNoPlace {
    return _localizedValues[locale.languageCode]!['sorryThereIsNoPlace'];
  }
  String? get youDoNotHaveAny {
    return _localizedValues[locale.languageCode]!['youDoNotHaveAny'];
  }
  String? get version {
    return _localizedValues[locale.languageCode]!['version'];
  }
  String? get lightMode {
    return _localizedValues[locale.languageCode]!['lightMode'];
  }
  String? get darkMode {
    return _localizedValues[locale.languageCode]!['darkMode'];
  }
  String? get auto {
    return _localizedValues[locale.languageCode]!['auto'];
  }
  String? get englishh {
    return _localizedValues[locale.languageCode]!['english'];
  }
  String? get kurdishh {
    return _localizedValues[locale.languageCode]!['kurdish'];
  }
  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }
  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabic'];
  }





}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'id',
        'pt',
        'fr',
        'es',
        'tk',
        'sw',
        'it',
        'fa'
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {

    if (kDebugMode) {
      print(locale);
    }
    lang = locale.toString();
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

int getCurrentLanguage(Locale locale) {
  if (locale == const Locale('en')) {
    return 0;
  } else if (locale == const Locale('ar')) {
    return 1;
  } else if (locale == const Locale('fr')) {
    return 2;
  } else if (locale == const Locale('id')) {
    return 3;
  } else if (locale == const Locale('pt')) {
    return 4;
  } else if (locale == const Locale('es')) {
    return 5;
  } else if (locale == const Locale('it')) {
    return 6;
  } else if (locale == const Locale('tr')) {
    return 7;
  } else if (locale == const Locale('sw')) {
    return 8;
  } else {
    return -1;
  }
}
