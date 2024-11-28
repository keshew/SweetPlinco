import SwiftUI

struct PauseView: View {
    @StateObject var pauseModel =  PauseViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.pauseBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Text("PAUSE")
                    .Kavoon(size: 86, color: .purple)
             
                Image(ImageName.labelRectangle.rawValue)
                    .resizable()
                    .frame(width: 220, height: 70)
                
                VStack(spacing: 50) {
                    HStack {
                        CircleButton(action: pauseModel.onMusic,
                                     imageFor: ImageName.soundImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: pauseModel.goToInfo,
                                     imageFor: ImageName.infoImage.rawValue,
                                     sizeWForeground: 20,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: pauseModel.goToShop,
                                     imageFor: ImageName.lockedImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                    }
                    
                    HStack {
                        CircleButton(action: pauseModel.goToMenu,
                                     imageFor: ImageName.menuImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: pauseModel.resume,
                                     imageFor: ImageName.playImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                        
                        CircleButton(action: pauseModel.retry,
                                     imageFor: ImageName.retryImage.rawValue,
                                     sizeWForeground: 40,
                                     sizeHForeground: 40,
                                     sizeWBackground: 100,
                                     sizeHBackground: 100)
                    }
                }
            }
            .navigationDestination(isPresented: $pauseModel.isInfoAvailible) {
                InfoView()
            }
            
            .navigationDestination(isPresented: $pauseModel.isMenuAvailible) {
                MenuView()
            }
            
            .navigationDestination(isPresented: $pauseModel.isShopAvailible) {
                ShopView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PauseView()
}

