import SwiftUI
import Combine

struct OTPView: View {

    @Binding var text: String
    @FocusState var focused: Bool

    var body: some View {
        ZStack {
            TextField("", text: $text)
                .focused($focused)
                .keyboardType(.numberPad)
                .accentColor(.clear)
                .foregroundColor(.clear)
                .onReceive(Just(text), perform: { _ in
                    if 4 < text.count {
                        text = String(text.prefix(4))
                    }
                })
            HStack(spacing: 30) {
                ForEach(1...4, id: \.self) { num in
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(text.count >= num ? Color("66A865") : Color("D9D9D9"))
                }
            }
        }
        .onAppear {
            self.focused = true
        }
    }
}
