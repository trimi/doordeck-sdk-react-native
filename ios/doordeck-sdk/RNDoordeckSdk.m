#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif


@interface RCT_EXTERN_MODULE(RNDoordeckSdk, NSObject)
+ (BOOL)requiresMainQueueSetup
{
    return YES;
}
RCT_EXTERN_METHOD(initDoordeck:(NSString *)auth darkMode:(BOOL)darkMode closeButton:(BOOL)closeButton)
RCT_EXTERN_METHOD(showUnlock:(BOOL)isNfc)
@end
