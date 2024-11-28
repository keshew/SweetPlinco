import SwiftUI

class ShopViewModel: ObservableObject {
    let contact = ShopModel()
    @Published var isMenuAvailible = false
    var money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue)
    func goToMenu() {
        isMenuAvailible = true
    }
}
