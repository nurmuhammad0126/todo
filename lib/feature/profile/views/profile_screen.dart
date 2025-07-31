import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/constants/assets.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/feature/profile/views/settings_screen.dart';
import 'package:todo/feature/profile/widgets/simple_list_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: WCustomAppBar(
        title: Text("Profile", style: AppTextStyles.s20w400),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            20.height,
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                  width: 85.w,
                  height: 85.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.height,
            Center(child: Text("Martha Hays", style: AppTextStyles.s20w400)),
            20.height,
            Row(
              children: [
                Expanded(
                  child: WScaleAnimationWidget(
                    onTap: () {},
                    child: WContainer(
                      color: AppColors.greyDark,
                      height: 60.h,
                      child: Text("10 Task left", style: AppTextStyles.s16w700),
                    ),
                  ),
                ),
                20.width,
                Expanded(
                  child: WScaleAnimationWidget(
                    onTap: () {},
                    child: WContainer(
                      color: AppColors.greyDark,
                      height: 60.h,
                      child: Text("10 Task left", style: AppTextStyles.s16w700),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 24.w),
            32.height,
            Text(
              "Settings",
              style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
            ),
            4.height,
            SimpleListItem(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ),
              iconAsset: Assets.settingIcon,
              title: 'App Settings',
            ),
            16.height,
            Text(
              "Account",
              style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
            ),
            4.height,
            SimpleListItem(
              iconAsset: Assets.profileIcon,
              title: 'Change account name',
            ),
            8.height,
            SimpleListItem(
              iconAsset: Assets.keyIcon,
              title: 'Change account password',
            ),

            8.height,
            SimpleListItem(
              iconAsset: Assets.cameraIcon,
              title: 'Change account Image',
            ),
            16.height,
            Text(
              "Uptodo",
              style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
            ),

            8.height,
            SimpleListItem(iconAsset: Assets.faqIcon, title: 'FAQ'),

            8.height,
            SimpleListItem(
              iconAsset: Assets.helpAndFeedbackIcon,
              title: 'Help & Feedback',
            ),
            SimpleListItem(
              iconAsset: Assets.supportUsIcon,
              title: 'Support US',
            ),

            8.height,
            Row(
              spacing: 16.w,
              children: [
                WScaleAnimationWidget(
                  onTap: () {},
                  child: SvgPicture.asset(Assets.logout),
                ),
                Text(
                  "Log out",
                  style: AppTextStyles.s16w700.copyWith(color: AppColors.error),
                ),
              ],
            ),
            20.height,
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
