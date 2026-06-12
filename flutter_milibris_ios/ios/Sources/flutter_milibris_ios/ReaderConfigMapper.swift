import MiLibrisReaderSDK
import UIKit

// MARK: - Entry point

/// Applies a JSON-encoded config map (produced by `MilibrisUIConfig.toMap()`)
/// onto a `ReaderConfig` instance.
func applyUIConfig(_ dict: [String: Any], to config: inout ReaderConfig) {
  if let reader = dict["reader"] as? [String: Any] {
    applyReader(reader, to: &config)
  }
  if let navBar = dict["navigationBar"] as? [String: Any] {
    applyNavigationBar(navBar, to: &config.navigationBar)
  }
  if let summary = dict["summary"] as? [String: Any] {
    applySummary(summary, to: &config.summary)
  }
  if let articleReader = dict["articleReader"] as? [String: Any] {
    applyArticleReader(articleReader, to: &config.articleReader)
  }
  if let readerTutorial = dict["readerTutorial"] as? [String: Any] {
    applyReaderTutorial(readerTutorial, to: &config.readerTutorial)
  }
  if let slideshowBox = dict["slideshowBox"] as? [String: Any] {
    applySlideshowBox(slideshowBox, to: &config.slideshowBox)
  }
  if let alert = dict["alert"] as? [String: Any] {
    applyAlert(alert, to: &config.alert)
  }
  if let htmlBox = dict["htmlBox"] as? [String: Any] {
    applyHtmlBox(htmlBox, to: &config.htmlBox)
  }
  if let modal = dict["modal"] as? [String: Any] {
    applyModal(modal, to: &config.modal)
  }
  // articleSettings is nested inside articleReader on iOS;
  // top-level articleSettings is also applied here for convenience.
  if let articleSettings = dict["articleSettings"] as? [String: Any] {
    applyArticleSettings(articleSettings, to: &config.articleReader.articleSettings)
  }
}

// MARK: - ReaderConfig (top level)

private func applyReader(_ d: [String: Any], to config: inout ReaderConfig) {
  // Feature flags
  if let v = d["isSummaryEnabled"] as? Bool { config.features.isSummaryEnabled = v }
  if let v = d["isPrintEnabled"] as? Bool { config.features.printPageEnabled = v }
  if let v = d["isDoublePagesEnabled"] as? Bool { config.features.isDoublePagesEnabled = v }
  if let v = d["longPressArticlesEnabled"] as? Bool { config.features.longPressArticlesEnabled = v }
  if let v = d["debugBoxes"] as? Bool { config.features.debugBoxes = v }
  if let v = d["onDeviceSmartCropEnabled"] as? Bool { config.features.onDeviceSmartCropEnabled = v }
  if let v = d["debugImageCrop"] as? Bool { config.features.debugImageCrop = v }
  // Colors
  if let c = color(d["backgroundColor"]) { config.colors.background = c }
  if let c = color(d["boxHighlightColor"]) { config.colors.boxHighlight = c }
  if let c = color(d["pagePlaceholderColor"]) { config.colors.pagePlaceholder = c }
  if let c = color(d["articleCapsuleHiddenBackgroundColor"]) {
    config.colors.articleCapsuleHiddenBackground = c
  }
  if let c = color(d["articleCapsuleHiddenTextColor"]) {
    config.colors.articleCapsuleHiddenText = c
  }
  if let c = color(d["articleCapsuleBottomBackgroundColor"]) {
    config.colors.articleCapsuleBottomBackground = c
  }
  if let c = color(d["articleCapsuleBottomTextColor"]) {
    config.colors.articleCapsuleBottomText = c
  }
  if let c = color(d["actionButtonBackgroundColor"]) {
    config.colors.actionButtonBackgroundColor = c
  }
  if let c = color(d["actionButtonTintColor"]) {
    config.colors.actionButtonTintColor = c
  }
  if let c = color(d["flatplanImagePlaceholderColor"]) {
    config.colors.flatplanImagePlaceholder = c
  }
  if let c = color(d["flatplanSelectedBorderColor"]) {
    config.colors.flatplanSelectedBorder = c
  }
  if let c = color(d["flatplanSelectedTitleTextColor"]) {
    config.colors.flatplanSelectedTitleText = c
  }
  if let c = color(d["flatplanTitleTextColor"]) { config.colors.flatplanTitleText = c }
  if let c = color(d["bottomSheetDragIndicatorColor"]) {
    config.colors.bottomSheetDragIndicator = c
  }
  if let c = color(d["bottomSheetBackgroundColor"]) {
    config.colors.bottomSheetBackground = c
  }
  if let c = color(d["miniSummaryCellTitleTextColor"]) {
    config.colors.miniSummaryCellTitleText = c
  }
  if let c = color(d["miniSummaryCellPlaceholderColor"]) {
    config.colors.miniSummaryCellPlaceholder = c
  }
  if let c = color(d["miniSummaryImagePlaceholderColor"]) {
    config.colors.miniSummaryImagePlaceholder = c
  }
  if let c = color(d["miniSummarySeparatorColor"]) {
    config.colors.miniSummarySeparator = c
  }
  // Fonts
  if let f = fontInfo(d["flatplanTitleFont"]) { config.fonts.flatplanTitle = f }
  if let f = fontInfo(d["miniSummaryCellTitleFont"]) {
    config.fonts.miniSummaryCellTitle = f
  }
}

