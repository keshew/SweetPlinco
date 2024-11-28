import SwiftUI

class LevelViewModel: ObservableObject {
    let contact = LevelModel()
    @Published var isShopAvailible = false
    @Published var isMenuAvailible = false
    @Published var isGameAvailible = false
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 80))]
    let items = Array(1...20)

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToShop() {
        isShopAvailible = true
    }
    
    func goToGame() {
        isGameAvailible = true
    }
    
    func setupLevel(index: Int) -> (Color, String, String, String, Bool) {
        var сarthageLevel: (Color, String, String, String, Bool) = (.white, "", "\(0)" , "", true)
        let doneLevel = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as! Int - 1
        let arrayOfStarImages = UserDefaultsManager.defaults.object(forKey: Keys.arrayOfStars.rawValue) as! [String]
        print(arrayOfStarImages)
        if index == doneLevel {
            сarthageLevel = (.blue,
                      ImageName.currentLevel.rawValue,
                      "\(index + 1)",
                      ImageName.star0.rawValue,
                      false)
        } else if doneLevel > index {
            if arrayOfStarImages[index + 1] == ImageName.star3.rawValue {
                сarthageLevel = (.purple,
                                 ImageName.perfectLevel.rawValue,
                                 "\(index + 1)",
                                 arrayOfStarImages[index + 1],
                                 false)
            } else {
                сarthageLevel = (.red,
                                 ImageName.averrageLevel.rawValue,
                                 "\(index + 1)",
                                 arrayOfStarImages[index + 1],
                                 false)
            }
        } else {
            сarthageLevel = (.white,
                      ImageName.lockedLevel.rawValue,
                      "",
                      ImageName.clearImage.rawValue,
                      true)
        }
        return сarthageLevel
    }
}
