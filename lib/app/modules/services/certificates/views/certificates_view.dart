import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';

import '../controllers/certificates_controller.dart';

class CertificatesView extends GetView<CertificatesController> {
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
                    child: controller.condition.value
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: Get.width,
                                    color: Colors.black.withOpacity(0.6),
                                    child: Center(
                                      child: Text(
                                        'Obras en las que actué',
                                        style: TextStyle(
                                          fontSize: 48,
                                          color: controller.firstPlay.value
                                              ? Colors.white
                                              : Colors.grey,
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
                                    width: Get.width * 0.5,
                                    height: Get.height - 280,
                                    color: Colors.white.withOpacity(0.9),
                                    child: PlaysPlayed(
                                      controller: controller,
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 0.5,
                                    height: Get.height - 280,
                                    color: Colors.white.withOpacity(0.8),
                                    child: StudentsListView(
                                      controller: controller,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : NoAccesScreen(),
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
                                  buttonText: 'Hacer búsqueda especializada',
                                  isLoading: controller.isLoading,
                                  onPressed: controller.goToDetail,
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

class NoAccesScreen extends StatelessWidget {
  const NoAccesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Text(
            'Oops...hay obras activas, esta funcinalidad no está disponible por el momento',
            style: TextStyle(
              fontSize: 48,
              color: Palette.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: Get.height * 0.6,
            child: Image.asset(
              imageReferences.noData,
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class StudentsListView extends StatelessWidget {
  StudentsListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  CertificatesController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: Get.width,
              height: Get.height,
              child: ListView.builder(
                itemCount: controller
                    .playsList[controller.position.value].students!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 100,
                          width: Get.width * 0.5 - 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre del estudiante:',
                                      style: const TextStyle(
                                        color: Palette.yellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller
                                          .playsList[controller.position.value]
                                          .students![index]
                                          .name!,
                                      style: const TextStyle(
                                        color: Palette.darkBlue,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                YellowButton(
                                  width: 250,
                                  buttonText: 'Generar certificado',
                                  isLoading: false.obs,
                                  onPressed: () {
                                    controller.generateLiquidation(controller
                                        .playsList[controller.position.value]
                                        .students![index]);
                                  },
                                  isActive: true.obs,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class PlaysPlayed extends StatelessWidget {
  PlaysPlayed({
    Key? key,
    required this.controller,
  }) : super(key: key);

  CertificatesController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: Get.width,
              height: Get.height,
              child: ListView.builder(
                itemCount: controller.playsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 100,
                          width: Get.width * 0.5 - 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nombre de la obra:',
                                      style: const TextStyle(
                                        color: Palette.yellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.playsList[index].playName!,
                                      style: const TextStyle(
                                        color: Palette.darkBlue,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                YellowButton(
                                  width: 250,
                                  buttonText: 'Ver estudiantes',
                                  isLoading: false.obs,
                                  onPressed: () {
                                    controller.position.value = index;
                                  },
                                  isActive: true.obs,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
