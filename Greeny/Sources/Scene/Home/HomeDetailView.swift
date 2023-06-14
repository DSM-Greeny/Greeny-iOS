import SwiftUI
import Service

var publicIsId = 0

struct HomeDetailView: View {
    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://dsm-greeny.netlify.app/news/\(publicIsId)",
                accessTokenGetter: { "" }
            )
            .greenyBackground()
        }
        .navigationViewStyle(.stack)
        .setBackbutton()
    }
}
