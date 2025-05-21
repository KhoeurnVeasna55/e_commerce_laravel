import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:online_mart/pages/wellcome_page/first_page.dart';
import 'package:online_mart/pages/wellcome_page/second_page.dart';
import 'package:online_mart/pages/wellcome_page/third_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/wellcome_page_controller.dart';

class MainlWellcomePage extends StatefulWidget {
  const MainlWellcomePage({super.key});

  @override
  State<MainlWellcomePage> createState() => _MainlWellcomePageState();
}

class _MainlWellcomePageState extends State<MainlWellcomePage> {
  final WellcomePageController mainlWellcomePage = Get.find();

  final List<Widget> pages = [FirstPage(), SecondPage(),ThirdPage()];
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: mainlWellcomePage.pageController,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: mainlWellcomePage.skip, child: Text('Skip')),
            SmoothPageIndicator(
              controller: mainlWellcomePage.pageController,
              count: pages.length,
              effect: const WormEffect(dotHeight: 16, dotWidth: 16),
            ),
            TextButton(
              onPressed: mainlWellcomePage.nextPage,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
