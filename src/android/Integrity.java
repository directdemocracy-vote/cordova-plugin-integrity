package vote.directdemocracy.integrity;

import android.content.Context;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
import com.google.android.gms.tasks.Task;

import com.google.android.play.core.integrity.IntegrityManager;
import com.google.android.play.core.integrity.IntegrityManagerFactory;
import com.google.android.play.core.integrity.IntegrityTokenRequest;
import com.google.android.play.core.integrity.IntegrityTokenResponse;
import com.google.android.play.core.integrity.model.IntegrityErrorCode;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class Integrity extends CordovaPlugin {
  @Override public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
    if (action.equals("check")) {
      String nonce = data.getString(0);
      Context context = this.cordova.getActivity().getApplicationContext();
      if (GoogleApiAvailabilityLight.getInstance().isGooglePlayServicesAvailable(context) != ConnectionResult.SUCCESS) {
        callbackContext.error("Play Services not found");
        return true;
      }
      IntegrityManager integrityManager = IntegrityManagerFactory.create(context);
      Task<IntegrityTokenResponse> integrityTokenResponse = integrityManager.requestIntegrityToken(
        IntegrityTokenRequest.builder().setNonce(nonce).build());
      integrityTokenResponse.addOnSuccessListener(integrityTokenResponse1 -> {
        String integrityToken = integrityTokenResponse1.token();
        callbackContext.success(integrityToken);
      });
      integrityTokenResponse.addOnFailureListener(e -> {
        callbackContext.error("Integrity check failed: " + e.errorCode + " : " + e.getMessage());
      });
      return true;
    } else {
      callbackContext.error("Invalid method: " + action);
      return true;
    }
  }
}
