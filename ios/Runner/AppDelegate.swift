import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

     // TODO: Add your API key
    GMSServices.provideAPIKey("AIzaSyDQ0KbwlegxfHnzlkelIpS2Ddl_5EdtpCM")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
