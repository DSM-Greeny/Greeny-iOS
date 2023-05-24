import SwiftUI

struct LoginView: View {
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
                    HStack(spacing: 3) {
                        Text("Login")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .padding(.bottom, 30)
                    AuthTextField("아이디", isSecret: false, text: $text)
                        .padding(.bottom, 25)
                    AuthTextField("비밀번호", isSecret: true, text: $text)
                        .padding(.bottom, 25)
                }
                AuthButton(text: "Login") {
                                    }
                .padding(.bottom, 20)

                HStack(alignment: .bottom, spacing: 3) {
                    Spacer()
                    Text("아직 회원이 아니신가요?")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    Button {
//                        viewModel.buttonPressed.toggle()
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
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
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
