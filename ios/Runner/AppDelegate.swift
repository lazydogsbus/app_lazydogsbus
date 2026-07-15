import UIKit
import Flutter
import GoogleMaps // ADICIONE ESTA LINHA

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // ADICIONE ESTA LINHA AQUI, substituindo YOUR_IOS_API_KEY pela sua chave real para iOS
    GMSServices.provideAPIKey("AIzaSyBUOuMp_guU59mDn99zJr7kSnmhGd-uGMw")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}