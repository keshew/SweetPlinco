import SwiftUI

struct WinView: View {
    @StateObject var winModel =  WinViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.winBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: -20) {
                    ZStack {
                        Image(ImageName.winLine.rawValue)
                            .resizable()
                            .frame(width: 300, height: 100)
                        
                        Image(ImageName.star.rawValue)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x: -65)
                        
                        Image(ImageName.star.rawValue)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .offset(x: 0, y: -10)
                        
                        Image(ImageName.star.rawValue)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x: 65)
                    }
                    LabelWithBalls(sizeOfText: 59,
                                   textLabel: "YOU DID IT!",
                                   colorOfText: .yellow,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.balls.rawValue)
                }
                Spacer()
                ZStack {
                    Image(ImageName.labelRectangle.rawValue)
                        .resizable()
                        .frame(width: 200, height: 70)
                    
                    Text("+150")
                        .Janga(size: 38, color: .white)
                        .offset(x: -30)
                    
                    Image(ImageName.coin.rawValue)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: 40)
                }
                
                Button(action: {
                }) {
                    ZStack {
                        Image(ImageName.rectangleButton.rawValue)
                            .resizable()
                        .frame(width: 300, height: 120)
                        
                        Text("CLAIM X2")
                            .Janga(size: 34, color: .white)
                            .offset(x: 15)
                        
                        Image(ImageName.videoImage.rawValue)
                            .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -100, y: -5)
                    }
                }
                
                Button(action: {
                    winModel.goToSpin()
                }) {
                    Text("CLAIM")
                        .Janga(size: 24, color: .white)
                }
                Spacer()
            }
            .navigationDestination(isPresented: $winModel.isSpinAvailible) {
                SpinView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WinView()
}

