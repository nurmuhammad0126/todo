import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/constants/assets.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/feature/onboarding/change_auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    Assets.onboarding1,
    Assets.onboarding2,
    Assets.onboarding3,
  ];
  final List<String> text1 = [
    "Manage your tasks",
    "Create daily routine",
    "Organize your tasks",
  ];
  final List<String> text2 = [
    "You can easily manage all of your daily tasks in DoMe for free",
    "In Uptodo you can create your personalized routine to stay productive",
    "You can organize your daily tasks by adding your tasks into separate categories",
  ];

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChangeAuthScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;

    return Scaffold(
      appBar: WCustomAppBar(
        leading: WScaleAnimationWidget(
          onTap: () {
            _pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
            );
          },
          child: Text("SKIP", style: AppTextStyles.s22w400).paddingOnly(left: 20),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          (screenHeight * 0.05).height,
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemCount: images.length,
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      images[index],
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.3,
                      fit: BoxFit.contain,
                    ),
                    (screenHeight * 0.06).height,
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        text1[index],
                        key: ValueKey(text1[index]),
                        style: AppTextStyles.s26w700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    (screenHeight * 0.04).height,
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                        child: Text(
                          text2[index],
                          key: ValueKey(text2[index]),
                          style: AppTextStyles.s20w700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotWidth: 24.toW(context),
              dotHeight: 5.toH(context),
              activeDotColor: AppColors.border,
              dotColor: AppColors.icon,
            ),
          ),
          (screenHeight * 0.05).height,
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WScaleAnimationWidget(
                  onTap: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text("BACK", style: AppTextStyles.s22w400),
                ),
                WScaleAnimationWidget(
                  onTap: _nextPage,
                  child: WContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.015,
                    ),
                    child: Text(
                      _currentPage >= 2 ? "GET STARTED" : "NEXT",
                      style: AppTextStyles.s22w400,
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
