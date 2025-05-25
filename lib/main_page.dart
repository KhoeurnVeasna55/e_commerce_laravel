import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_mart/bindlings/bindling.dart';
import 'package:online_mart/core/services/store_wellcome.dart';
import 'package:online_mart/pages/auth_page/login_page.dart';
import 'package:online_mart/pages/wellcome_page/mainl_wellcome_page.dart';
import 'package:online_mart/theme/apptheme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final StoreWellcome _storeWellcome = StoreWellcome();
  bool isComplated = false;
  @override
  void initState() {
    super.initState();
    isComplateWellcome();
  }

  void isComplateWellcome() async {
    final bool status = await _storeWellcome.getWellcomePage();
    setState(() {
      isComplated = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Mart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: Bindling(),
      home:isComplated ? LoginPage() : MainlWellcomePage(),
    );
  }
}
