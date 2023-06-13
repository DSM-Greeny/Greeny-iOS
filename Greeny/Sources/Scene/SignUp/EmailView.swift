import SwiftUI

struct EmailView: View {
    @State var text: String = ""
    var body: some View {
        NavigationView {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                Spacer()
                    .frame(height: 172)
                Group {
                    HStack(spacing: 5) {
                        Image(GreenyAsset.appLogoSmall.name)
                            .frame(width: 35, height: 35)

                        Text("Sign Up")
                            .font(.system(size: 26, weight: .bold))
                    }
                    .padding(.bottom, 15)
                    AuthTextField("아이디를 입력해 주세요.", isSecret: false, text: $text)
                        .padding(.bottom, 15)

                    AuthTextField("이메일을 입력해 주세요", isSecret: false, text: $text)
                        .padding(.bottom, 15)
                }
                AuthButton(text: "다음") {
                }
                .padding(.bottom, 15)

                Spacer()
            }
            .greenyBackground()
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
            .setBackbutton()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    //                    self.isToast = false
                }
            }
        }
    }
}
