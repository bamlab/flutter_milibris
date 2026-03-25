// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for HTML media boxes.
///
/// iOS only.
class HtmlBoxUIConfig {
  /// Creates an HTML box UI config.
  const HtmlBoxUIConfig({this.backgroundColor});

  /// The background color. iOS only.
  ///
  /// iOS: `colors.background`
  final MilibrisColor? backgroundColor;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (backgroundColor != null) 'backgroundColor': backgroundColor!.toMap(),
  };
}
