import SwiftUI
import Service

struct HomeView: View {
    @State var isNavigate = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("오늘의\n친환경 뉴스레터")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.init(asset: GreenyAsset.background6))
                        .padding(.leading, 40)
                        .padding(.top, 40)

                    Spacer()
                }

                Spacer()
                MealCarouselView(isLoading: .constant(true))
                    .padding(.bottom, 40)

            }
            .greenyBackground()
            .navigate(to: HomeDetailView(), when: $isNavigate)
            .overlay(content: {
                Button(action: {
                    print("dskfjdkslf")
                    isNavigate.toggle()
                }, label: {
                    Text("1234567890-")
                        .foregroundColor(.clear)
                        .frame(height: 50)
                })
            })
        }
        .navigationViewStyle(.stack)
    }
}
