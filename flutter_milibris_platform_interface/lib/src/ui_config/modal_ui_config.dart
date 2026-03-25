import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for modal screens (e.g. search).
///
/// iOS only.
class ModalUIConfig {
  /// Creates a modal UI config.
  const ModalUIConfig({
    this.navigationBarBackgroundColor,
    this.navigationBarButtonsTint,
    this.navigationBarTitleTextColor,
    this.navigationBarTitleFont,
  });

  /// The background color of the navigation bar. iOS only.
  ///
  /// iOS: `colors.navigationBarBackground`
  final MilibrisColor? navigationBarBackgroundColor;

  /// The color applied to navigation bar buttons. iOS only.
  ///
  /// iOS: `colors.navigationBarButtonsTint`
  final MilibrisColor? navigationBarButtonsTint;

  /// The text color of the navigation bar title. iOS only.
  ///
  /// iOS: `colors.navigationBarTitleText`
  final MilibrisColor? navigationBarTitleTextColor;

  /// The font of the navigation bar title. iOS only.
  final MilibrisFont? navigationBarTitleFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (navigationBarBackgroundColor != null)
      'navigationBarBackgroundColor':
          navigationBarBackgroundColor!.toMap(),
    if (navigationBarButtonsTint != null)
      'navigationBarButtonsTint': navigationBarButtonsTint!.toMap(),
    if (navigationBarTitleTextColor != null)
      'navigationBarTitleTextColor': navigationBarTitleTextColor!.toMap(),
    if (navigationBarTitleFont != null)
      'navigationBarTitleFont': navigationBarTitleFont!.toMap(),
  };
}