// MARK: - NavigationBarConfig

private func applyNavigationBar(
  _ d: [String: Any],
  to navBar: inout NavigationBarConfig
) {
  if let c = color(d["backgroundColor"]) { navBar.colors.background = c }
  if let c = color(d["buttonTint"]) { navBar.colors.buttonsTint = c }
  if let c = color(d["titleColor"]) { navBar.colors.titleText = c }
  if let c = color(d["subtitleColor"]) { navBar.colors.subtitleText = c }
  if let c = color(d["progressBarBackgroundColor"]) {
    navBar.colors.progressbarBackground = c
  }
  if let c = color(d["progressBarFillColor"]) { navBar.colors.progressbarFill = c }
  if let c = color(d["logoBackgroundColor"]) { navBar.colors.logoBackground = c }
  if let c = color(d["logoBorderColor"]) { navBar.colors.logoBorder = c }
  if let c = color(d["searchBarTint"]) { navBar.colors.searchBarTint = c }
  if let name = d["logoImageName"] as? String {
    navBar.images.logo = UIImage(named: name)
  }
  if let f = fontInfo(d["titleFont"]) { navBar.fonts.title = f }
  if let f = fontInfo(d["subtitleFont"]) { navBar.fonts.subtitle = f }
  if let f = fontInfo(d["searchBarTextFont"]) { navBar.fonts.searchBarText = f }
}

// MARK: - SummaryConfig

private func applySummary(_ d: [String: Any], to summary: inout SummaryConfig) {
  if let navBar = d["navigationBar"] as? [String: Any] {
    applyNavigationBar(navBar, to: &summary.navigationBar)
  }
  if let c = color(d["backgroundColor"]) { summary.colors.background = c }
  if let c = color(d["rubricBackgroundColor"]) { summary.colors.rubricBackground = c }
  if let c = color(d["rubricTextColor"]) { summary.colors.rubricText = c }
  if let c = color(d["cellTitleColor"]) { summary.colors.cellTitleText = c }
  if let c = color(d["cellSubtitleColor"]) { summary.colors.cellSubtitleText = c }
  if let c = color(d["cellFooterColor"]) { summary.colors.cellFooterText = c }
  if let c = color(d["imagePlaceholderColor"]) { summary.colors.imagePlaceholder = c }
  if let c = color(d["separatorColor"]) { summary.colors.separator = c }
  if let c = color(d["selectedBackgroundColor"]) {
    summary.colors.selectedBackground = c
  }
  if let c = color(d["overlayBackgroundColor"]) {
    summary.colors.overlayBackground = c
  }
  if let c = color(d["rubricPlaceholderColor"]) {
    summary.colors.rubricPlaceholder = c
  }
  if let c = color(d["cellPlaceholderColor"]) { summary.colors.cellPlaceholder = c }
  if let f = fontInfo(d["rubricFont"]) { summary.fonts.rubric = f }
  if let f = fontInfo(d["cellTitleFont"]) { summary.fonts.cellTitle = f }
  if let f = fontInfo(d["cellSubtitleFont"]) { summary.fonts.cellSubtitle = f }
  if let f = fontInfo(d["cellFooterFont"]) { summary.fonts.cellFooter = f }
}

