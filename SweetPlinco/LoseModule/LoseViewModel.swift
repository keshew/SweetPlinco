import SwiftUI

class LoseViewModel: ObservableObject {
    let contact = LoseModel()
    @Published var isGameAvailible = false

    func retry() {
        isGameAvailible = true
    }
}
