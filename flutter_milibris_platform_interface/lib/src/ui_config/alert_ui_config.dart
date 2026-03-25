// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for alert popins.
///
/// Supported on both iOS and Android (Android via XML resource overrides).
class AlertUIConfig {
  /// Creates an alert UI config.
  const AlertUIConfig({
    this.overlayBackgroundColor,
    this.contentBackgroundColor,
    this.titleTextColor,
    this.messageTextColor,
    this.primaryButtonBackgroundColor,
    this.primaryButtonTextColor,
    this.secondaryButtonBorderColor,
    this.secondaryButtonTextColor,
    this.titleFont,
    this.messageFont,
    this.primaryButtonFont,
    this.secondaryButtonFont,
  });

  /// The color of the overlay background.
  ///
  /// iOS: `colors.overlayBackground` — Android: `or_popin_external_background`
  final MilibrisColor? overlayBackgroundColor;

  /// The background color of the alert content area.
  ///
  /// iOS: `colors.contentBackground` — Android: `or_popin_background`
  final MilibrisColor? contentBackgroundColor;

  /// The text color of the title label.
  ///
  /// iOS: `colors.titleLabelText` — Android: `or_popin_title`
  final MilibrisColor? titleTextColor;

  /// The text color of the message label.
  ///
  /// iOS: `colors.messageLabelText` — Android: `or_popin_message`
  final MilibrisColor? messageTextColor;

  /// The background color of the primary action button.
  ///
  /// iOS only.
  final MilibrisColor? primaryButtonBackgroundColor;

  /// The text color of the primary action button.
  ///
  /// iOS only.
  final MilibrisColor? primaryButtonTextColor;

  /// The border color of the secondary action button.
  ///
  /// iOS only.
  final MilibrisColor? secondaryButtonBorderColor;

  /// The text color of the secondary action button.
  ///
  /// iOS only.
  final MilibrisColor? secondaryButtonTextColor;

  /// The font of the title label. iOS only.
  final MilibrisFont? titleFont;

  /// The font of the message label. iOS only.
  final MilibrisFont? messageFont;

  /// The font of the primary action button. iOS only.
  final MilibrisFont? primaryButtonFont;

  /// The font of the secondary action button. iOS only.
  final MilibrisFont? secondaryButtonFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (overlayBackgroundColor != null)
      'overlayBackgroundColor': overlayBackgroundColor!.toMap(),
    if (contentBackgroundColor != null)
      'contentBackgroundColor': contentBackgroundColor!.toMap(),
    if (titleTextColor != null) 'titleTextColor': titleTextColor!.toMap(),
    if (messageTextColor != null) 'messageTextColor': messageTextColor!.toMap(),
    if (primaryButtonBackgroundColor != null)
      'primaryButtonBackgroundColor': primaryButtonBackgroundColor!.toMap(),
    if (primaryButtonTextColor != null)
      'primaryButtonTextColor': primaryButtonTextColor!.toMap(),
    if (secondaryButtonBorderColor != null)
      'secondaryButtonBorderColor': secondaryButtonBorderColor!.toMap(),
    if (secondaryButtonTextColor != null)
      'secondaryButtonTextColor': secondaryButtonTextColor!.toMap(),
    if (titleFont != null) 'titleFont': titleFont!.toMap(),
    if (messageFont != null) 'messageFont': messageFont!.toMap(),
    if (primaryButtonFont != null)
      'primaryButtonFont': primaryButtonFont!.toMap(),
    if (secondaryButtonFont != null)
      'secondaryButtonFont': secondaryButtonFont!.toMap(),
  };
}
