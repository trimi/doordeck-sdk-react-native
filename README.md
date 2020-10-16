# Doordeck React Native SDK 

## Prerequisites

CocaoPods

`$ sudo gem install cocoapods`

## Getting started

1. Install via npm

	`$ npm install @doordeck/react-native-doordeck-sdk --save`

2. Link react-native files

	`$ react-native link @doordeck/react-native-doordeck-sdk`

### Mostly automatic installation

Coming soon - see manual install for now

### Manual installation

### If you were using a version before `1.2.0`
- For iOS, we were using some instructions such as adding some content into your Podfile:

		platform :ios, "10.0"
		pod "QRCodeReader.swift", "~> 10.0"
		pod "ReachabilitySwift", "~> 5.0.0"
		pod "Alamofire", "~> 4.8"
		pod "Cache", "~> 5.2"
		pod "Sodium", "~> 0.8"

  please remove these lines now and follow the next iOS instructions.
 
 - Please check if your React Native's project `ios/Podfile` has any reference to the doordeck (pod, path...) and remove it. For example:
 
		 target 'YourProject' do
		  config = use_native_modules!
		
		  use_react_native!(:path => config["reactNativePath"])

		  pod 'doordeck-sdk-swift', :path => '../node_modules/@doordeck/react-native-doordeck-sdk' ## remove this line
		  ...

		  # Enables Flipper.

#### iOS
1. In XCode, in the project navigator, select your project. Set your Swift Language Version to `Swift 5` in your project's `Build Settings` ➜ `Swift Language Version`.
2. Use the minimum iOS version as '10.3'. Add in your Podfile: `platform :ios, "10.3"`. Then run `pod install`
3. Add permissions:
	 Add the following to your project plist.

		“Privacy - Camera Usage Description” -> “NSCameraUsageDescription”
		“Privacy - NFC Scan Usage Description” -> “NFCReaderUsageDescription”
		“Privacy - Location When In Use Usage Description” -> “NSLocationAlwaysAndWhenInUseUsageDescription”

	To use NFC, turn it on in your project target settings `Capablities` ➜ `Near Field Communication Tag Reading`
4. To run your project, open the `.xcworkspace` file (not the .xcodeproj file) in your `/ios` folder and press run (`Cmd+R`).

#### Android

1. Edit your app `gradle` file: 

		minSdkVersion 21
		android {
			packagingOptions {
				pickFirst("META-INF/atomicfu.kotlin_module")
			}
		}
		repositories {
			maven { url "https://jitpack.io" }
		}

2. Add following to your `gradle.properties`

		android.useAndroidX=true
		android.enableJetifier=true

3.	If you're targeting minSdkVersion lower than 21, add following to your AndroidManifest.xml (inside the <manifest> tag):

		<uses-sdk tools:overrideLibrary="com.google.zxing.client.android" />

4.  To run your app, type `$ react-native run-android`




## Usage
```javascript
import doordeckSdk from '@doordeck/react-native-doordeck-sdk';

// Initialise the SDK with your AuthToken and optional parameters

/**
 * Enables dark mode for iOS
 * Default is true
 */
const darkMode = true

/**
 * Adds a close button to the NFC view.
 * Default is false
 */
const closeButton = false

doordeckSdk.initDoordeck(authToken, darkMode, closeButton)

// Show unlock screen (NFC/QR reader)
doordeckSdk.showUnlock()
```
  
