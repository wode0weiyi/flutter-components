//
//  FlutterIosTextLabelPlugin.m
//  Runner
//
//  Created by 胡志辉 on 2020/7/29.
//

#import "FlutterIosTextLabelPlugin.h"
#import "FlutterIosTextLabelFactory.h"

@implementation FlutterIosTextLabelPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    [registrar registerViewFactory:[[FlutterIosTextLabelFactory alloc] initWithMessenger:registrar.messenger]  withId:@"com.flutter_to_native_test_textview"];
}
@end
