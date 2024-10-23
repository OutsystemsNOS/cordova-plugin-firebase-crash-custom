#import "FirebaseCrashPlugin.h"

//@import Firebase;
@import FirebaseCrashlytics;
@import FirebaseCore;

@implementation FirebaseCrashPlugin

- (void)pluginInitialize {
    NSLog(@"Starting Firebase Crashlytics plugin");

    if(![FIRApp defaultApp]) {
        [FIRApp configure];
    }
}

- (void)log:(CDVInvokedUrlCommand *)command {
    NSString* errorMessage = [command.arguments objectAtIndex:0];

    [[FIRCrashlytics crashlytics] log:errorMessage];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setCustomKeys:(CDVInvokedUrlCommand *)command {
    NSString* keyname = [command.arguments objectAtIndex:0];
    NSString* keyvalue = [command.arguments objectAtIndex:1];

    @try{  
        NSDictionary *keysAndValues = @{keyname :keyvalue};
    
        [[FIRCrashlytics crashlytics] setCustomKeysAndValues: keysAndValues];
    
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }@catch (NSException* exception) {
        CDVPluginResult* pluginResultErr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception reason]];  
        [self.commandDelegate sendPluginResult:pluginResultErr callbackId:command.callbackId];
    }
}

- (void)logError:(CDVInvokedUrlCommand*)command {
    NSString *description = NSLocalizedString([command argumentAtIndex:0 withDefault:@"No Message Provided"], nil);
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: description };
    NSNumber *defaultCode = [NSNumber numberWithInt:-1];
    int code = [[command argumentAtIndex:1 withDefault:defaultCode] intValue];
    NSString *domain = [[NSBundle mainBundle] bundleIdentifier];
    NSError *error = [NSError errorWithDomain:domain code:code userInfo:userInfo];

    [[FIRCrashlytics crashlytics] recordError:error];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserId:(CDVInvokedUrlCommand *)command {
    NSString* userId = [command.arguments objectAtIndex:0];

    [[FIRCrashlytics crashlytics] setUserID:userId];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setEnabled:(CDVInvokedUrlCommand *)command {
    bool enabled = [[command.arguments objectAtIndex:0] boolValue];

    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:enabled];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)forceCrash:(CDVInvokedUrlCommand *)command {
    
    @[][1];
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



@end
