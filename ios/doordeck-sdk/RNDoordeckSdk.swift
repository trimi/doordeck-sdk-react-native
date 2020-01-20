import Foundation

@objc(RNDoordeckSdk)
class RNDoordeckSdk: NSObject {
  
  private var doordeck: Doordeck! = nil
  
  @objc func initDoordeck(_ auth: String, darkMode: Bool = true, closeButton: Bool = false) {
    let authToken = AuthTokenClass(auth)
    doordeck = Doordeck(authToken, darkMode, closeButton)
    doordeck.delegate = self
    doordeck.Initialize()
  }
  
  @objc func showUnlock() {
    if (doordeck != nil) {
      doordeck.showUnlockScreen(success: {
        print("success")
      }) {
        print("fail")
      }
    }
  }
  
}

extension RNDoordeckSdk: DoordeckProtocol {
  func authenticated() {
    
  }
  
  func verificationNeeded() {

  }

  func newAuthTokenRequired() -> AuthTokenClass {
      return AuthTokenClass("")
  }

  func unlockSuccessful() {

  }

}

