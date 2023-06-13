import SwiftUI
import Service

struct MyPageView: View {
    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://dsm-greeny.netlify.app/mypage",
                accessTokenGetter: { "" }
            )
        }
        .navigationViewStyle(.stack)
    }
}
