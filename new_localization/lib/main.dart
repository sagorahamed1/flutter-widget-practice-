import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _change;

  changeLanguage(Locale locale) async {
    SharedPreferences raj = await SharedPreferences.getInstance();
    raj.setString("name", locale.languageCode);
    setState(() {
      _change = locale;
    });
  }

  loadLanguageFromLanguage() async {
    SharedPreferences raj = await SharedPreferences.getInstance();
    String languageCode = raj.getString('name') ?? 'en';
    setState(() {
      _change = Locale(languageCode);
    });
  }

  @override
  void initState() {
    super.initState();
    loadLanguageFromLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      locale: _change,
      supportedLocales: [
        Locale('en'),
        Locale('bn')
      ],
      home: HomePage(fnChange: changeLanguage),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function fnChange;
  const HomePage({super.key, required this.fnChange});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.name),),
      body: Column(
        children: [
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              //akhane বাংলাদেশ lakha ta mistake celo tai languechange hoi nai.............
              var locale = AppLocalizations.of(context)!.name == "বাংলাদেশ" ? Locale('en') : Locale('bn');
              widget.fnChange(locale);
            },
            child: Text("Change language"),
          ),
          Text(AppLocalizations.of(context)!.history),
        ],
      ),
    );
  }
}