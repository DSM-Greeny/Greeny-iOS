import SwiftUI

public extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        self.background {
            NavigationLink(isActive: binding) {
                DeferView {
                    view
                }
            } label: {
                EmptyView()
            }
            .isDetailLink(isDetailLink)
        }
    }
}

public struct DeferView<Content: View>: View {
    let content: () -> Content

    public init(
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.content = content
    }

    public var body: some View {
        content()
    }
}

struct SetBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 18, height: 16)
                    }
                    .navigationBarBackButtonHidden()
                    .foregroundColor(.black)
                }
            }
    }
}

extension View {
    func setBackbutton() -> some View {
        modifier(SetBackButtonModifier())
    }
}
