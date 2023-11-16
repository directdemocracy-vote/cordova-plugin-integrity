import DeviceCheck

@objc(Integrity)
class Integrity : CDVPlugin {
  @objc func check(_ command: CDVInvokedUrlCommand) {
    if DCDevice.current.isSupported {
      DCDevice.current.generateToken(completionHandler: {
        token, error in guard let token = token else {
          let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Failed to create token")
          self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
          return;
        }
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: token.base64EncodedString())
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
        return;
      })
    } else {
      let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "N/A")
      self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
  }
}
