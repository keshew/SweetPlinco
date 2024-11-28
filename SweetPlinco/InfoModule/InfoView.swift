import SwiftUI

struct InfoView: View {
    @StateObject var infoModel =  InfoViewModel()
    var body: some View {
        ZStack {
            Image(ImageName.menuBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    CircleButton(action: infoModel.goToMenu,
                                 imageFor: ImageName.backArrowImage.rawValue,
                                 sizeWForeground: 20,
                                 sizeHForeground: 20,
                                 sizeWBackground: 60,
                                 sizeHBackground: 60)
                    
                    LabelWithBalls(sizeOfText: 59,
                                   textLabel: "INFO",
                                   colorOfText: .yellow,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.balls.rawValue)
                    
                    CirclTexteButton(action: infoModel.privacy,
                                     textLabel: "PRIVACY POLICE",
                                     size: 7,
                                     color: .white,
                                     sizeWBackground: 60,
                                     sizeWBText: 40,
                                     sizeHBackground: 60)
                }
                
                Image(ImageName.infoText.rawValue)
                    .resizable()
                    .frame(minWidth: 350, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
                    .padding()
            }
            .navigationDestination(isPresented: $infoModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InfoView()
}

