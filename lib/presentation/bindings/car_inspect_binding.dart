import 'package:car_inspect/presentation/controllers/car_inspect_controller.dart';
import 'package:get/get.dart';

class CarInspectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarInspectController());
  }
}
