# cordova-plugin-integrity

This plugin allows an app to perform an integrity check on itself and on the host system.
Integrity checks guarantee that the genuine app is used on an approved system, e.g., a non-rooted unmodified smartphone.
The plugin provide a common interface to the [Android Play Integrity](https://developer.android.com/google/play/integrity) and the [Apple iOS DeviceCheck](https://developer.apple.com/documentation/devicecheck) providing integrity checks.

Here is an example usage:

```js
  function onDeviceReady() {
    console.log('Device is ready');
    const randomBytes = new Uint8Array(294); // emulating a public key
    crypto.getRandomValues(randomBytes);
    let randomBinaryString = '';
    randomBytes.forEach((v) => { randomBinaryString += String.fromCharCode(v); });
    const nonce = CryptoJS.SHA1(randomBinaryString);
    integrity.check(btoa(nonce), function(message) { // success
      console.log('Plugin success: ' + message);
      alert(message);
      fetch('https://app.directdemocracy.vote/api/integrity.php',
        { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body: 'token=' + message })
        .then((response) => response.json())
        .then((answer) => {
          if (answer.error)
            app.dialog.alert(`${answer.error}<br>Please try again.`, 'App API Error');
          else
            alert(answer.result);
        });
    }, function(message) { // failure
      if (message.startsWith('-9: '))
        console.log('Integrity check skipped on emulator (Play Store should be updated)');
      else {
        console.log(message);
        alert(message);
      }
    });
  }
  document.addEventListener('deviceready', onDeviceReady, false);
```
