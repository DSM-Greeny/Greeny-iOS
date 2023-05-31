import SwiftUI

struct XWebKitProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            RoundedRectangle(cornerRadius: 14)
                .frame(
                    width: CGFloat(configuration.fractionCompleted ?? 0) * UIScreen.main.bounds.size.width,
                    height: 1
                )
                .foregroundColor(.green)
        }
    }
}

struct XWebKitProgressViewStylePreview: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(XWebKitProgressViewStyle())
    }
}
