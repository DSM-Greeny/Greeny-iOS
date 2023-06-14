import SwiftUI

public final class UIStateModel: ObservableObject {
    @Published public var activeCard: Int = 0
    @Published public var screenDrag: Float = 0.0
}

struct MealCarouselView: View {
    @StateObject var uiState = UIStateModel()
    @Binding var isLoading: Bool
    let spacing: CGFloat = 20
    let widthOfHiddenCards: CGFloat = UIScreen.main.bounds.width / 2 * 0.08
    let home = homeData
    var body: some View {
        CarouselCanvas {
            Carousel(
                numberOfItems: 5,
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                HStack(spacing: 20) {
                    homeCellView(data: home[0], type: 0)
                        .onAppear {
                            publicIsId = 1
                        }
                    homeCellView(data: home[1], type: 1)
                        .onAppear {
                            publicIsId = 2
                        }
                    homeCellView(data: home[2], type: 2)
                        .onAppear {
                            publicIsId = 3
                        }
                    homeCellView(data: home[3], type: 3)
                        .onAppear {
                            publicIsId = 4
                        }
                    homeCellView(data: home[4], type: 4)
                        .onAppear {
                            publicIsId = 5
                        }
                }
            }
        }
        .environmentObject(uiState)
    }
        @ViewBuilder
    func homeCellView(data: HomeEntity, type: Int) -> some View {
            VStack(alignment: .leading) {

                Text(data.title)
                    .foregroundColor(.init(asset: GreenyAsset.main1))
                    .font(.system(size: 20, weight: .black))
                    .padding(.top, 25)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)

                Spacer()
                    .frame(height: 6)

                Text(data.subTitle)
                    .foregroundColor(.init(asset: GreenyAsset.main1))
                    .font(.system(size: 12, weight: .medium))
                    .padding(.leading, 25)

                Spacer()

                HStack {
                    Spacer()

                    Image(data.image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.init(asset: GreenyAsset.main1))
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 20)
                        .padding(.trailing, 20)

                }

            }
            .frame(
                width: UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2),
                height: uiState.activeCard == type ?
                UIScreen.main.bounds.height * 0.63 :
                    UIScreen.main.bounds.height * 0.55
            )
            .background {
                Color.init(asset: GreenyAsset.background1)
                    .cornerRadius(20)

            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Color.init(asset: GreenyAsset.background3),
                        lineWidth: 1
                    )
            }
            .greenyShadow()
            .greenyBackground()
            .transition(.slide)
            .animation(.spring(), value: uiState.screenDrag)
        }
}
