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
RCT_EXTERN_METHOD(initDoordeck:(NSString *)auth)
RCT_EXTERN_METHOD(showUnlock)
@end


