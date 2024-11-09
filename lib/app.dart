import 'package:flutter/material.dart';
import 'package:fruitmarket/bindings/general_bindings.dart';
import 'package:fruitmarket/utils/constants/colors.dart';
import 'package:fruitmarket/utils/theme/theme.dart';
import 'package:get/get.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
          backgroundColor: TColors.primaryColor,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
      // OnboardingScreen(),
    );
  }
}
