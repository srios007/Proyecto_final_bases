import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';

class TopBarContents extends StatefulWidget {
  TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: Get.width,
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Módulo Teatro',
              style: TextStyle(
                color: Palette.yellow,
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
            Spacer(),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[0] = true : _isHovering[0] = false;
                });
              },
              onTap: () {
                Get.toNamed(Routes.HOME);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      color: _isHovering[0]
                          ? Palette.darkBlue
                          : Palette.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Palette.yellow,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[1] = true : _isHovering[1] = false;
                });
              },
              onTap: () {
                Get.toNamed(Routes.ASSISTANCE);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Asistencia',
                    style: TextStyle(
                      color: _isHovering[1]
                          ? Palette.darkBlue
                          : Palette.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[1],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Palette.yellow,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[2] = true : _isHovering[2] = false;
                });
              },
              onTap: () {
                Get.toNamed(Routes.TRAVEL_EXPENSES);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Viáticos',
                    style: TextStyle(
                      color: _isHovering[2]
                          ? Palette.darkBlue
                          : Palette.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[2],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Palette.yellow,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[3] = true : _isHovering[3] = false;
                });
              },
              onTap: () {
                Get.toNamed(Routes.CERTIFICATES);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Certificados',
                    style: TextStyle(
                      color: _isHovering[3]
                          ? Palette.darkBlue
                          : Palette.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[3],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Palette.yellow,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onHover: (value) {
                setState(() {
                  value ? _isHovering[4] = true : _isHovering[4] = false;
                });
              },
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      color: _isHovering[4] ? Palette.yellow : Palette.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[4],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Palette.yellow,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}
