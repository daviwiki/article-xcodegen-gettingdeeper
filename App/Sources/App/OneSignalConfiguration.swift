
import Foundation
import OneSignalFramework

protocol OneSignalConfiguration {
    func configure(options: [AnyHashable: Any]?) async
}

struct OneSignalConfigurationImpl: OneSignalConfiguration {
    
    func configure(options: [AnyHashable: Any]?) async {
        // Remove this method to stop OneSignal Debugging
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        
        // OneSignal initialization
        OneSignal.initialize("YOUR_ONESIGNAL_APP_ID", withLaunchOptions: options)
        
        // requestPermission will show the native iOS notification permission prompt.
        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
    }
}

extension OneSignalConfigurationImpl {
    static func create() -> OneSignalConfiguration {
        OneSignalConfigurationImpl()
    }
}
