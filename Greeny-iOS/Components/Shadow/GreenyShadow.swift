import SwiftUI

public struct GreenyShadow: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    public func body(content: Content) -> some View {
        content
            .shadow(
                color: Color("shadow 1"),
                y: 1,
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
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0.0,
        spread: CGFloat = 0
    ) -> some View {
        let radius = blur / 2.0
        let spreadedX = x + spread
        let spreadedY = y + spread
        return shadow(
            color: color,
            radius: radius,
            x: spreadedX,
            y: spreadedY
        )
    }
}
