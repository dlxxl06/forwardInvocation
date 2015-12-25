//
//  ViewController.m
//  forwardInvocation
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"
#import "myProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableString *string = [[NSMutableString alloc]init];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:10];
    id proxy = [[myProxy alloc]initWithName:string obj2:array];
    
    [proxy appendString:@"this "];
    [proxy addObject:string];
    [proxy appendString:@"is "];
    [proxy appendString:@"a "];
    [proxy appendString:@"proxy"];
    
    NSLog(@"this should be 1 it is %li",[proxy count]);
    
    if ([[proxy objectAtIndex:0] isEqualToString:@"this is a proxy"]) {
        NSLog(@"appendString Successful");        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
