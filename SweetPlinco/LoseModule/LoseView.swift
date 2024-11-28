import SwiftUI

struct LoseView: View {
    @StateObject var loseModel =  LoseViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.loseBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                LabelWithBalls(sizeOfText: 59,
                               textLabel: "TRY AGAIN!",
                               colorOfText: .blue,
                               sizeH: 255,
                               sizeW: 380,
                               textOffset: -25,
                               image: ImageName.cloud.rawValue)
                Spacer()
                CircleButton(action: loseModel.retry,
                             imageFor: ImageName.retryImage.rawValue,
                             sizeWForeground: 100,
                             sizeHForeground: 100,
                             sizeWBackground: 200,
                             sizeHBackground: 200)
                
            }
            .navigationDestination(isPresented: $loseModel.isGameAvailible) {
                GameView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoseView()
}

