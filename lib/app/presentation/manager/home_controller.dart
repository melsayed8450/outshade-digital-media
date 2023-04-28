import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_mock_app/app/data/data_sources/mock_data.dart';
import 'package:user_mock_app/app/domain/entities/user_entity.dart';

class HomeController extends GetxController {
  final mockList = List<UserEntity>.from(
      MockData.data['users']!.map((x) => UserEntity.fromJson(x)));
  final storage = GetStorage().obs;
  final ageController = TextEditingController().obs;
  final genderController = TextEditingController().obs;

  final isSignedIn = List.filled(100, false).obs;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < mockList.length; i++) {
      isSignedIn[i] = storage.value.read(mockList[i].id) ?? false;
    }
  }
}
