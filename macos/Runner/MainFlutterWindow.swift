import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func toggleFullScreen(_ sender: Any?) {
  }

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()

    // Constrain window size — max width matches Flutter's 500pt constraint
    let maxWidth: CGFloat  = 500
    let minWidth: CGFloat  = 360
    let minHeight: CGFloat = 600

    self.minSize = NSSize(width: minWidth, height: minHeight)
    self.maxSize = NSSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)

    // Resize to max width if currently wider
    var frame = self.frame
    if frame.width > maxWidth {
      frame.size.width = maxWidth
    }
    if frame.width < minWidth {
      frame.size.width = minWidth
    }

    self.collectionBehavior = [.managed, .participatesInCycle]

    self.contentViewController = flutterViewController
    self.setFrame(frame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
