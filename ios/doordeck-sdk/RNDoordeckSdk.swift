//
//  sdkManager.swift
//  doordeckSDKReactNative
//
//  Created by Doordeck on 15/04/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

@objc(RNDoordeckSdk)
class RNDoordeckSdk: NSObject {
  
  private var doordeck: Doordeck! = nil
  
  @objc func initDoordeck(_ auth: String) {
    let authToken = AuthTokenClass(auth)
    doordeck = Doordeck(authToken)
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
  func verificationNeeded() {

  }

  func newAuthTokenRequired() -> AuthTokenClass {
      return AuthTokenClass("")
  }

  func unlockSuccessful() {

  }

}

