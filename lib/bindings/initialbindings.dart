import 'package:get/get.dart';
import 'package:orop/controller/settings_controller.dart';
import 'package:orop/core/class/curd.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SettingsController());
  }
}
