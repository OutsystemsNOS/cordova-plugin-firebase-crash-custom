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
    NSString* keyname1 = [command.arguments objectAtIndex:0];
    NSString* keyvalue1 = [command.arguments objectAtIndex:1];
    NSString* keyname2 = [command.arguments objectAtIndex:2];
    NSString* keyvalue2 = [command.arguments objectAtIndex:3];
    NSString* keyname3 = [command.arguments objectAtIndex:4];
    NSString* keyvalue3 = [command.arguments objectAtIndex:5];
    NSString* keyname4 = [command.arguments objectAtIndex:6];
    NSString* keyvalue4 = [command.arguments objectAtIndex:7];

    @try{  
        NSMutableDictionary *keysAndValues = [NSMutableDictionary dictionary];
        
        if (![keyname1 isEqualToString:@""] && ![keyvalue1 isEqualToString:@""]) {
            [keysAndValues setObject:keyvalue1 forKey:keyname1];
        }
        if (![keyname2 isEqualToString:@""] && ![keyvalue2 isEqualToString:@""]) {
            [keysAndValues setObject:keyvalue2 forKey:keyname2];
        }
        if (![keyname3 isEqualToString:@""] && ![keyvalue3 isEqualToString:@""]) {
            [keysAndValues setObject:keyvalue3 forKey:keyname3];
        }
        if (![keyname4 isEqualToString:@""] && ![keyvalue4 isEqualToString:@""]) {
            [keysAndValues setObject:keyvalue4 forKey:keyname4];
        }
    
        if ([keysAndValues count] > 0) {
            [[FIRCrashlytics crashlytics] setCustomKeysAndValues:keysAndValues];
        }
    
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
