import SwiftUI

struct ShopView: View {
    @StateObject var shopModel =  ShopViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.shopBack.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CircleButton(action: shopModel.goToMenu,
                                 imageFor: ImageName.backArrowImage.rawValue,
                                 sizeWForeground: 20,
                                 sizeHForeground: 20,
                                 sizeWBackground: 60,
                                 sizeHBackground: 60)
                    
                    LabelWithBalls(sizeOfText: 69,
                                   textLabel: "SHOP",
                                   colorOfText: .purple,
                                   sizeH: 115,
                                   sizeW: 250,
                                   textOffset: -20,
                                   image: ImageName.darkBalls.rawValue)
                    Spacer()
                }
                .padding()
                
                
                VStack(spacing: 40) {
                    ZStack {
                        Image(ImageName.wideRectangleButton.rawValue)
                            .resizable()
                        .frame(minWidth: 350, maxWidth: 370, minHeight: 100, maxHeight: 150)
                        
                        HStack {
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "10.000",
                                      itemToBuy: ImageName.bundleBalls1.rawValue,
                                      sizeH: 100,
                                      sizeW: 100)
                            
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "15.000",
                                      itemToBuy: ImageName.bundleBalls2.rawValue,
                                      sizeH: 100,
                                      sizeW: 100)
                            
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "20.000",
                                      itemToBuy: ImageName.bundleBalls3.rawValue,
                                      sizeH: 100,
                                      sizeW: 100)
                        }
                        
                        
                        
                        LabelText(sizeOfText: 24,
                                  textLabel: "BALLS",
                                  colorOfText: .white,
                                  sizeH: 40,
                                  sizeW: 100,
                                  offsetX: -110, offsetY: -75)
                    }
                    
                    ZStack {
                        Image(ImageName.wideRectangleButton.rawValue)
                            .resizable()
                            .frame(minWidth: 350, maxWidth: 370, minHeight: 100, maxHeight: 150)
                        
                        HStack {
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "10.000",
                                      itemToBuy: ImageName.itemSquare.rawValue,
                                      sizeH: 100,
                                      sizeW: 100)
                            
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "15.000",
                                      itemToBuy: ImageName.gameBack1.rawValue,
                                      sizeH: 75,
                                      sizeW: 75)
                            
                            ItemToBuy(sizeOfText: 20,
                                      textLabel: "20.000",
                                      itemToBuy: ImageName.gameBack2.rawValue,
                                      sizeH: 75,
                                      sizeW: 75)
                        }
                        
                        LabelText(sizeOfText: 22,
                                  textLabel: "BACKGROUNDS",
                                  colorOfText: .white,
                                  sizeH: 50,
                                  sizeW: 190,
                                  offsetX: -70, offsetY: -75)
                    }
                    
                    
                    ZStack {
                        Image(ImageName.labelRectangle.rawValue)
                            .resizable()
                        .frame(width: 220, height: 70)
                        
                        HStack {
                            Text("\(shopModel.money as! Int)")
                                .Janga(size: 30, color: .white)
                            
                            Image(ImageName.coin.rawValue)
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                
                LabelWithBalls(sizeOfText: 39,
                               textLabel: "COMING SOON",
                               colorOfText: .purple,
                               sizeH: 115,
                               sizeW: 250,
                               textOffset: 0,
                               image: ImageName.darkBalls.rawValue)
                
            }
            .navigationDestination(isPresented: $shopModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShopView()
}

