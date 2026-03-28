import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bookia_app.dart';
import 'core/networking/dio_factory.dart';
import 'features/wishlist/data/models/wishlist_book_model.dart';

void main() async {
  DioFactory.startApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WishlistBookAdapter());
  await Hive.openBox<WishlistBook>('wishlistBox');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    EasyLocalization.ensureInitialized(),
  ]);

  debugInvertOversizedImages = true;
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      child: BookiaApp(token: token),
    ),
  );
}

