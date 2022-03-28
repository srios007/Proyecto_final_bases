import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class YellowButton extends StatelessWidget {
  YellowButton({
    Key? key,
    this.buttonText,
    required this.isLoading,
    required this.onPressed,
    this.icon,
    this.width,
  }) : super(key: key);

  RxBool isLoading;
  String? buttonText;
  Icon? icon;
  void Function() onPressed;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width ?? 500,
        height: 55,
        child: MaterialButton(
          child: isLoading.value
              ? Container(
                  height: 20,
                  width: 20,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          buttonText ?? 'Continuar',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      buttonText ?? 'Continuar',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
          color: Palette.yellow,
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          onPressed: isLoading.value ? () {} : onPressed,
        ),
      ),
    );
  }
}
