import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_mart/bindlings/bindling.dart';
import 'package:online_mart/pages/wellcome_page/mainl_wellcome_page.dart';
import 'package:online_mart/theme/apptheme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Mart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: Bindling(),
      home:  MainlWellcomePage(),
    );
  }
}
