import SwiftUI

class SpinViewModel: ObservableObject {
    let contact = SpinModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func createGameScene(gameData: GameData) -> SpinSpriteKit {
        let scene = SpinSpriteKit()
        scene.game  = gameData
        return scene
    }
}
