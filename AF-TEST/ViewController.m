//
//  ViewController.m
//  AF-TEST
//
//  Created by 戴明亮 on 2019/1/28.
//  Copyright © 2019年 ML Day. All rights reserved.
//

#import "ViewController.h"
#import "MLInputStream.h"


@interface ViewController ()
@property (nonatomic, strong) NSInputStream *inputStream;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test01];
    [self test02];
    
}



- (void)test01
{
    NSString *str = @"abcd";;
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    
    self.inputStream  = [NSInputStream inputStreamWithData:data];
    
    [self.inputStream open];
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    uint8_t * buffer[1024]={0};
    [self.inputStream read:(uint8_t *)buffer maxLength:sizeof(buffer)];
    
    printf("====>%s\n",(char *)buffer);
    
}


- (void)test02
{
 
    MLInputStream *stream = [[MLInputStream alloc] init];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.bai.com"]];
    
    [request setHTTPBodyStream:stream];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    [task resume];
    
}


@end
