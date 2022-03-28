import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();



  final formKeyNewBankAccount = GlobalKey<FormState>();

  var isLoading = false.obs;

}
