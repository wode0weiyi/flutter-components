//
//  FlutterIosTextLabelFactory.m
//  Runner
//
//  Created by 胡志辉 on 2020/7/29.
//

#import "FlutterIosTextLabelFactory.h"
#import "FlutterIosTextLabel.h"

@implementation FlutterIosTextLabelFactory
{
    NSObject<FlutterBinaryMessenger>*_messenger;
}
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}
//设置参数的编码方式
-(NSObject<FlutterMessageCodec>*)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}
//o用来创建ios原生view
- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    FlutterIosTextLabel *textlabel = [[FlutterIosTextLabel alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return textlabel;
}
@end
