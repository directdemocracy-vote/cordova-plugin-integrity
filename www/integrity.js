/* global cordova, module */

module.exports = {
  check: function(nonce, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Integrity", "check", [nonce]);
  }
};
