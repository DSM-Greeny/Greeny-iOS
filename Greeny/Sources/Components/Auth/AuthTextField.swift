import SwiftUI

struct AuthTextField: View {
    let placeholder: String
    let isSecret: Bool
    @Binding var text: String
    @State private var isShow: Bool

    init(
        _ placeholder: String,
        isSecret: Bool,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.isSecret = isSecret
        self._text = text
        self.isShow = !isSecret
    }

    var body: some View {
        ZStack(alignment: .trailing) {

            HStack {
                if isShow {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }
            .font(.system(size: 16, weight: .medium))
            .frame(height: 55)
            .padding(.leading, 19)
            .textInputAutocapitalization(.never)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(GreenyAsset.background1.swiftUIColor)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(GreenyAsset.background3.swiftUIColor, lineWidth: 1)
            }
            .greenyShadow()
            if isSecret {
                HStack {
                    Button {
                        self.isShow.toggle()
                    } label: {
                        Image(systemName: isShow ? "eye" : "eye.slash")
                    }
                    .frame(width: 25, height: 23)
                    .tint(.gray)
                    .padding(.trailing, 15)
                }
            }
        }
    }
}
