//
//  FlutterIosTextLabel.m
//  Runner
//
//  Created by 胡志辉 on 2020/7/29.
//

#import "FlutterIosTextLabel.h"


@implementation FlutterIosTextLabel
{
    int64_t _viewId;
    UILabel * _uilabel;
    UIImageView *_imageView;
//    消息回调
    FlutterMethodChannel * _channel;
}
- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width == 0) {
            frame = CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 22);
        }
        _uilabel = [[UILabel alloc] initWithFrame:frame];
        _uilabel.textColor = [UIColor redColor];
        _uilabel.text = @"我是ios原生";
        NSDictionary *dic = args;
        if ([[dic allKeys] containsObject:@"content"]) {
            _uilabel.text = args[@"content"];
        }
        _uilabel.font = [UIFont systemFontOfSize:14];
        _uilabel.textAlignment=NSTextAlignmentCenter;
        _uilabel.backgroundColor = [UIColor grayColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"demo_image"];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = true;
//        [view addSubview:_imageView];
//        [view addSubview:_uilabel];
        _viewId = viewId;
    }
    return self;
}
- (nonnull UIView *)view{
    return _uilabel;
}
@end
