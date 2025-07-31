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
import 'package:todo/feature/auth/presentation/pages/login_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _onRegister() {
    final email = _loginController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _passwordConfirmController.text.trim();

    if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showError("Iltimos, barcha maydonlarni to‘ldiring!");
      return;
    }

    if (password != confirm) {
      _showError("Parollar mos emas!");
      return;
    }

    ref
        .read(authProvider.notifier)
        .register(
          email: email,
          password: password,
          onSucces: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          onFailure: () {
            _showError("Foydalanuvchi topilmadi yoki nimadut xato !");
          },
        );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            msg.toString(),
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
            Text(
              "Register",
              style: AppTextStyles.s10w800.copyWith(fontSize: 32),
            ),
            23.height,
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
              hintText: "Password",
              obscureText: true,
            ),
            25.height,
            Text("Confirm Password", style: AppTextStyles.s16w400),
            8.height,
            WTextField(
              controller: _passwordConfirmController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            40.height,

            // REGISTER BUTTON
            WScaleAnimationWidget(
              onTap: _onRegister,
              child: WContainer(
                isLoading: authState.isLoading,
                height: 48.h,
                child: Text("Register", style: AppTextStyles.s18w400),
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
                Text("Already have an account? ", style: AppTextStyles.s14w400),
                WScaleAnimationWidget(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
                  child: Text("Login", style: AppTextStyles.s14w700),
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
