import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_mock_app/app/presentation/manager/home_controller.dart';
import 'package:user_mock_app/app/presentation/pages/user.dart';
import 'package:user_mock_app/app/presentation/widgets/custom_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.mockList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                    vertical: height * 0.03,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 20,
                    child: GestureDetector(
                      onTap: () {
                        controller.storage.value
                                    .read(controller.mockList[i].id) ==
                                true
                            ? Get.to(UserPage(
                                name: controller.mockList[i].name,
                                id: controller.mockList[i].id))
                            : CustomWidgets().enterDataWidget(
                                context,
                                controller,
                                controller.mockList[i].id,
                                controller.mockList[i].name,
                                i,
                              );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.05 * width),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 41, 40, 40),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.mockList[i].name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Obx(() {
                              return ElevatedButton(
                                onPressed: () {
                                  controller.storage.value.read(
                                              controller.mockList[i].id) ==
                                          true
                                      ? CustomWidgets().signOutWidget(
                                          context,
                                          controller.mockList[i].name,
                                          controller.mockList[i].id,
                                          controller,
                                          i)
                                      : CustomWidgets().enterDataWidget(
                                          context,
                                          controller,
                                          controller.mockList[i].id,
                                          controller.mockList[i].name,
                                          i,
                                        );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          controller.isSignedIn[i] == true
                                              ? Colors.red
                                              : Colors.blue),
                                ),
                                child: Text(
                                  controller.storage.value.read(
                                              controller.mockList[i].id) ==
                                          true
                                      ? 'Sign out'
                                      : 'Sign in',
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
