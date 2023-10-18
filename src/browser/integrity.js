async function check(success, error, payload) {
    if (payload && payload instanceof Array && typeof payload[0] === 'string' && payload[0].length > 0)
        success('browser-' + payload);
    else
        error('Missing argument');
}
module.exports = {
    check: check
};
require('cordova/exec/proxy').add('Integrity', module.exports);
