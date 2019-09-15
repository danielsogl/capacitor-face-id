import Foundation
import Capacitor
import LocalAuthentication

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(FaceId)
public class FaceId: CAPPlugin {
    let authContext = LAContext()
    
    @objc func isAvailable(_ call: CAPPluginCall) {
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch(authContext.biometryType) {
            case .none:
                call.success([
                    "value": false
                ])
            case .touchID:
                call.success([
                    "value": true
                ])
            case .faceID:
                call.success([
                    "value": true
                ])
            }
        } else {
            call.success([
                "value": false
            ])
        }
    }
    
    @objc func auth(_ call: CAPPluginCall) {
        let reason = call.getString("reason") ?? "Access requires authentication"
        authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ) { success, error in
            if success {
                DispatchQueue.main.async {
                    call.success()
                }
            } else {
                call.error(error?.localizedDescription ?? "Failed to authenticate")
            }
        }
    }
    
    
}
