import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_mock_app/app/presentation/manager/home_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key, required this.name, required this.id});
  final String name;
  final String id;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 176, 176, 173),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white)),
          height: height * 0.3,
          width: width * 0.7,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Name: $name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Age: ${controller.storage.value.read('${id}age')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Gender: ${controller.storage.value.read('${id}gender')}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
