/* global cordova, module */

module.exports = {
  greet: function(name, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "integrity", "greet", [name]);
  },
  check: function(name, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "integrity", "check", [name]);
  }
};
