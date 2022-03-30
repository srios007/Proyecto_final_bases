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
                                    controller: controller.nameController,
                                  ),
                                  Obx(
                                    () => _DropdownField(
                                      title: 'Tipo calle',
                                      dropdownItems: controller.playsType(),
                                      onChanged: controller.chancgeTypeStreet,
                                      selectedValue: controller.play.value,
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
                                  onPressed: () {},
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
                                    controller.generateLiquidation();
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

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    Key? key,
    required this.title,
    required this.dropdownItems,
    required this.onChanged,
    required this.selectedValue,
  }) : super(key: key);

  final String title;
  final List<DropdownMenuItem<String>> dropdownItems;
  final void Function(String?) onChanged;
  final String selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 50,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                width: Get.width * 0.8,
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Palette.lightGray,
                    width: 2,
                  ),
                ),
                child: DropdownButton<String>(
                  underline: const SizedBox.shrink(),
                  value: selectedValue,
                  isExpanded: true,
                  icon: const Icon(CupertinoIcons.chevron_down),
                  iconEnabledColor: Palette.lightGray,
                  iconSize: 20,
                  elevation: 0,
                  style: const TextStyle(
                    color: Palette.darkBlue,
                    fontSize: 16,
                  ),
                  dropdownColor: Colors.white,
                  focusColor: Colors.white,
                  onChanged: onChanged,
                  items: dropdownItems,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
