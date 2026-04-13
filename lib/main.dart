import 'package:ecomerce/bottomnave/categoriesscreen.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/provider/ageselectprovider.dart';
import 'package:ecomerce/provider/categorryprovider.dart';

import 'package:ecomerce/provider/genderprovider.dart';
import 'package:ecomerce/provider/loginprovider.dart';
import 'package:ecomerce/provider/longuageprovider.dart';
import 'package:ecomerce/provider/selectstyleprovider.dart';
import 'package:ecomerce/provider/signupprovider.dart';
import 'package:ecomerce/splashmothod/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectStylesProvider()),
        ChangeNotifierProvider(create: (_) => AgeSelectProvider()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SignProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => Categoriprovider()),
      ],
      // Consumer ka use karein taaki LanguageProvider ke change hone par MaterialApp rebuild ho
      child: Consumer<LanguageProvider>(
        builder: (context, langProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Ab ye sahi se update hoga
            locale: langProvider.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const Splashscreen(),
          );
        },
      ),
    );
  }
}
