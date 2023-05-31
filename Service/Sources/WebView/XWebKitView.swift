import SwiftUI

public struct XWebKitView: View {

    @ObservedObject var state: XWebKitState

    public init(urlString: String, accessTokenGetter: @escaping () -> String = { "" }) {
        self.state = .init(
            urlString: urlString,
            accessTokenGetter: accessTokenGetter,
            isPresentated: .constant(true),
            naviagteRightButtonText: nil
        )
    }

    init(
        urlString: String,
        accessTokenGetter: @escaping () -> String,
        isPresentated: Binding<Bool>,
        naviagteRightButtonText: String?
    ) {
        self.state = .init(
            urlString: urlString,
            accessTokenGetter: accessTokenGetter,
            isPresentated: isPresentated,
            naviagteRightButtonText: naviagteRightButtonText
        )
    }

    public var body: some View {
        ZStack {
            ComposedWebView(state: self.state)
            if !self.state.isLoadingHidden {
                VStack {
                    ProgressView(value: self.state.loadingProgress)
                        .progressViewStyle(XWebKitProgressViewStyle())
                    Spacer()
                }
            }
            NavigationLink(
                isActive: self.$state.needsToNavigate,
                destination: {
                    XWebKitView(
                        urlString: self.state.naviagteLink,
                        accessTokenGetter: self.state.accessTokenGetter,
                        isPresentated: self.$state.needsToNavigate,
                        naviagteRightButtonText: self.state.naviagteRightButtonText
                    )
                    .navigationTitle(self.state.naviagteTitle)
                    .navigationBarTitleDisplayMode(.inline)
                },
                label: { EmptyView() }
            )
        }
        .toolbar {
            if let rightButtonText = self.state.rightButtonText {
                Button(rightButtonText) {
                    self.state.naviagteRightButtonTap = ()
                }
                .disabled(!self.state.isRightButtonEnabled)
            }
        }
        .alert(
            isPresented: self.$state.isAlertPresented) {
                Alert(title: Text(self.state.alertMessage))
            }
            .alert(
                isPresented: self.$state.isErrorAlertPresented) {
                    Alert(title: Text("문제가 발생했습니다."))
                }

    }
}
