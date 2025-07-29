import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';

class WContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder? border;
  final Color color;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry alignment;
  final bool isLoading;
  final Clip clipBehavior;

  const WContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.margin = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.border,
    this.color = AppColors.primary,
    this.width,
    this.height,
    this.boxShadow,
    this.alignment = Alignment.center,
    this.isLoading = false,
    this.clipBehavior = Clip.antiAlias, // Yangi parametr
  });

  @override
  Widget build(BuildContext context) {
    Widget content = ClipRRect(
      borderRadius: borderRadius as BorderRadius,
      clipBehavior: clipBehavior,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: padding,
          child: Align(
            alignment: alignment,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                  )
                : child,
          ),
        ),
      ),
    );

    if (width != null || height != null) {
      content = SizedBox(width: width, height: height, child: content);
    }

    return Padding(padding: margin, child: content);
  }
}
