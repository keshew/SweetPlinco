import Foundation

enum Keys: String {
    case numberOfLevel = "numberOfLevel"
    case countOfMoney = "countOfMoney"
    case arrayOfStars = "arrayOfStars"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.numberOfLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(1, forKey: Keys.numberOfLevel.rawValue)
            UserDefaultsManager.defaults.set([""], forKey: Keys.arrayOfStars.rawValue)
            UserDefaultsManager.defaults.set(30000, forKey: Keys.countOfMoney.rawValue)
        }
    }
    
    func saveStarImage(image: String) {
        var array = UserDefaultsManager.defaults.object(forKey: Keys.arrayOfStars.rawValue) as? [String]
        array?.append(image)
        UserDefaultsManager.defaults.set(array, forKey: Keys.arrayOfStars.rawValue)
    }
    
    func completeLevel() {
        let level = UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue) as? Int ?? 0
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        if level < 21 {
            UserDefaultsManager.defaults.set(level + 1, forKey: Keys.numberOfLevel.rawValue)
            UserDefaultsManager.defaults.set(money + 150, forKey: Keys.countOfMoney.rawValue)
        }
    }
}
