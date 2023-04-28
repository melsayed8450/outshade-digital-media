import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:user_mock_app/app/presentation/routes/app_pages.dart';
import 'package:user_mock_app/app/presentation/routes/app_routes.dart';

class UserMock extends StatelessWidget {
  const UserMock({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.keepFactory,
      defaultTransition: Transition.fadeIn,
      getPages: AppRoutes.routes,
      initialRoute: AppPages.home,
    );
  }
}