// MARK: - ArticleReaderConfig

private func applyArticleReader(
  _ d: [String: Any],
  to articleReader: inout ArticleReaderConfig
) {
  if let navBar = d["navigationBar"] as? [String: Any] {
    applyNavigationBar(navBar, to: &articleReader.navigationBar)
  }
  if let alert = d["alert"] as? [String: Any] {
    applyAlert(alert, to: &articleReader.alert)
  }
  if let settings = d["articleSettings"] as? [String: Any] {
    applyArticleSettings(settings, to: &articleReader.articleSettings)
  }
  if let image = d["articleImage"] as? [String: Any] {
    applyArticleImage(image, to: &articleReader.articleImage)
  }
  // Feature flags
  if let v = d["isSummaryEnabled"] as? Bool { articleReader.features.isSummaryEnabled = v }
  if let v = d["isTextToSpeechEnabled"] as? Bool {
    articleReader.features.isTextToSpeechEnabled = v
  }
  if let v = d["isAudioEnabled"] as? Bool { articleReader.features.isAudioEnabled = v }
  if let v = d["isImageCropEnabled"] as? Bool {
    articleReader.features.isImageCropEnabled = v
  }
  if let v = d["onDeviceSmartCropEnabled"] as? Bool {
    articleReader.features.onDeviceSmartCropEnabled = v
  }
  // Colors
  if let c = color(d["backgroundColor"]) { articleReader.colors.background = c }
  if let c = color(d["bottomBarBackgroundColor"]) {
    articleReader.colors.bottomBarBackground = c
  }
  if let c = color(d["bottomBarTint"]) { articleReader.colors.bottomBarTint = c }
  if let c = color(d["fisheyeLabelBackgroundColor"]) {
    articleReader.colors.fisheyeLabelBackground = c
  }
  if let c = color(d["fisheyeLabelTextColor"]) {
    articleReader.colors.fisheyeLabelText = c
  }
  if let c = color(d["rubricBackgroundColor"]) {
    articleReader.colors.rubricBackground = c
  }
  if let c = color(d["rubricTextColor"]) { articleReader.colors.rubricText = c }
  if let c = color(d["rubricBackgroundOverPrimeImageColor"]) {
    articleReader.colors.rubricBackgroundOverPrimeImage = c
  }
  if let c = color(d["rubricTextOverPrimeImageColor"]) {
    articleReader.colors.rubricTextOverPrimeImage = c
  }
  if let c = color(d["primeImageGradientColor"]) {
    articleReader.colors.primeImageGradient = c
  }
  if let c = color(d["primeImageContentColor"]) {
    articleReader.colors.primeImageContent = c
  }
  if let c = color(d["sectionBackgroundColor"]) {
    articleReader.colors.sectionBackground = c
  }
  if let c = color(d["linkColor"]) { articleReader.colors.link = c }
  if let c = color(d["imagePlaceholderColor"]) {
    articleReader.colors.imagePlaceholder = c
  }
  if let c = color(d["separatorColor"]) { articleReader.colors.separator = c }
  if let c = color(d["nextArticleArrowColor"]) {
    articleReader.colors.nextArticleArrow = c
  }
  // Brand font families. Applied FIRST because applyXFont bulk-overwrites many
  // font/text fields; the granular overrides below must win over them.
  applyFontFamilies(d, to: &articleReader)
  // Fonts
  if let f = fontInfo(d["fisheyeLabelFont"]) { articleReader.fonts.fisheyeLabel = f }
  if let f = fontInfo(d["bottomBarFont"]) { articleReader.fonts.bottomBar = f }
  if let f = fontInfo(d["rubricFont"]) { articleReader.fonts.rubric = f }
  if let f = fontInfo(d["paragraphBoldFont"]) { articleReader.fonts.paragraphB = f }
  if let f = fontInfo(d["paragraphStrongFont"]) {
    articleReader.fonts.paragraphStrong = f
  }
  if let f = fontInfo(d["paragraphItalicFont"]) { articleReader.fonts.paragraphI = f }
  if let f = fontInfo(d["paragraphEmphasisFont"]) {
    articleReader.fonts.paragraphEm = f
  }
  // Text configs
  if let t = textConfig(d["paragraph"]) { articleReader.text.paragraph = t }
  if let t = textConfig(d["interTitle"]) { articleReader.text.intertitlePhone = t }
  if let t = textConfig(d["titleTablet"]) { articleReader.text.intertitleTablet = t }
  if let t = textConfig(d["subtitle"]) { articleReader.text.subtitle = t }
  if let t = textConfig(d["surtitle"]) { articleReader.text.surtitle = t }
  if let t = textConfig(d["author"]) { articleReader.text.author = t }
  if let t = textConfig(d["caption"]) { articleReader.text.caption = t }
  if let t = textConfig(d["captionOverImage"]) { articleReader.text.captionOverImage = t }
  if let t = textConfig(d["credit"]) { articleReader.text.credit = t }
  if let t = textConfig(d["creditOverImage"]) { articleReader.text.creditOverImage = t }
  if let t = textConfig(d["note"]) { articleReader.text.note = t }
  if let t = textConfig(d["heading"]) { articleReader.text.heading = t }
  if let t = textConfig(d["quote"]) { articleReader.text.quote = t }
  if let t = textConfig(d["quoteAuthor"]) { articleReader.text.quoteAuthor = t }
  if let t = textConfig(d["nextArticleTitle"]) {
    articleReader.text.nextArticleTitle = t
  }
  if let t = textConfig(d["nextArticleInfos"]) {
    articleReader.text.nextArticleInfos = t
  }
  if let t = textConfig(d["interviewQuestion"]) {
    articleReader.text.interviewQuestion = t
  }
  if let t = textConfig(d["interviewAnswer"]) {
    articleReader.text.interviewAnswer = t
  }
}

