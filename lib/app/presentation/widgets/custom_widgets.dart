import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:user_mock_app/app/presentation/manager/home_controller.dart';
import 'package:user_mock_app/app/presentation/pages/user.dart';

class CustomWidgets {
  void enterDataWidget(BuildContext context, HomeController controller,
      String id, String name, int index) {
    controller.ageController.value.clear();
    controller.genderController.value.clear();
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: context.height * 0.7,
            child: Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.1,
                right: context.width * 0.1,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Age:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.5,
                        height: 40,
                        child: TextField(
                          controller: controller.ageController.value,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gender:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.5,
                        height: 40,
                        child: TextField(
                          controller: controller.genderController.value,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.width * 0.3,
                    height: context.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.ageController.value.text.isNotEmpty &&
                            controller.genderController.value.text.isNotEmpty) {
                          controller.storage.value.write(id, true);
                          controller.storage.value.write(
                              '${id}age', controller.ageController.value.text);
                          controller.storage.value.write('${id}gender',
                              controller.genderController.value.text);
                          controller.isSignedIn[index] = true;
                          Get.back();
                          Get.to(UserPage(name: name, id: id));
                        }
                      },
                      child: const Text(
                        'Sign in',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void signOutWidget(
      BuildContext context, String name, String id, HomeController controller, int index) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert'),
        content:
            Text('Are you sure you want to sign out from this user ($name)?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.storage.value.remove(id);
              controller.storage.value.remove('${id}age');
              controller.storage.value.remove('${id}gender');
              controller.isSignedIn[index] = false;
              Get.back();
            },
            child: const Text(
              'Yes, sign out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
