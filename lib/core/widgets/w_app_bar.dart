import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';

class WCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final double height;

  const WCustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor = AppColors.background,
    this.elevation = 0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.height = 56,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canPop = Navigator.of(context).canPop();
    
    Widget? effectiveLeading = leading;
    if (effectiveLeading == null && automaticallyImplyLeading && canPop) {
      effectiveLeading = IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.iconTheme.color,
          size: 20,
        ),
        onPressed: () => Navigator.of(context).pop(),
      );
    }

    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: padding,
          height: height,
          child: NavigationToolbar(
            leading: effectiveLeading,
            middle: title,
            trailing: actions?.isNotEmpty == true 
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  )
                : null,
            centerMiddle: centerTitle,
            middleSpacing: 16,
          ),
        ),
      ),
    );
  }
}

// Qo'shimcha utility metodlar
extension WCustomAppBarExtension on WCustomAppBar {
  // Back button bilan
  static WCustomAppBar withBackButton({
    Widget? title,
    List<Widget>? actions,
    Color? backgroundColor,
    VoidCallback? onBackPressed,
  }) {
    return WCustomAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 20),
        onPressed: onBackPressed,
      ),
      title: title,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  // Close button bilan
  static WCustomAppBar withCloseButton({
    Widget? title,
    List<Widget>? actions,
    Color? backgroundColor,
    VoidCallback? onClosePressed,
  }) {
    return WCustomAppBar(
      leading: IconButton(
        icon: const Icon(Icons.close, size: 24),
        onPressed: onClosePressed,
      ),
      title: title,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }

  // Faqat title bilan
  static WCustomAppBar titleOnly({
    required Widget title,
    Color? backgroundColor,
    bool centerTitle = true,
  }) {
    return WCustomAppBar(
      title: title,
      backgroundColor: backgroundColor ?? Colors.white,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
    );
  }
}