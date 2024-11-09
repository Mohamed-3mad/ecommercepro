import 'package:flutter/material.dart';
import 'package:fruitmarket/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:fruitmarket/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:fruitmarket/features/authentication/screens/onboarding/widgets/onboarding_next_screen_button.dart';
import 'package:fruitmarket/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:fruitmarket/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:fruitmarket/utils/constants/image_strings.dart';
import 'package:fruitmarket/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                imageTitle: TImages.onboarding1,
                textSubtitle: TTexts.onBoardingSubTitle1,
                textTitle: TTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                imageTitle: TImages.onboarding2,
                textSubtitle: TTexts.onBoardingSubTitle2,
                textTitle: TTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                imageTitle: TImages.onboarding3,
                textSubtitle: TTexts.onBoardingSubTitle3,
                textTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          //Skip Button
          const OnBoardingSkipButton(),
          //Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          //Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
