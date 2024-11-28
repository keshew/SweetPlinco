import SwiftUI

struct MenuView: View {
    @StateObject var menuViewModel =  MenuViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(ImageName.menuBack.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(ImageName.flyBall.rawValue)
                    .resizable()
                    .frame(width: 300, height: 500)
                    .offset(x: 70, y: -130)
                
                Image(ImageName.ballsBottom.rawValue)
                    .resizable()
                    .frame(width: 400, height: 300)
                    .offset(x: 0, y: 270)
                
                Image(ImageName.fogBottom.rawValue)
                    .resizable()
                    .offset(x: 0, y: 270)
                
                VStack(spacing: 0) {
                    LabelWithBalls(sizeOfText: 79,
                                   textLabel: menuViewModel.contact.sweetLabel,
                                   colorOfText: .yellow,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.balls.rawValue)
                    
                    LabelWithBalls(sizeOfText: 79,
                                   textLabel: menuViewModel.contact.plincoLabel,
                                   colorOfText: .yellow,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.balls.rawValue)
                    Spacer()
                }
                
                VStack(spacing: 5) {
                    Spacer()
                    Button(action: {
                        menuViewModel.goToPlay()
                    }) {
                        ZStack {
                            Image(ImageName.rectangleButton.rawValue)
                                .resizable()
                                .frame(width: 300, height: 100)
                            Text(menuViewModel.contact.playLabel)
                                .Janga(size: 62, color: .purple)
                        }
                    }
                    
                    HStack {
                        CircleButton(action: menuViewModel.disableSound,
                                     imageFor: ImageName.soundImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: menuViewModel.goToInfo,
                                     imageFor: ImageName.infoImage.rawValue,
                                     sizeWForeground: 20,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: menuViewModel.goToShop,
                                     imageFor: ImageName.lockedImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                    }
                }
            }
            .navigationDestination(isPresented: $menuViewModel.isShopAvailible) {
                ShopView()
            }
            
            .navigationDestination(isPresented: $menuViewModel.isPlayAvailible) {
                LevelView()
            }
            
            .navigationDestination(isPresented: $menuViewModel.isInfoAvailible) {
                InfoView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MenuView()
}

