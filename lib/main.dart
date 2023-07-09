import 'package:flutter/material.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/view/home_screen.dart';
import 'package:get/get.dart';

import 'language/controller/language_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await switchLanguageController.initLanguage();
  runApp(const MyApp());
}

SwitchLanguageController switchLanguageController =
    Get.put(SwitchLanguageController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: ChangeLocalControlller(),
      debugShowCheckedModeBanner: false,
      locale: switchLanguageController.english.value
          ? const Locale('en', 'US')
          : const Locale('KH', 'KH'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Food App'),
    );
  }
}
