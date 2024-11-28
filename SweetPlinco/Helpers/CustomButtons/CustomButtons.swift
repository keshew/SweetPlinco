import SwiftUI

struct CircleButton: View {
    var action: () -> Void
    var imageFor: String
    var sizeWForeground: CGFloat
    var sizeHForeground: CGFloat
    var sizeWBackground: CGFloat
    var sizeHBackground: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.circleButton.rawValue)
                    .resizable()
                    .frame(width: sizeWBackground, height: sizeHBackground)
                
                Image(imageFor)
                    .resizable()
                    .frame(width: sizeWForeground, height: sizeHForeground)
            }
        }
    }
}

struct CirclTexteButton: View {
    var action: () -> Void
    var textLabel: String
    var size: CGFloat
    var color: Color
    var sizeWBackground: CGFloat
    var sizeWBText: CGFloat
    var sizeHBackground: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(ImageName.circleButton.rawValue)
                    .resizable()
                    .frame(width: sizeWBackground, height: sizeHBackground)
                
               Text(textLabel)
                    .Janga(size: size, color: color)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: sizeWBText)
            }
        }
    }
}

struct BuyRectangle: View {
    var sizeOfText: CGFloat
    var textLabel: String
    var colorOfText: Color
    var sizeH: CGFloat
    var sizeW: CGFloat
    var sizeHCoin: CGFloat
    var sizeWCoin: CGFloat
    var offsetX: CGFloat
    var offsetY: CGFloat
    var body: some View {
        Button(action: {
        }) {
            ZStack {
                Image(ImageName.buyRectangle.rawValue)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                
                HStack {
                    Text(textLabel)
                        .Janga(size: sizeOfText, color: colorOfText)
                    Image(ImageName.coin.rawValue)
                        .resizable()
                        .frame(width: sizeWCoin, height: sizeHCoin)
                }
            }
         
        }
        .offset(x: offsetX, y: offsetY)
    }
}

struct ItemToBuy: View {
    var sizeOfText: CGFloat
    var textLabel: String
    var itemToBuy: String
    var sizeH: CGFloat
    var sizeW: CGFloat
    var body: some View {
        ZStack {
            Image(ImageName.itemSquare.rawValue)
                .resizable()
                .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
            
            Image(itemToBuy)
                .resizable()
                .frame(minWidth: sizeW / 2, maxWidth: sizeW, minHeight: sizeH / 2, maxHeight: sizeH)
            
            BuyRectangle(sizeOfText: sizeOfText,
                         textLabel: textLabel,
                         colorOfText: .white,
                         sizeH: 40,
                         sizeW: 110,
                         sizeHCoin: 25,
                         sizeWCoin: 25,
                         offsetX: 0,
                         offsetY: 50)
        }
    }
}

struct LabelText: View {
    var sizeOfText: CGFloat
    var textLabel: String
    var colorOfText: Color
    var sizeH: CGFloat
    var sizeW: CGFloat
    var offsetX: CGFloat
    var offsetY: CGFloat
    var body: some View {
        ZStack {
            Image(ImageName.labelRectangle.rawValue)
                .resizable()
                .frame(width: sizeW, height: sizeH)
            
            Text(textLabel)
                .Janga(size: sizeOfText, color: colorOfText)
        }
        .offset(x: offsetX, y: offsetY)
    }
}

struct LabelWithBalls: View {
    var sizeOfText: CGFloat
    var textLabel: String
    var colorOfText: Color
    var sizeH: CGFloat
    var sizeW: CGFloat
    var textOffset: CGFloat
    var image: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: sizeW, height: sizeH)
            
            Text(textLabel)
                .Kavoon(size: sizeOfText, color: colorOfText)
                .offset(y: textOffset)
        }

    }
}
