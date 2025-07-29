import 'package:flutter/material.dart';

class WScaleAnimationWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;
  final double scale;
  final bool enabled;

  const WScaleAnimationWidget({
    super.key,
    required this.child,
    this.onTap,
    this.duration = const Duration(milliseconds: 100),
    this.scale = 0.95,
    this.enabled = true,
  });

  @override
  State<WScaleAnimationWidget> createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<WScaleAnimationWidget> {
  double _scaleFactor = 1.0;

  bool get _isEnabled => widget.onTap != null && widget.enabled;

  void _onTapDown(TapDownDetails details) {
    if (!_isEnabled) return;
    setState(() => _scaleFactor = widget.scale);
  }

  void _onTapUp(TapUpDetails details) {
    if (!_isEnabled) return;
    _animateBack();
  }

  void _onTapCancel() {
    if (!_isEnabled) return;
    _animateBack();
  }

  void _animateBack() {
    setState(() => _scaleFactor = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final Widget scaledChild = AnimatedScale(
      scale: _scaleFactor,
      duration: widget.duration,
      curve: Curves.easeInOut,
      child: Opacity(
        opacity: _isEnabled ? 1.0 : 0.5,
        child: widget.child,
      ),
    );

    if (_isEnabled) {
      return GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        behavior: HitTestBehavior.translucent,
        child: scaledChild,
      );
    }

    return scaledChild;
  }
}