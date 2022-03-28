import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';

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
                    child: NoAccesScreen(),
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [

                    //     ],
                    //   ),
                    // ),
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
