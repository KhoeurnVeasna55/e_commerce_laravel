import 'package:get/get.dart';

import '../controller/wellcome_page_controller.dart';


class Bindling extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(()=> WellcomePageController());
  }
}