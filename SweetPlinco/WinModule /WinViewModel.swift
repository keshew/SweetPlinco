import SwiftUI

class WinViewModel: ObservableObject {
    let contact = WinModel()
    @Published var isSpinAvailible = false

    func goToSpin() {
        isSpinAvailible = true
    }
}
