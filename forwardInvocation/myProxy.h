//
//  myProxy.h
//  forwardInvocation
//
//  Created by admin on 15/8/11.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myProxy : NSProxy
{
    id _realObj1;
    id _realObj2;
}
-(instancetype)initWithName:(id)obj1 obj2:(id)obj2;
@end
