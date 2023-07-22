import 'package:flutter/material.dart';
import 'Locale/language_cubit.dart';
import 'Locale/locale.dart';
import 'Theme/theme_notifier.dart';
import 'Theme/theme_values.dart';
import 'core/globals.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart'  as flutter_localizations;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(appTheme), child: const LaunchPage()),);
}

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =  ValueNotifier(ThemeMode.system);
  @override
  Widget build(BuildContext context) {
    final themeNotifier_ = Provider.of<ThemeNotifier>(context);
    // String lan = "";
    if( globalSH.getString("ThemeMode")==""){
      LaunchPage.themeNotifier.value = ThemeMode.system;
    }else if(globalSH.getString("ThemeMode")=="dark"){

      LaunchPage.themeNotifier.value = ThemeMode.dark;
    }else if(globalSH.getString("ThemeMode")=="light"){
      LaunchPage.themeNotifier.value = ThemeMode.light;
    }

    if (globalSH.getString(CACHED_USER_LANGUAGE) == 'ar') {
      lang = 'ar';
    }
    else if (globalSH.getString(CACHED_USER_LANGUAGE) == 'ku') {
      lang = 'fa';
    }
    else {
      lang = 'en';
    }

    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(Locale(lang)),//Locale(lang)
      child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) =>

              ValueListenableBuilder<ThemeMode>(
                  valueListenable: themeNotifier,
                  builder: (_, ThemeMode currentMode, __) {

                    return MaterialApp(
                      title: 'Hi Erbil',
                      debugShowCheckedModeBanner: false,
                      themeMode: currentMode,
                      theme: themeNotifier_.getTheme(),
                      darkTheme: darkTheme,
                      localizationsDelegates: const [
                        AppLocalizationsDelegate(),
                        flutter_localizations.GlobalMaterialLocalizations.delegate,
                        flutter_localizations.GlobalWidgetsLocalizations.delegate,
                        flutter_localizations.GlobalCupertinoLocalizations.delegate,
                      ],
                      localeListResolutionCallback: (locales, supportedLocales) {
                        if (globalSH.getString(CACHED_USER_LANGUAGE) == null ||
                            globalSH.getString(CACHED_USER_LANGUAGE) == "") {
                          lang = supportedLocales.toString()[1] + supportedLocales.toString()[2];
                          globalSH.setString(CACHED_USER_LANGUAGE, lang);
                        }
                        else {
                          if (globalSH.getString(CACHED_USER_LANGUAGE) == 'ar') {
                            lang = 'ar';
                          }
                          else if (globalSH.getString(CACHED_USER_LANGUAGE) == 'ku') {
                            lang = 'fa';
                          }
                          else {
                            lang = 'en';
                          }
                        }
                      },
                      supportedLocales: const [
                        Locale('en'),
                        Locale('ar'),
                        Locale('id'),
                        Locale('fr'),
                        Locale('pt'),
                        Locale('es'),
                        Locale('tk'),
                        Locale('sw'),
                        Locale('it'),
                        Locale('fa'),
                      ],
                      locale: locale,
                      home: const NavPage(),
                    );
                  })
      ),
    );
  }
}

