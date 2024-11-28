import SwiftUI

class PauseViewModel: ObservableObject {
    let contact = PauseModel()
    @Published var isMenuAvailible = false
    @Published var isShopAvailible = false
    @Published var isInfoAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func onMusic() {
        
    }
    
    func goToShop() {
        isShopAvailible = true
    }
    
    func goToInfo() {
        isInfoAvailible = true
    }
    
    func resume() {
        
    }
    
    func retry() {
        
    }
}
