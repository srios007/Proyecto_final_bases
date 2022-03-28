import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class NormalInput extends StatelessWidget {
  NormalInput({
    Key? key,
    required this.hintText,
    this.helperText = '',
    required this.controller,
    this.border,
    this.textStyle,
    this.width,
    required this.title,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  String hintText;
  String title;
  String helperText;
  TextEditingController controller;
  InputBorder? border;
  TextStyle? textStyle;
  double? width;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

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
              width: width ?? Get.width - 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: width ?? Get.width - 100,
              child: TextFormField(
                style: textStyle,
                inputFormatters: inputFormatters??[],
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
                validator: validator ??
                    (String? _) {
                      if (controller.text.isEmpty) {
                        return 'Por favor, rellena este campo';
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