/// Applies the primary/secondary/tertiary brand font families via the SDK's
/// `applyXFont` convenience methods.
///
/// Each method throws if a font name does not resolve to a registered family;
/// we log and skip that family rather than aborting the whole config.
private func applyFontFamilies(
  _ d: [String: Any],
  to articleReader: inout ArticleReaderConfig
) {
  if let f = d["primaryFont"] as? [String: Any],
     let regular = f["regular"] as? String {
    do {
      try articleReader.applyPrimaryFont(
        regularFontName: regular,
        blackFontName: f["black"] as? String,
        boldFontName: f["bold"] as? String
      )
    } catch {
      NSLog("flutter_milibris: applyPrimaryFont failed: \(error)")
    }
  }
  if let f = d["secondaryFont"] as? [String: Any],
     let regular = f["regular"] as? String {
    do {
      try articleReader.applySecondaryFont(
        regularFontName: regular,
        mediumFontName: f["medium"] as? String,
        semiBoldFontName: f["semiBold"] as? String
      )
    } catch {
      NSLog("flutter_milibris: applySecondaryFont failed: \(error)")
    }
  }
  if let f = d["tertiaryFont"] as? [String: Any],
     let regular = f["regular"] as? String {
    do {
      try articleReader.applyTertiaryFont(
        regularFontName: regular,
        blackFontName: f["black"] as? String,
        boldFontName: f["bold"] as? String,
        italicFontName: f["italic"] as? String
      )
    } catch {
      NSLog("flutter_milibris: applyTertiaryFont failed: \(error)")
    }
  }
}

// MARK: - ArticleSettingsConfig

private func applyArticleSettings(
  _ d: [String: Any],
  to settings: inout ArticleSettingsConfig
) {
  if let c = color(d["backgroundColor"]) { settings.colors.background = c }
  if let c = color(d["overlayBackgroundColor"]) {
    settings.colors.overlayBackground = c
  }
  if let c = color(d["fontSizeEnabledColor"]) { settings.colors.fontSizeEnabled = c }
  if let c = color(d["fontSizeDisabledColor"]) { settings.colors.fontSizeDisabled = c }
  if let c = color(d["lineSpacingEnabledColor"]) {
    settings.colors.lineSpacingEnabled = c
  }
  if let c = color(d["lineSpacingDisabledColor"]) {
    settings.colors.lineSpacingDisabled = c
  }
  if let c = color(d["userInterfaceStyleBorderColor"]) {
    settings.colors.userInterfaceStyleBorder = c
  }
  if let c = color(d["userInterfaceStyleBorderSelectedColor"]) {
    settings.colors.userInterfaceStyleBorderSelected = c
  }
  if let c = color(d["brightnessImagesColor"]) { settings.colors.brightnessImages = c }
  if let c = color(d["brightnessMinColor"]) { settings.colors.brightnessMin = c }
  if let c = color(d["brightnessMaxColor"]) { settings.colors.brightnessMax = c }
  if let c = color(d["separatorColor"]) { settings.colors.separator = c }
}

