//
//  main.m
//  VisitorPattern
//
//  Created by hairong chen on 16/8/9.
//  Copyright © 2016年 hairong chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonEmployee.h"
#import "Manager.h"
#import "Visitor.h"
#import "ObjectStructure.h"
#import "RHCVistor.h"

NSArray *mackEmployerr() {
    NSMutableArray *empList = [NSMutableArray new];
    CommonEmployee *zhangSan = [CommonEmployee new];
    zhangSan.job = @"编写Java程序，绝对的蓝领、苦工加搬运工";
    zhangSan.name = @"张三";
    zhangSan.salary = 100000;
    zhangSan.sex = MALE;
    [empList addObject:zhangSan];
    
    CommonEmployee *liSi = [CommonEmployee new];
    liSi.job = @"页面美工，审美素质太不流行了!";
    liSi.name = @"李四";
    liSi.salary = 8000;
    liSi.sex = FEMALE;
    [empList addObject:liSi];
    
    Manager *rhc = [Manager new];
    rhc.performance = @"基本上是负值，但是我会拍马屁呀";
    rhc.name = @"陈海荣";
    rhc.salary = 18750;
    rhc.sex = MALE;
    [empList addObject:rhc];
    
    return empList;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1
        for (Employee *emp in mackEmployerr()) {
            [emp accept:[Visitor new]];
        }
        
        // 2
        for (int  i = 0; i < 10; i ++) {
            id<Element>el = [ObjectStructure createElement];
            [el accept: [RHCVistor new]];
        }
    }
    return 0;
}
