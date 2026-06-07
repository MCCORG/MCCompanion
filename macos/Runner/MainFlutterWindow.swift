import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()

    self.minSize = NSSize(width: 600, height: 600)
    self.collectionBehavior = [.managed, .participatesInCycle, .fullScreenPrimary]

    self.contentViewController = flutterViewController

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()

    // Open maximised on launch
    self.setFrame(NSScreen.main?.visibleFrame ?? self.frame, display: true)
  }
}
