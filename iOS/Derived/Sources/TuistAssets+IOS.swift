// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum IOSAsset {
  public static let accentColor = IOSColors(name: "AccentColor")
  public static let background1 = IOSColors(name: "background 1")
  public static let background2 = IOSColors(name: "background 2")
  public static let background3 = IOSColors(name: "background 3")
  public static let background4 = IOSColors(name: "background 4")
  public static let background5 = IOSColors(name: "background 5")
  public static let background6 = IOSColors(name: "background 6")
  public static let background7 = IOSColors(name: "background 7")
  public static let shadow1 = IOSColors(name: "shadow 1")
  public static let error1 = IOSColors(name: "Error 1")
  public static let error2 = IOSColors(name: "Error 2")
  public static let main1 = IOSColors(name: "Main 1")
  public static let main2 = IOSColors(name: "Main 2")
  public static let main3 = IOSColors(name: "Main 3")
  public static let main4 = IOSColors(name: "Main 4")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class IOSColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension IOSColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: IOSColors) {
    let bundle = IOSResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: IOSColors) {
    let bundle = IOSResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all