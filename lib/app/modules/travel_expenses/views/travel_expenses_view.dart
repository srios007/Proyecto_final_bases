import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';
import 'package:proyecto_final_bases/app/widgets/tab_bar_contents.dart';

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
              child: Column(
                children: [
                  TopBarContents(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}