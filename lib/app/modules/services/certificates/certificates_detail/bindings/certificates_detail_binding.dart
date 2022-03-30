import 'package:get/get.dart';

import '../controllers/certificates_detail_controller.dart';

class CertificatesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CertificatesDetailController>(
      () => CertificatesDetailController(),
    );
  }
}
