import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
        //support qilinadigan tillar ro'yhati
        supportedLocales: const [
          Locale("en", "US"),
          Locale("ru", "RU"),
          Locale("uz", "UZ")
        ],
        path: "assets/translations",
        saveLocale: true,
        fallbackLocale: const    Locale("en", "US"), //default language
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}