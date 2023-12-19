import 'package:get/get.dart';

class ProgressController extends GetxController {
  final RxBool isLoading = false.obs;

  static void showLoader() {
    Get.find<ProgressController>().isLoading(true);
  }

  static void hideLoader() {
    Get.find<ProgressController>().isLoading(false);
  }
}
