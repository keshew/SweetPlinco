import SwiftUI

class InfoViewModel: ObservableObject {
    let contact = InfoModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func privacy() {
    }
}
