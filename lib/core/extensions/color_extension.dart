import 'dart:ui';

extension ColorAlphaExtension on Color {
  Color withOpacityNew(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0.0 and 1.0',
    );
    final alpha = (opacity * 255).round().clamp(0, 255);
    return withAlpha(alpha);
  }
}
