import Foundation
import DeviceCheck

@objc(Integrity)
class Integrity : CDVPlugin {
  @objc func check(_ command: CDVInvokedUrlCommand) {
    let msg = command.arguments[0] as? String ?? ""

    if DCDevice.current.isSupported {
      DCDevice.current.generateToken(completionHandler: {
        token, error in guard let token = token else {
          var pluginResult: CDVPluginResult
          pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Failed to create token")
          self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
          return;
        }
        var pluginResult: CDVPluginResult
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: token.base64EncodedString())
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
        return;
      })
    } else {
      var pluginResult: CDVPluginResult
      pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Not supported")
      self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
  }
}
