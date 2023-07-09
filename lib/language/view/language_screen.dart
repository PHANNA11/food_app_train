import 'package:flutter/material.dart';

import 'package:food_app/language/controller/language_controller.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);
  final languageController = Get.put(SwitchLanguageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchLanguageController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('language'.tr),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  languageController.switchLanguage(false);
                  Get.updateLocale(const Locale('KH', 'KH'));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.britannica.com/27/4027-004-B57F84E9/Flag-Cambodia.jpg'))),
                    ),
                    languageController.english.value == false
                        ? const Positioned(
                            right: 10,
                            top: 5,
                            child: CircleAvatar(
                              maxRadius: 15,
                              child: Icon(Icons.done),
                            ))
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  languageController.switchLanguage(true);
                  Get.updateLocale(const Locale('en', 'US'));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'))),
                    ),
                    languageController.english.value
                        ? const Positioned(
                            right: 10,
                            top: 5,
                            child: CircleAvatar(
                              maxRadius: 15,
                              child: Icon(Icons.done),
                            ))
                        : const SizedBox()
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
