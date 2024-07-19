import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this is a collection of all language
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.welcomeMessage,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              localizations.languageSelection,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('en')),
              child: Text(localizations.englishOption),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeLocale(context, Locale('es')),
              child: Text(localizations.spanishOption),
            ),
          ],
        ),
      ),
    );
  }
 // this is a function to replace the content and open our screen again

  void _changeLocale(BuildContext context, Locale newLocale) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Localizations.override(
          context: context,
          locale: newLocale,
          child: Home(),
        ),
      ),
    );
  }
}
