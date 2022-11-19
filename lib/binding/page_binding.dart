import 'package:get/get.dart';
import 'package:upwork/controller/first_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
//--------------------------------------for navigation btn
    Get.put(BottomSheetPageController(), permanent: false);
  }
}
