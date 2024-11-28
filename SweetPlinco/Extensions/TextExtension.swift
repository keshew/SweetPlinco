import SwiftUI

extension Text {
    func Janga(size: CGFloat, color: Color) -> some View {
        self.font(.custom("JandaManateeSolid", size: size))
            .bold()
            .foregroundColor(color)
    }
    
    func Kavoon(size: CGFloat, color: Color) -> some View {
        self.font(.custom("Kavoon-Regular", size: size))
            .bold()
            .foregroundColor(color)
    }
}
