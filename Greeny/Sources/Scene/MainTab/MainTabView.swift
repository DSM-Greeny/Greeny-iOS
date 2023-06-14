import SwiftUI

public enum TabFlow: Int {
    case home
    case apply
    case notice
    case myPage
}

struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    var tabItem: [(String, String, TabFlow)] {
        var tabItems: [(String, String, TabFlow)] = [
            ("tab1", "친환경 소식", .home),
            ("tab2", "애코 샵", .apply),
            ("tab3", "커뮤니티", .notice),
            ("tab4", "마이페이지", .myPage)
        ]
        return tabItems
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {

                HomeView()
                    .tag(TabFlow.home)

                MapView()
                    .tag(TabFlow.apply)

                PostView()
                    .tag(TabFlow.notice)

                MyPageView()
                    .tag(TabFlow.myPage)
            }

            VStack {
                Spacer()
                tabbarView()
                    .background {
                        Color.init(asset: GreenyAsset.background1)
                            .ignoresSafeArea()
                    }
                    .greenyShadow()
            }

        }
        .ignoresSafeArea(.keyboard)
    }

    @ViewBuilder
    func tabbarView() -> some View {
        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { name, title, tag in
                tabItemView(systemName: name, title: title, tag: tag)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(systemName: String, title: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            VStack(spacing: 7) {
                Image(systemName)
                    .renderingMode(.template)
                    .foregroundColor(tag == selection ?
                                     Color.init(asset: GreenyAsset.background7) : Color.init(asset: GreenyAsset.background5))

                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(tag == selection ?
                                     Color.init(asset: GreenyAsset.background7) : Color.init(asset: GreenyAsset.background5))

            }
            .padding(.top, 12)
            .padding(.bottom, 4)
        }
    }
}
