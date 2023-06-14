import SwiftUI
import Service

struct PostView: View {
    @State var isNavigate = false
    var body: some View {
        NavigationView {
            ZStack {

                XWebKitView(
                    urlString: "https://dsm-greeny.netlify.app/community",
                    accessTokenGetter: { "" }
                )
                .greenyBackground()
                .overlay(content: {
                    Button(action: {
                        print("dskfjdkslf")
                        isNavigate.toggle()
                    }, label: {
                        Text("lll")
                            .foregroundColor(.clear)
                            .frame(height: 50)
                    })
                })
            }

        }
        .navigate(to: PostDetailView(), when: $isNavigate)
        .navigationViewStyle(.stack)
    }
}
