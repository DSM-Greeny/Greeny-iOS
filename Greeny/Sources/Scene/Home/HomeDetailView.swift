import SwiftUI
import Service

struct HomeDetailView: View {
    var id = 0

    init(id: Int) {
        self.id = id
    }

    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://dsm-greeny.netlify.app/news/\(id)",
                accessTokenGetter: { "" }
            )
            .greenyBackground()
        }
        .navigationViewStyle(.stack)
        .setBackbutton()
    }
}
