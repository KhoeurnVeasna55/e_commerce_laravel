import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_mart/core/services/store_wellcome.dart';
import 'package:online_mart/pages/auth_page/login_page.dart';

class WellcomePageController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  final StoreWellcome _storeWellcome = StoreWellcome();

  void onPageChange(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  Future<void> skip() async {
    await _storeWellcome.saveWellcomeScreen(true);
    Get.offAll(() => LoginPage());
  }
}
