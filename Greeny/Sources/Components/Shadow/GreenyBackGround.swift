import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
//                Color.red
                Color.init(asset: GreenyAsset.background1)
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func greenyBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
