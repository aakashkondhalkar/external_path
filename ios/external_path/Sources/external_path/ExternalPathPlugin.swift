import Flutter
import UIKit

public class ExternalPathPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "external_path", binaryMessenger: registrar.messenger())
        let instance = ExternalPathPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getExternalStorageDirectories":
            result(getExternalStorageDirectories())
        case "getExternalStoragePublicDirectory":
            if let args = call.arguments as? [String: Any], let type = args["type"] as? String {
                result(getExternalStoragePublicDirectory(type: type))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func getExternalStorageDirectories() -> [String] {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map { $0.path }
        return paths
    }
    
    private func getExternalStoragePublicDirectory(type: String?) -> String {
        guard let type = type else {
            return ""
        }
        
        switch type {
        case "Documents":
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            if let documentsDirectory = paths.first {
                return documentsDirectory.path
            }
        case "Library":
            let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
            if let documentsDirectory = paths.first {
                return documentsDirectory.path
            }
        case "Caches":
            let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            if let documentsDirectory = paths.first {
                return documentsDirectory.path
            }
        case "Download":
            let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
            if let documentsDirectory = paths.first {
                return documentsDirectory.path
            }
        case "ApplicationSupportDirectory":
            let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
            if let documentsDirectory = paths.first {
                return documentsDirectory.path
            }
        default:
            return "No " + type + " directory found";
        }
        
        return ""
    }
    
}
