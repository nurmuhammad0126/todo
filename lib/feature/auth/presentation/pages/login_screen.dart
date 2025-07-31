import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/core/widgets/w_text_field.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/feature/auth/presentation/auth_riverpod/auth_riverpod.dart';
import 'package:todo/feature/auth/presentation/pages/register_screen.dart';
import 'package:todo/feature/main/main_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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

  void _onLogin() {
    final email = _loginController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      ref
          .read(authProvider.notifier)
          .login(
            email: email,
            password: password,
            onFailure: () {
              _showErrorSnackbar("Bu foydalanuvchi oldin ro'yhatdan o'tgan !");
            },
            onSucces: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false,
              );
            },
          );
    } else {
      _showErrorSnackbar("Email yoki parol bo'sh bo'lmasligi kerak!");
    }
  }

  void _showErrorSnackbar(String msg) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            msg,
            style: AppTextStyles.s16w400.copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            41.height,
            Text("Login", style: AppTextStyles.s10w800.copyWith(fontSize: 32)),
            50.height,
            Text("Username", style: AppTextStyles.s16w400),
            8.height,
            WTextField(
              controller: _loginController,
              hintText: "Enter your Username",
            ),
            25.height,
            Text("Password", style: AppTextStyles.s16w400),
            8.height,
            WTextField(
              controller: _passwordController,
              hintText: "Enter your Password",
              obscureText: true,
            ),
            69.height,

            WScaleAnimationWidget(
              onTap: _onLogin,
              child: WContainer(
                isLoading: authState.isLoading,
                height: 48.h,
                child: Text("Login", style: AppTextStyles.s18w400),
              ),
            ),
            31.height,
            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.textSecondary)),
                Text(
                  "or",
                  style: AppTextStyles.s16w400,
                ).paddingSymmetric(horizontal: 8.w),
                const Expanded(child: Divider(color: AppColors.textSecondary)),
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
                  8.width,
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
                  8.width,
                  Text("Login with Apple", style: AppTextStyles.s24w400),
                ],
              ),
            ),
            49.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account? ", style: AppTextStyles.s14w400),
                WScaleAnimationWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
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