// MARK: - AlertConfig

private func applyAlert(_ d: [String: Any], to alert: inout AlertConfig) {
  if let c = color(d["overlayBackgroundColor"]) { alert.colors.overlayBackground = c }
  if let c = color(d["contentBackgroundColor"]) { alert.colors.contentBackground = c }
  if let c = color(d["titleTextColor"]) { alert.colors.titleLabelText = c }
  if let c = color(d["messageTextColor"]) { alert.colors.messageLabelText = c }
  if let c = color(d["primaryButtonBackgroundColor"]) {
    alert.colors.primaryActionButtonBackground = c
  }
  if let c = color(d["primaryButtonTextColor"]) {
    alert.colors.primaryActionButtonText = c
  }
  if let c = color(d["secondaryButtonBorderColor"]) {
    alert.colors.secondaryActionButtonBorder = c
  }
  if let c = color(d["secondaryButtonTextColor"]) {
    alert.colors.secondaryActionButtonText = c
  }
  if let f = fontInfo(d["titleFont"]) { alert.fonts.titleLabel = f }
  if let f = fontInfo(d["messageFont"]) { alert.fonts.messageLabel = f }
  if let f = fontInfo(d["primaryButtonFont"]) {
    alert.fonts.primaryActionButton = f
  }
  if let f = fontInfo(d["secondaryButtonFont"]) {
    alert.fonts.secondaryActionButton = f
  }
}

// MARK: - ArticleImageConfig

private func applyArticleImage(
  _ d: [String: Any],
  to image: inout ArticleImageConfig
) {
  if let c = color(d["backgroundColor"]) { image.colors.background = c }
  if let c = color(d["buttonTint"]) { image.colors.buttonTint = c }
}

// MARK: - ReaderTutorialConfig

private func applyReaderTutorial(
  _ d: [String: Any],
  to tutorial: inout ReaderTutorialConfig
) {
  if let c = color(d["overlayBackgroundColor"]) {
    tutorial.colors.overlayBackground = c
  }
  if let c = color(d["imageBackgroundColor"]) { tutorial.colors.imageBackground = c }
  if let c = color(d["contentBackgroundColor"]) {
    tutorial.colors.contentBackground = c
  }
  if let c = color(d["titleTextColor"]) { tutorial.colors.itemTitleText = c }
  if let c = color(d["descriptionTextColor"]) {
    tutorial.colors.itemDescriptionText = c
  }
  if let c = color(d["skipButtonTextColor"]) { tutorial.colors.skipButtonText = c }
  if let c = color(d["currentPageIndicatorColor"]) {
    tutorial.colors.currentPageIndicatorTint = c
  }
  if let c = color(d["pageIndicatorColor"]) { tutorial.colors.pageIndicatorTint = c }
  if let c = color(d["articleCapsuleBackgroundColor"]) {
    tutorial.colors.articleCapsuleBackground = c
  }
  if let c = color(d["articleCapsuleTextColor"]) {
    tutorial.colors.articleCapsuleText = c
  }
  if let f = fontInfo(d["titleFontBigPhone"]) { tutorial.fonts.itemTitleBigPhone = f }
  if let f = fontInfo(d["titleFontBigTablet"]) {
    tutorial.fonts.itemTitleBigTablet = f
  }
  if let f = fontInfo(d["titleFontRegular"]) { tutorial.fonts.itemTitleRegular = f }
  if let f = fontInfo(d["descriptionFont"]) { tutorial.fonts.itemDescription = f }
  if let f = fontInfo(d["skipButtonFont"]) { tutorial.fonts.skipButton = f }
  if let f = fontInfo(d["articleCapsuleFont"]) { tutorial.fonts.articleCapsule = f }
}

