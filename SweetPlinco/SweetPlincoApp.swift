import SwiftUI

@main
struct SweetPlincoApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
                .onAppear() {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
