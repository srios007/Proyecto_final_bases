import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';

import '../controllers/travel_expenses_controller.dart';

class TravelExpensesView extends GetView<TravelExpensesController> {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopBarContents(),
                    Container(
                      height: Get.height - 80,
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
                                          'Obra de teatro ',
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
                                Center(
                                  child: Container(
                                    width: Get.width,
                                    height: Get.height - 160,
                                    color: Colors.white.withOpacity(0.9),
                                    child: StudentsListView(
                                      controller: controller,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : NoAccesScreen(),
                    )
                  ],
                ),
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
            'Oops... parece que está funcinalidad no está disponible por el momento',
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

  TravelExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: (Get.width / 3) - 1,
                      child: Center(
                        child: Text(
                          'Nombre',
                          style: const TextStyle(
                            color: Palette.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 1,
                      color: Palette.darkBlue,
                    ),
                    Container(
                      height: 60,
                      width: (Get.width / 3),
                      child: Center(
                        child: Text(
                          'Sección',
                          style: const TextStyle(
                            color: Palette.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 1,
                      color: Palette.darkBlue,
                    ),
                    Container(
                      height: 60,
                      width: (Get.width / 3) - 1,
                      child: Center(
                        child: Text(
                          'Horas',
                          style: const TextStyle(
                            color: Palette.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: Get.width,
                  height: Get.height - 330,
                  child: ListView.builder(
                    itemCount: controller.students.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Palette.darkBlue,
                            ),
                            bottom: BorderSide(
                              width: 1,
                              color: Palette.darkBlue,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (Get.width / 3) - 1,
                              height: 60,
                              child: Center(
                                child: Text(
                                  controller.students[index].name!,
                                  style: const TextStyle(
                                    color: Palette.darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: Palette.darkBlue,
                            ),
                            Container(
                              width: (Get.width / 3),
                              height: 60,
                              child: Center(
                                child: Text(
                                  controller.students[index].section!,
                                  style: const TextStyle(
                                    color: Palette.darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: Palette.darkBlue,
                            ),
                            Container(
                              height: 60,
                              width: (Get.width / 3) - 1,
                              child: Center(
                                child: Text(
                                  controller.students[index].hours.toString(),
                                  style: const TextStyle(
                                    color: Palette.darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                            color: Palette.lightGray,
                            child: Center(
                              child: YellowButton(
                                width: Get.width * 0.4,
                                buttonText: 'Generar liquidación',
                                isLoading: controller.isLoading,
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
    );
  }
}

class LizitCheckBoxBlue extends StatelessWidget {
  LizitCheckBoxBlue({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);
  RxBool value;
  void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: SizedBox(
        width: 30,
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Palette.darkBlue),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Obx(
              () {
                return Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: value.value,
                    onChanged: onChanged,
                    activeColor: Palette.yellow,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    checkColor: Palette.darkBlue,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
