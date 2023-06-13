import SwiftUI

struct LoginView: View {
    @State var text: String = ""
    @State var signUpButtonPressed: Bool = false
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

                        Text("Login")
                            .font(.system(size: 26, weight: .bold))
                    }
                    .padding(.bottom, 15)
                    AuthTextField("아이디", isSecret: false, text: $text)
                        .padding(.bottom, 15)

                    AuthTextField("비밀번호", isSecret: true, text: $text)
                        .padding(.bottom, 15)
                }
                AuthButton(text: "Login") {
                }
                .padding(.bottom, 15)

                HStack(alignment: .bottom, spacing: 3) {
                    Spacer()
                    Text("아직 회원이 아니신가요?")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Button {
                        signUpButtonPressed.toggle()
                    } label: {
                        Text("회원가입")
                            .font(.system(size: 12, weight: .regular))
                            .underline()
                            .foregroundColor(.gray)

                    }
                    Spacer()
                }

                Spacer()
            }
            .navigate(to: EmailView(), when: $signUpButtonPressed)
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
            .greenyBackground()

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
