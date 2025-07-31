import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/feature/auth/presentation/pages/login_screen.dart';
import 'package:todo/feature/auth/presentation/pages/register_screen.dart';

class ChangeAuthScreen extends StatelessWidget {
  const ChangeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WCustomAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 34,
            color: AppColors.surface,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Text(
            "Welcome to UpTodo",
            style: AppTextStyles.s26w800,
          ),
          26.height,
          Text(
            "Please login to your account or create new account to continue",
            textAlign: TextAlign.center,
            style: AppTextStyles.s20w400,
          ),
          Spacer(),
          WScaleAnimationWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: WContainer(
              child: Text(
                "Login",
                style: AppTextStyles.s24w700,
              ),
            ),
          ),
          28.height,
          WScaleAnimationWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: WContainer(
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 3),
              child: Text(
                "Create account",
                style: AppTextStyles.s24w400,
              ),
            ),
          ),
          60.height,
        ],
      ).paddingSymmetric(horizontal: 24.w),
    );
  }
}
