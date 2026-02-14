import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.images.book1.path),
          Text(context.tr("hello"), style: TextStyle(fontFamily: "DM")),
          ElevatedButton.icon(
            onPressed: () {
              context.locale.languageCode == "en"
                  ? context.setLocale(Locale("ar"))
                  : context.setLocale(Locale("en"));
            },
            label: Icon(Icons.eighteen_mp),
          ),
        ],
      ),
    );
  }
}
