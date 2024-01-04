
import SwiftUI

@main
struct App: SwiftUI.App {
    
    init() {
        Task {
            await FirebaseConfigurationImpl.create().configure()
            await OneSignalConfigurationImpl.create().configure(options: nil)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
