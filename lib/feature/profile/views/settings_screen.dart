import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/assets.dart';
import '../widgets/simple_list_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WCustomAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.surface),
        ),
        title: Text("Settings", style: AppTextStyles.s20w400),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            Text(
              "Settings",
              style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
            ),
            4.height,
            SimpleListItem(
              iconAsset: Assets.changeAppColorIcon,
              title: 'Change app color',
            ),
            4.height,

            SimpleListItem(
              iconAsset: Assets.tIcon,
              title: 'Change app typography',
            ),
            4.height,

            SimpleListItem(
              iconAsset: Assets.changeAppLanguageIcon,
              title: 'Change app language',
            ),
            16.height,
            Text(
              "Import",
              style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
            ),
            4.height,
            SimpleListItem(
              iconAsset: Assets.saveIcon,
              title: 'Import from Google calendar',
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 26.w),
    );
  }
}
