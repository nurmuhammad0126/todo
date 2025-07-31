import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';

class SimpleListItem extends StatelessWidget {
  final String? iconAsset;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SimpleListItem({
    super.key,
    required this.iconAsset,
    required this.title,
    this.onTap,
    this.subTitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: iconAsset != null ? SvgPicture.asset(iconAsset!) : null,
      subtitle:
          subTitle != null
              ? Text(
                subTitle!,
                style: AppTextStyles.s14w400.copyWith(color: AppColors.border),
                )
              : null,
      title: Text(title, style: AppTextStyles.s16w700,),
      trailing:
          trailing ??
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.surface),
      onTap: onTap,
    );
  }
}