import SwiftUI

struct LevelView: View {
    @StateObject var levelModel =  LevelViewModel()
    
    var body: some View {
        ZStack {
            Image(ImageName.menuBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CircleButton(action: levelModel.goToMenu,
                                 imageFor: ImageName.backArrowImage.rawValue,
                                 sizeWForeground: 20,
                                 sizeHForeground: 20,
                                 sizeWBackground: 60,
                                 sizeHBackground: 60)
                    
                    LabelWithBalls(sizeOfText: 49,
                                   textLabel: "LEVELS",
                                   colorOfText: .purple,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.balls.rawValue)
                    
                    CircleButton(action: levelModel.goToShop,
                                 imageFor: ImageName.lockedImage.rawValue,
                                 sizeWForeground: 20,
                                 sizeHForeground: 20,
                                 sizeWBackground: 60,
                                 sizeHBackground: 60)
                }
                
                Spacer()
                LazyVGrid(columns: levelModel.columns) {
                    ForEach(Array(levelModel.items.enumerated()), id: \.1) { index, item in
                        Button(action: {
                            levelModel.goToGame()
                        }) {
                            ZStack {
                                Image(levelModel.setupLevel(index: index).1)
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                
                                Image(levelModel.setupLevel(index: index).3)
                                    .resizable()
                                    .frame(width: 85, height: 45)
                                    .offset(y: 30)
                                
                                Text(levelModel.setupLevel(index: index).2)
                                    .Janga(size: 22,
                                           color: levelModel.setupLevel(index: index).0)
                            }
                        }
                        .disabled(levelModel.setupLevel(index: index).4)
                    }
                }
                
                Spacer()
                
                VStack {
                    LabelWithBalls(sizeOfText: 34,
                                   textLabel: "COMING SOON",
                                   colorOfText: .purple,
                                   sizeH: 85,
                                   sizeW: 200,
                                   textOffset: -5,
                                   image: ImageName.balls.rawValue)
                }
            }
            .navigationDestination(isPresented: $levelModel.isMenuAvailible) {
                MenuView()
            }
            
            .navigationDestination(isPresented: $levelModel.isShopAvailible) {
                ShopView()
            }
            
            .navigationDestination(isPresented: $levelModel.isGameAvailible) {
                GameView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LevelView()
}