// MARK: - SlideshowBoxConfig

private func applySlideshowBox(
  _ d: [String: Any],
  to slideshow: inout SlideshowBoxConfig
) {
  if let c = color(d["backgroundColor"]) { slideshow.colors.background = c }
  if let c = color(d["captionBackgroundColor"]) {
    slideshow.colors.captionBackground = c
  }
  if let c = color(d["captionTextColor"]) { slideshow.colors.captionText = c }
  if let c = color(d["currentPageIndicatorColor"]) {
    slideshow.colors.currentPageIndicatorTint = c
  }
  if let c = color(d["pageIndicatorColor"]) { slideshow.colors.pageIndicatorTint = c }
  if let f = fontInfo(d["captionFont"]) { slideshow.fonts.caption = f }
}

// MARK: - HtmlBoxConfig

private func applyHtmlBox(_ d: [String: Any], to htmlBox: inout HtmlBoxConfig) {
  if let c = color(d["backgroundColor"]) { htmlBox.colors.background = c }
}

// MARK: - ModalConfig

private func applyModal(_ d: [String: Any], to modal: inout ModalConfig) {
  if let c = color(d["navigationBarBackgroundColor"]) {
    modal.colors.navigationBarBackground = c
  }
  if let c = color(d["navigationBarButtonsTint"]) {
    modal.colors.navigationBarButtonsTint = c
  }
  if let c = color(d["navigationBarTitleTextColor"]) {
    modal.colors.navigationBarTitleText = c
  }
  if let f = fontInfo(d["navigationBarTitleFont"]) {
    modal.fonts.navigationBarTitle = f
  }
}

// MARK: - Value helpers

/// Parses a `MilibrisColor.toMap()` dict into a dynamic `UIColor`.
///
/// The dict has the shape `{ "light": 0xAARRGGBB, "dark": 0xAARRGGBB? }`.
/// Returns nil if the input is not a valid color dict.
private func color(_ value: Any?) -> UIColor? {
  guard let d = value as? [String: Any],
        let lightArgb = d["light"] as? Int else { return nil }
  let lightColor = uiColor(argb: lightArgb)
  guard let darkArgb = d["dark"] as? Int else { return lightColor }
  let darkColor = uiColor(argb: darkArgb)
  return UIColor { traits in
    traits.userInterfaceStyle == .dark ? darkColor : lightColor
  }
}

private func uiColor(argb: Int) -> UIColor {
  let a = CGFloat((argb >> 24) & 0xFF) / 255
  let r = CGFloat((argb >> 16) & 0xFF) / 255
  let g = CGFloat((argb >> 8) & 0xFF) / 255
  let b = CGFloat(argb & 0xFF) / 255
  return UIColor(red: r, green: g, blue: b, alpha: a)
}

/// Parses a `MilibrisFont.toMap()` dict into a `FontInfo`.
///
/// Returns nil if the input is not a valid font dict.
private func fontInfo(_ value: Any?) -> FontInfo? {
  guard let d = value as? [String: Any] else { return nil }
  let size = (d["size"] as? Double).map { CGFloat($0) } ?? 14
  let bold = d["bold"] as? Bool ?? false
  let italic = d["italic"] as? Bool ?? false
  if let name = d["name"] as? String {
    return .custom(UIFont(name: name, size: size))
  } else if bold && italic {
    return .systemItalicBold(size: size)
  } else if bold {
    return .systemBold(size: size)
  } else if italic {
    return .systemItalic(size: size)
  } else {
    return .system(size: size)
  }
}

/// Parses a `MilibrisTextConfig.toMap()` dict into a `TextConfig`.
///
/// Returns nil if the input is not a valid text config dict.
private func textConfig(_ value: Any?) -> TextConfig? {
  guard let d = value as? [String: Any] else { return nil }
  let resolvedColor = color(d["color"]) ?? .black
  let resolvedFont = fontInfo(d["font"]) ?? .system(size: 14)
  let lineSpacing = (d["lineSpacing"] as? Double).map { CGFloat($0) } ?? 0
  return TextConfig(
    color: resolvedColor,
    fontInfo: resolvedFont,
    lineSpacing: lineSpacing
  )
}
