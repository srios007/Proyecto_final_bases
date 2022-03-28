import 'package:get/get.dart';
import '../utils/utils.dart';

class ModuleSnackBars {
  static showSuccessSnackBar(message) => Get.showSnackbar(
        GetSnackBar(
          title: '¡Listo!',
          message: message,
          duration: const Duration(seconds: 5),
          backgroundColor: Palette.yellow,
        ),
      );
  static showErrorSnackBar(message) => Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: message,
          duration: const Duration(seconds: 5),
        ),
      );
}
