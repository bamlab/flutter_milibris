import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the full-screen article image viewer.
///
/// iOS only.
class ArticleImageUIConfig {
  /// Creates an article image UI config.
  const ArticleImageUIConfig({
    this.backgroundColor,
    this.buttonTint,
  });

  /// The background color. iOS only.
  ///
  /// iOS: `colors.background`
  final MilibrisColor? backgroundColor;

  /// The color applied to controls. iOS only.
  ///
  /// iOS: `colors.buttonTint`
  final MilibrisColor? buttonTint;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (backgroundColor != null)
      'backgroundColor': backgroundColor!.toMap(),
    if (buttonTint != null) 'buttonTint': buttonTint!.toMap(),
  };
}
