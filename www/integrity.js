/* global cordova, module */

module.exports = {
  check: function (name, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Integrity", "check", [name]);
  }
};
