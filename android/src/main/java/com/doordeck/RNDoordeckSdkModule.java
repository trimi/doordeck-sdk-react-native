package com.doordeck;

import android.content.Context;
import android.nfc.NfcAdapter;
import android.nfc.NfcManager;

import com.doordeck.sdk.common.events.UnlockCallback;
import com.doordeck.sdk.common.manager.Doordeck;
import com.doordeck.sdk.common.manager.ScanType;
import com.facebook.react.bridge.ReactApplicationContext;
import com.doordeck.sdk.ui.verify.VerifyDeviceActivity;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNDoordeckSdkModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public RNDoordeckSdkModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNDoordeckSdk";
    }

    /**
     ** @param closeButton isn't used but the signature has to match with the Javascript bridge and the iOS SDK
     **/
    @ReactMethod
    public void initDoordeck(String authToken, boolean darkMode, boolean closeButton) {
        Doordeck.INSTANCE.initialize(getReactApplicationContext(), authToken, darkMode);
    }

    @ReactMethod
    public void updateToken(String authToken) {
        Doordeck.INSTANCE.updateToken(authToken, reactContext);
    }

    public boolean showUnlock(boolean isNfc, final UnlockCallback callback) {
            ScanType type = ScanType.QR;
            NfcManager manager = (NfcManager) getReactApplicationContext().getSystemService(Context.NFC_SERVICE);
            NfcAdapter adapter = manager.getDefaultAdapter();
            if (adapter != null && adapter.isEnabled()) {
                type = isNfc ? ScanType.NFC : ScanType.QR;
            }
            Doordeck.INSTANCE.showUnlock(getReactApplicationContext(), type, new UnlockCallback() {
                @Override
                public void unlockSuccess() {
                    callback.unlockSuccess(true); 
                }

                @Override
                public void unlockFailed() {
                    callback.unlockSuccess(false); 
                }

                @Override
                public void invalidAuthToken() {
                    callback.invalidAuthToken();
                }

                @Override
                public void notAuthenticated() {
                    callback.notAuthenticated();
                }

                @Override
                public void verificationNeeded() {
                    callback.verificationNeeded();
                }
            });
            return true; // Assuming always returns true here, adjust as per your logic
        }


    @ReactMethod
    public void logout() {
        Doordeck.INSTANCE.logout(getReactApplicationContext());
    }

}