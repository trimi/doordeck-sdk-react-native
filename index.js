import { NativeModules } from "react-native";

const { RNDoordeckSdk } = NativeModules;

const logout = () => RNDoordeckSdk.logout();
const initDoordeck = (authToken, darkMode = true, closeButton = false) =>
  RNDoordeckSdk.initDoordeck(authToken, darkMode, closeButton);

const showUnlock = (isNfc, completion) => {
  RNDoordeckSdk.showUnlock(isNfc, (success) => {
    completion(success); 
  });
};

module.exports = {
  logout,
  initDoordeck,
  showUnlock,
};
