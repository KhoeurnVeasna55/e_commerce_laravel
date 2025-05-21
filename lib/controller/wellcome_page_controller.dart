import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WellcomePageController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void onPageChange(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  void skip() {
    pageController.jumpToPage(2);
  }
}
