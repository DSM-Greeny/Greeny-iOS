import SwiftUI

public struct AuthButton: View {
    var text: String
    var style: WideButtonStyle.Style
    var color: Color
    var action: () -> Void

    public init(
        text: String = "",
        style: WideButtonStyle.Style = .contained,
        color: Color = Color("Main 1"),
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()

                Text(text)
                    .padding(.vertical, 14)

                Spacer()
            }
        }
        .buttonStyle(WideButtonStyle(style: style, color: color))
    }
}
public struct WideButtonStyle: ButtonStyle {
    public enum Style {
        case contained
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        return AnyView(ContainedButton(configuration: configuration, color: color))
    }
}

// MARK: - Usage
extension Button {
    func dmsStyle(_ style: WideButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(WideButtonStyle(style: style, color: color))
    }
}

// MARK: - Contained
extension WideButtonStyle {
    struct ContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
            configuration.isPressed ? 0.7 :
            1.0 :
            0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .frame(height: 55)
                .background(color)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .cornerRadius(15)
                .opacity(opacity)
                .greenyShadow()
        }
    }
}
