//
//  FlutterIosTextLabelFactory.h
//  Runner
//
//  Created by 胡志辉 on 2020/7/29.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterIosTextLabelFactory : NSObject<FlutterPlatformViewFactory>
-(instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
