//
//  MLInputStream.m
//  AF-TEST
//
//  Created by 戴明亮 on 2019/1/28.
//  Copyright © 2019年 ML Day. All rights reserved.
//

#import "MLInputStream.h"


//@interface NSStream ()
//@property (readwrite) NSStreamStatus streamStatus;
//@property (readwrite, copy) NSError *streamError;
//@end


@interface MLInputStream ()
@property (readwrite) NSStreamStatus streamStatus;
@property (readwrite, copy) NSError *streamError;

@end


@implementation MLInputStream

@synthesize delegate;
@synthesize streamStatus;
@synthesize streamError;

- (void)open
{
    NSLog(@"%s",__FUNCTION__);
    // 状态发送改变后就会执行 red 方法
    self.streamStatus = NSStreamStatusOpen;
}


- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len
{
    NSLog(@"%s",__FUNCTION__);
    
    char *str = "李白";
    NSData *data = [NSData dataWithBytes:str length:len];
   
    NSRange range = NSMakeRange(0, strlen(str));
    
    [data getBytes:buffer range:range];
    
    NSLog(@"===>%s",buffer);
    NSLog(@"===>%ld",range.length);
    return range.length;
}
- (nullable id)propertyForKey:(NSStreamPropertyKey)key
{
    return nil;
}
- (BOOL)setProperty:(nullable id)property forKey:(NSStreamPropertyKey)key
{
    return YES;
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
    
}
- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
    
}

- (BOOL)hasBytesAvailable {
    return [self streamStatus] == NSStreamStatusOpen;
}

- (void)close
{
    
}

@end
