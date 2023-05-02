import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) {
            if let googleMapApiKey = dict["googelMapApiKey"] as? String {                 GMSServices.provideAPIKey(googleMapApiKey)
            }
        }
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
