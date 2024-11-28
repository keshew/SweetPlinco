import SwiftUI

class MenuViewModel: ObservableObject {
    let contact = MenuModel()
    @Published var isShopAvailible = false
    @Published var isInfoAvailible = false
    @Published var isPlayAvailible = false

    func disableSound() {
        
    }
    
    func goToInfo() {
        isInfoAvailible = true
    }
    
    func goToPlay() {
        isPlayAvailible = true
    }
    
    func goToShop() {
        isShopAvailible = true
    }
}
