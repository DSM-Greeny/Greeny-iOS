import SwiftUI
import Service

struct MapView: View {
    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://dsm-greeny.netlify.app/map",
                accessTokenGetter: { "" }
            )
            .greenyBackground()
        }
        .navigationViewStyle(.stack)
    }
}
