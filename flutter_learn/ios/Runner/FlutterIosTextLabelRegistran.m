//
//  FlutterIosTextLabelRegistran.m
//  Runner
//
//  Created by 胡志辉 on 2020/7/29.
//

#import "FlutterIosTextLabelRegistran.h"

@implementation FlutterIosTextLabelRegistran
+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry> *)registry{
    [FlutterIosTextLabelPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterIosTextLabelPlugin"]];
}
@end
