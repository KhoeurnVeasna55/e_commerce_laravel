import 'package:get/get.dart';
import 'package:online_mart/controller/auth_contoller.dart';

import '../controller/wellcome_page_controller.dart';


class Bindling extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(()=> WellcomePageController());
    Get.lazyPut(() => AuthController());
  }
}