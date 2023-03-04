import 'package:flutter/material.dart';

import 'Locale/language_cubit.dart';
import 'Locale/locale.dart';
import 'Theme/theme_notifier.dart';
import 'Theme/theme_values.dart';
import 'core/globals.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart'  as flutter_localizations;
import 'package:flutter_bloc/flutter_bloc.dart';

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
    String lan = "";

    if( globalSH.getString("ThemeMode")==""){
      LaunchPage.themeNotifier.value = ThemeMode.system;
    }else if(globalSH.getString("ThemeMode")=="dark"){

      LaunchPage.themeNotifier.value = ThemeMode.dark;
    }else if(globalSH.getString("ThemeMode")=="light"){
      LaunchPage.themeNotifier.value = ThemeMode.light;
    }

    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(Locale(lang)),
      child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) =>

              ValueListenableBuilder<ThemeMode>(
                  valueListenable: themeNotifier,
                  builder: (_, ThemeMode currentMode, __) {



                    return MaterialApp(
                      title: 'YBS',
                      debugShowCheckedModeBanner: false,
                      themeMode: currentMode,
                      theme: themeNotifier_.getTheme(),
                      darkTheme: darkTheme,

                      localizationsDelegates: const [
                        AppLocalizationsDelegate(),
                        flutter_localizations.GlobalMaterialLocalizations.delegate,
                      ],
                      localeListResolutionCallback: (locales, supportedLocales) {
                        if (globalSH.getString(CACHED_USER_LANGUAGE) == null ||
                            globalSH.getString(CACHED_USER_LANGUAGE) == "") {
                          lan = supportedLocales.toString()[1] + supportedLocales.toString()[2];
                          globalSH.setString(CACHED_USER_LANGUAGE, lan);
                        } else {
                          if (globalSH.getString(CACHED_USER_LANGUAGE) == 'ar') {
                            lan = 'ar';
                          }
                          else if (globalSH.getString(CACHED_USER_LANGUAGE) == 'kr') {
                            lan = 'fa';
                          }
                          else {
                            lan = 'en';

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
                      home:  const HomePage(),

                    );


                  })


      ),
    );
  }
}

