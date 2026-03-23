import MiLibrisReaderSDK
import UIKit

/// Opens the MiLibris reader from a C-callable entry point.
/// Called via Dart FFI using @_cdecl to avoid any native code in the host app.
@_cdecl("milibris_open_reader")
public func milibrisOpenReader(_ releasePathPtr: UnsafePointer<CChar>) {
  let releasePath = String(cString: releasePathPtr)

  Task { @MainActor in
    let releaseUrl = URL(fileURLWithPath: releasePath)
    let reader = Reader(
      releasePath: releaseUrl,
      articlesLanguageCode: nil,
      config: ReaderConfig()
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
