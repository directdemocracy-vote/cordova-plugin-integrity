@objc(Integrity) class Integrity : CDVPlugin {
  @objc(check:)
  func check(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    let msg = command.arguments[0] as? String ?? ""
    if msg.characters.count > 0
      pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: msg)
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
  }
}
