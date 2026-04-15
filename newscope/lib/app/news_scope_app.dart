import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/app_binding.dart';
import 'package:newscope/routes/app_pages.dart';
import 'package:newscope/routes/app_routes.dart';
import 'package:newscope/themes/app_theme.dart';

class NewsScopeApp extends StatelessWidget {
  const NewsScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NewsScope',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
