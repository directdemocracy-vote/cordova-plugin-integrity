package vote.directdemocracy.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class Integrity extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
        String alias = data.getString(0);
        if (action.equals("greet")) {
          String message = "Hello " + alias;
          callbackContext.success(message);
          return true;
        } else if (action.equals("check")) {
          try {
            return check(alias, callbackContext);
          } catch (Exception e) {
            return false;
          }
        } else {
            return false;
        }
    }

    public boolean check(String alias, byte[] message, CallbackContext callbackContext) throws Exception {
      return true;
    }
}
