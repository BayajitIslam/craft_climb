import 'dart:io';

import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/onboarding/presentation/pages/role_selection_page.dart';
import 'package:craft_climb/features/onboarding/presentation/widgets/onboarding_slide.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  //Just For Design Remove When Intregation
  final List<Widget> slider = [
    OnboardingSlide(
      image: AppImages.onboarding1,
      title: AppStrings.onePlatform,
      description: AppStrings.jobsSkillTraining,
    ),
    OnboardingSlide(
      image: AppImages.onboarding2,
      title: AppStrings.getNoticed,
      description: AppStrings.applyForJobs,
    ),
    OnboardingSlide(
      image: AppImages.onboarding3,
      title: AppStrings.learnSkillsThatMatter,
      description: AppStrings.enrollInExpertCourses,
    ),
    OnboardingSlide(
      image: AppImages.onboarding4,
      title: AppStrings.guidedbyAi,
      description: AppStrings.getInstantExplainations,
    ),
  ];

  //page controller for pageview
  final PageController _pageController = PageController();

  void nextPage(BuildContext context) {
    if (_pageController.page!.round() < slider.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding(context);
    }
  }

  //finished onboarding
  void finishOnboarding(BuildContext context) async {
    LocalStorage.setOnboardingCompleted(true);
    Navigator.pushReplacement(context, RoleSelectionPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: SafeArea(
          top: false,
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              //All Pages
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => slider[index],
                  itemCount: slider.length,
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  allowImplicitScrolling: true,
                  padEnds: false,
                  onPageChanged: (index) => debugPrint(index.toString()),
                ),
              ),

              //Smoth Page indicator
              SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppPallete.accent,
                  dotColor: AppPallete.accent10,
                  dotHeight: 7,
                  dotWidth: 12,
                  expansionFactor: 3,
                  spacing: 6,
                ),
              ),

              //Next Button
              SizedBox(height: context.spacing16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: PrimaryButton(
                  borderRadius: 33,
                  buttonName: AppStrings.next,
                  onPressed: () => nextPage(context),
                ),
              ),
              Platform.isAndroid
                  ? SizedBox(height: 20)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
