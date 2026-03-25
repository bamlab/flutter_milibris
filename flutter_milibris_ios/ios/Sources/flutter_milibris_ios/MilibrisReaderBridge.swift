import MiLibrisReaderSDK
import UIKit

/// Opens the MiLibris reader from a C-callable entry point.
/// Called via Dart FFI using @_cdecl to avoid any native code in the host app.
@_cdecl("milibris_open_reader")
public func milibrisOpenReader(_ releasePathPtr: UnsafePointer<CChar>) {
  milibrisOpenReaderWithConfig(releasePathPtr, nil)
}

/// Opens the MiLibris reader with an optional JSON UI config.
///
/// [configJsonPtr] is a UTF-8 JSON string produced by `MilibrisUIConfig.toMap()`
/// encoded with `jsonEncode`. Pass nil to use SDK defaults.
@_cdecl("milibris_open_reader_with_config")
public func milibrisOpenReaderWithConfig(
  _ releasePathPtr: UnsafePointer<CChar>,
  _ configJsonPtr: UnsafePointer<CChar>?
) {
  let releasePath = String(cString: releasePathPtr)
  var readerConfig = ReaderConfig()

  if let configJsonPtr,
     let data = String(cString: configJsonPtr).data(using: .utf8),
     let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
    applyUIConfig(dict, to: &readerConfig)
  }

  Task { @MainActor in
    let releaseUrl = URL(fileURLWithPath: releasePath)
    let reader = Reader(
      releasePath: releaseUrl,
      articlesLanguageCode: nil,
      config: readerConfig
    )

    guard
      let windowScene = UIApplication.shared.connectedScenes
        .compactMap({ $0 as? UIWindowScene })
        .first(where: { $0.activationState == .foregroundActive }),
      let window = windowScene.windows.first(where: { $0.isKeyWindow }),
      let rootVC = window.rootViewController
    else { return }

    var topVC = rootVC
    while let presented = topVC.presentedViewController {
      topVC = presented
    }

    reader.presentReaderViewController(from: topVC)
  }
}
