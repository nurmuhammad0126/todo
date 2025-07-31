import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/constants/assets.dart';
import 'package:todo/core/extensions/context_extension.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/feature/onboarding/onboarding_screen.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final token = await user.getIdToken();
        if (mounted) {
          await context.localStore.saveToken(token ?? '');
        }
      }

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.logo,
              width: 140.toW(context),
              height: 113.toH(context),
            ),
            20.height,
            Text("UpTodo", style: AppTextStyles.s26w800),
          ],
        ),
      ),
    );
  }
}
