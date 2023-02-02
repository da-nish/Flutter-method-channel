import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      //Start method channel
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
              let mlkitChannel = FlutterMethodChannel(name: "example.com/channel",
                                                        binaryMessenger: controller.binaryMessenger)
          mlkitChannel.setMethodCallHandler({
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              if call.method == "customMethodName"{
              result("Hello from iOS")
              }
           })
      //End method channel
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
    
}
