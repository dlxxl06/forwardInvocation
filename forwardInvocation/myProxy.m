//
//  myProxy.m
//  forwardInvocation
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "myProxy.h"

@implementation myProxy
-(id)initWithName:(id)obj1 obj2:(id)obj2
{
    _realObj1 = [obj1 retain];
    _realObj2 =  [obj2 retain];
    return self;
}
-(void)dealloc
{
    [_realObj1 release];
    [_realObj2 release];
    [super dealloc];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *s1;
    s1 = [_realObj1 methodSignatureForSelector:sel];
    if (s1) {  return s1;}
    s1 = [_realObj2 methodSignatureForSelector:sel];
    return s1;
}
-(void)forwardInvocation:(NSInvocation *)invocation
{
    id target = [_realObj1 methodSignatureForSelector:[invocation selector]]?_realObj1:_realObj2;
    [invocation invokeWithTarget:target];
    
}
-(BOOL)respondsToSelector:(SEL)aSelector
{
    if ([_realObj1 respondsToSelector:aSelector])  return YES;
    else if([_realObj2 respondsToSelector:aSelector])return YES;
    return NO;

}

@end
