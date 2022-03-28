import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDPRk6-_Yi2wlH-KqOQeoyNTMTfKmoOS2I",
      appId: "1:753019267736:web:23fd07785ff79c9516feed",
      messagingSenderId: "753019267736",
      projectId: "proyecto-final-bases-a69ef",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Módulo teatro",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
