#import "Integrity.h"
#import <Cordova/CDVPlugin.h>

@implementation Integrity

- (void)check:(CDVInvokedUrlCommand*)command {
  NSString* alias = [command.arguments objectAtIndex:0];
  NSData* tag = [alias dataUsingEncoding:NSUTF8StringEncoding];
  CDVPluginResult* pluginResult = nil;
  if (alias == nil)
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error"];
  else
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success"”];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
