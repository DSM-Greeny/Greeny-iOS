import SwiftUI
import Service

struct PostDetailView: View {
    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://dsm-greeny.netlify.app/community/1",
                accessTokenGetter: { "" }
            )
            .greenyBackground()
        }
        .navigationViewStyle(.stack)
        .setBackbutton()
    }
}
