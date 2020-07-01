import Foundation
import Capacitor
import LocalAuthentication

let kNoneType = "None"
let kTouchIDType = "Touch ID"
let kFaceIDType = "Face ID"

let errorCodeMap: [LAError.Code: String] = [
  .appCancel: "appCancel",
  .authenticationFailed: "authenticationFailed",
  .invalidContext: "invalidContext",
  .notInteractive: "notInteractive",
  .passcodeNotSet: "passcodeNotSet",
  .systemCancel: "systemCancel",
  .userCancel: "userCancel",
  .userFallback: "userFallback",
  .biometryLockout: "biometryLockout",
  .biometryNotAvailable: "biometryNotAvailable",
  .biometryNotEnrolled: "biometryNotEnrolled"
]

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(FaceId)
public class FaceId: CAPPlugin {
  
  @objc func isAvailable(_ call: CAPPluginCall) {
    var authType = kNoneType

    if #available(iOS 11, *) {
      let authContext = LAContext()
      
      let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
      
      switch (authContext.biometryType) {
      case .touchID:
        authType = kTouchIDType
        
      case .faceID:
        authType = kFaceIDType
        
      default:
        break
      }
    }
    
    call.success([
      "value": authType
    ])
  }
  
  @objc func auth(_ call: CAPPluginCall) {
    let authContext = LAContext()
    
    authContext.localizedFallbackTitle = call.getString("fallbackTitle")
    authContext.touchIDAuthenticationAllowableReuseDuration = call.getDouble("touchIDReuseDuration") ?? 60
    authContext.localizedCancelTitle = call.getString("cancelTitle")
    let reason = call.getString("reason") ?? "Access requires authentication"
    
    authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ) {
      success, error in
      if success {
        DispatchQueue.main.async {
          call.resolve()
        }
      } else {
        let policyError = error as! LAError
        let code = errorCodeMap[policyError.code]
        call.reject(policyError.localizedDescription, code)
      }
    }
  }
}
