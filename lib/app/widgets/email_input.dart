import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class LizitEmailInput extends StatelessWidget {
  LizitEmailInput({
    Key? key,
    required this.hintText,
    this.helperText = '',
    required this.controller,
    this.border,
    this.textStyle,
    this.width,
    required this.title,
  }) : super(key: key);

  String hintText;
  String title;
  String helperText;
  TextEditingController controller;
  InputBorder? border;
  TextStyle? textStyle;
  double? width;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder roundedTextField = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 2,
        color: Palette.lightGray,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: width ?? Get.width - 100,
              child: TextFormField(
                style: textStyle,
                decoration: InputDecoration(
                  fillColor: Colors.white,

                  helperText: helperText,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Palette.darkBlue.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                  ),
                  // errorStyle: styles.errorStyle,
                  enabledBorder: roundedTextField,
                  focusedBorder: roundedTextField,
                  errorBorder: roundedTextField,
                  focusedErrorBorder: roundedTextField,
                ),
                controller: controller,
                validator: (String? _) {
                  // Regex para validación de mail
                  RegExp emailRegExp = RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                      "\\@" +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                      "(" +
                      "\\." +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                      ")+");
                  if (controller.text.isEmpty) {
                    return 'Por favor, rellena este campo';
                  } else if (!emailRegExp.hasMatch(controller.text)) {
                    return 'Por favor, ingresa un email válido';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
