/* global cordova, module */

module.exports = {
  greet: function(name, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Integrity", "greet", [name]);
  },
  check: function(name, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Integrity", "check", [name]);
  }
};
