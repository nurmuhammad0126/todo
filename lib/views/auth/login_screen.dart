import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/core/widgets/w_text_field.dart';

import '../../core/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WCustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 34,
            color: AppColors.surface,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            41.height,
            Text("Login", style: AppTextStyles.s10w800.copyWith(fontSize: 32)),
            50.height,
            Text("Username", style: AppTextStyles.s16w400),
            8.height,
            WTextField(hintText: "Enter your Username"),
            25.height,
            Text("Password", style: AppTextStyles.s16w400),
            8.height,
            WTextField(hintText: "Enter your Username", obscureText: true),
            69.height,
            WScaleAnimationWidget(
              child: WContainer(
                height: 48.h,
                child: Text("Login", style: AppTextStyles.s18w400),
              ),
            ),
            31.height,
            Row(
              children: [
                Expanded(child: Divider(color: AppColors.textSecondary)),
                Text(
                  "or",
                  style: AppTextStyles.s16w400,
                ).paddingSymmetric(horizontal: 8.w),

                Expanded(child: Divider(color: AppColors.textSecondary)),
              ],
            ),
            29.height,
            WContainer(
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: AppColors.surface, size: 36),
                  Text("Login with Facebook", style: AppTextStyles.s24w400),
                ],
              ),
            ),
            20.height,
            WContainer(
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, color: AppColors.surface, size: 36),
                  Text("Login with Appe", style: AppTextStyles.s24w400),
                ],
              ),
            ),
            49.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account? ", style: AppTextStyles.s14w400),
                WScaleAnimationWidget(
                  onTap: () {},
                  child: Text("Register", style: AppTextStyles.s14w700),
                ),
              ],
            ),
            20.height,
          ],
        ).paddingAll(24),
      ),
    );
  }
}
