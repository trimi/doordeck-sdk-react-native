import Foundation

@objc(RNDoordeckSdk)
class RNDoordeckSdk: NSObject {
  
  private var doordeck: Doordeck! = nil
  
  @objc func initDoordeck(_ auth: String, darkMode: Bool = true, closeButton: Bool = false) {
    let authToken = AuthTokenClass(auth)
    doordeck = Doordeck(authToken, darkMode: darkMode, closeButton: closeButton)
    doordeck.delegate = self
    doordeck.Initialize()
  }
  
  @objc func showUnlock(_ isNfc: Bool, completion: @escaping (Bool) -> Void) {
      DispatchQueue.main.async {
          if let doordeck = self.doordeck {
              doordeck.showUnlockScreen(isNfc ? .nfc : .qr, success: {
                  print("success")
                  completion(true) 
              }) {
                  print("fail")
                  completion(false)
              }
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

