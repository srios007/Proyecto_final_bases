import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/normal_input.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';

import '../controllers/certificates_detail_controller.dart';

class CertificatesDetailView extends GetView<CertificatesDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              imageReferences.backgroundLogin,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black.withOpacity(0.8),
              // child: Image.asset(
              //   imageReferences.logo,
              // ),
              child: Column(
                children: [
                  TopBarContents(),
                  Container(
                    height: Get.height - 200,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: Get.width,
                              color: Colors.black.withOpacity(0.6),
                              child: Center(
                                child: Text(
                                  'Búsqueda por código',
                                  style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height - 280,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 50),
                                  NormalInput(
                                    title: 'Ingrese el código del estudiante',
                                    hintText: 'Santiago',
                                    width: Get.width * 0.8,
                                    controller: controller.codeController,
                                  ),
                                  Obx(
                                    () => controller.isLoading.value
                                        ? const CircularProgressIndicator()
                                        : controller.empty.value
                                            ? Text(
                                                'No hay estudiantes con este código',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Column(
                                                children: [
                                                  Text(
                                                    'Nombre: ${controller.search!.items![0].nombreestudiante}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Apellido: ${controller.search!.items![0].apellidoestudiante}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Obra: ${controller.search!.items![0].titulo}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Personaje: ${controller.search!.items![0].nompersonaje}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Palette.lightGray,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              color: Palette.yellow.withOpacity(0.2),
                              child: Center(
                                child: YellowButton(
                                  width: Get.width * 0.4,
                                  buttonText: 'Buscar',
                                  isLoading: false.obs,
                                  onPressed: controller.searchStudent ,
                                  isActive: true.obs,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Palette.yellow.withOpacity(0.2),
                              child: Center(
                                child: YellowButton(
                                  width: Get.width * 0.4,
                                  buttonText: 'Generar certificado',
                                  isLoading: false.obs,
                                  onPressed: () {
                                    controller.generateCertificate();
                                    customDialogs.showMessageDialog(
                                      Get.context,
                                      "¡Listo!, tu pdf fue generdo con éxito",
                                      "Tu pdf fue generdo con éxito",
                                    );
                                  },
                                  isActive: true.obs,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
