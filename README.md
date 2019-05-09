# Doordeck React Native SDK 

## Prerequisites

CocaoPods

`$ sudo gem install cocoapods`

## Getting started

`$ npm install @doordeck/react-native-doordeck-sdk --save`

### Mostly automatic installation

Coming soon - for now see manual install for now

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `[your project's folder]` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-doordeck-sdk/ios` and add folder `doordeck-sdk`
3. In XCode, in the project navigator, select your project. Set your Swift Language Version to `Swift 5` in your project's `Build Settings` ➜ `Swift Language Version`
4. Add pod dependencies:
	Navigate in a terminal to your `[your react native project's folder]` ➜ `/ios`. 
	If there isn't a podfile you need to set it up by running 
	`$ pod init`. In Xcode, edit the podfile and add the following lines under # Pods for [your project's name]:
		
		platform: ios, "10.0"
		pod "QRCodeReader.swift", "~> 10.0"
		pod "ReachabilitySwift", "~> 4.3"
		pod "Alamofire", "~> 4.8"
		pod "Cache", "~> 5.2"
		pod "Sodium", "~> 0.8"

	In terminal run `$ pod install`
5. Add permissions:
	Add the following to your project plist.

		“Privacy - Camera Usage Description” -> “NSCameraUsageDescription”
		“Privacy - NFC Scan Usage Description” -> “NFCReaderUsageDescription”
		“Privacy - Location When In Use Usage Description” -> “NSLocationAlwaysAndWhenInUseUsageDescription”

	To use NFC, turn on in your project settings `Capablities` ➜ `Near Field Communication Tag Reading`
5. Run your project (`Cmd+R`)

#### Android

Coming soon


## Usage
```javascript
import doordeckSdk from 'react-native-doordeck-sdk';

// Initialise the SDK with your AuthToken
doordeckSdk.initDoordeck(authToken)

// Show unlock screen (NFC/QR reader)
doordeckSdk.showUnlock()
```
  