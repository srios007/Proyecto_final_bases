import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';
import 'package:proyecto_final_bases/app/widgets/yellow_button.dart';
import '../controllers/assistance_controller.dart';

class AssistanceView extends GetView<AssistanceController> {
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
                              Row(
                                children: [
                                  Center(
                                    child: Container(
                                      width: Get.width * 0.5,
                                      height: Get.height - 160,
                                      color: Colors.white.withOpacity(0.9),
                                      child: StudentsListView(
                                        controller: controller,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 0.5,
                                    height: Get.height - 160,
                                    color: Colors.white.withOpacity(0.6),
                                    child: SelectedStudentsListView(
                                      controller: controller,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : NoAccesScreen(),
                  )
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

  AssistanceController controller;

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
                itemCount: controller.students.length,
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
                                      controller.students[index].name!,
                                      style: const TextStyle(
                                        color: Palette.darkBlue,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                LizitCheckBoxBlue(
                                  onChanged: (value) {
                                    controller.onChanged(index);
                                  },
                                  value: controller.students[index].isSelected!,
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

class SelectedStudentsListView extends StatelessWidget {
  SelectedStudentsListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  AssistanceController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height - 300,
                  child: ListView.builder(
                    itemCount: controller.selectedStudents.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                20,
                                index == 0 ? 40 : 0,
                                20,
                                0,
                              ),
                              height: 40,
                              width: Get.width * 0.5 - 40,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .selectedStudents[index].name!,
                                          style: const TextStyle(
                                            color: Palette.darkBlue,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    YellowButton(
                      width: Get.width * 0.4,
                      buttonText: 'Marcar asistencia',
                      isLoading: controller.isLoading,
                      onPressed: () {},
                      isActive: true.obs,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
    );
  }
}
