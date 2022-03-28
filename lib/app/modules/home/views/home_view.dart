import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            CupertinoButton(
              child: Container(
                height: 100,
                width: 400,
                color: Colors.black,
              ),
              onPressed: () {
                Get.toNamed(Routes.REGISTER,);
                
              },
            )
          ],
        ),
      ),
    );
  }
}
