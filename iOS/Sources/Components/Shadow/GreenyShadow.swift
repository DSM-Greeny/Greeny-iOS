import SwiftUI

public struct GreenyShadow: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    public func body(content: Content) -> some View {
        content
            .shadow(
                color: Color("shadow 1"),
                yPoint: 1,
                blur: 20
            )
    }
}

public extension View {
    func greenyShadow() -> some View {
        modifier(GreenyShadow())
    }
}

public extension View {
    func shadow(
        color: Color,
        xPoint: CGFloat = 0,
        yPoint: CGFloat = 0,
        blur: CGFloat = 0.0,
        spread: CGFloat = 0
    ) -> some View {
        let radius = blur / 2.0
        let spreadedX = xPoint + spread
        let spreadedY = yPoint + spread
        return shadow(
            color: color,
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
}
