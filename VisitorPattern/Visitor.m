//
//  Visitor.m
//  VisitorPattern
//
//  Created by hairong chen on 16/8/9.
//  Copyright © 2016年 hairong chen. All rights reserved.
//

#import "Visitor.h"
#import "Manager.h"
#import "CommonEmployee.h"

@implementation Visitor

- (void)visit:(Employee *)employee {
    // 访问普通员工，打印出报表
    if ([employee isMemberOfClass:[CommonEmployee class]]) {
         NSLog(@"%@",[self commonEmployee:(CommonEmployee *)employee]);
        // 访问部门经理，打印出报表
    } else if ([employee isMemberOfClass:[Manager class]]) {
           NSLog(@"%@",[self managerInfo:(Manager *)employee]);
    }
}

// 组装出基本信息
- (NSString *)basicInfo:(Employee *)employee {
    NSString *info = [NSString stringWithFormat:@"姓名:%@\t性别:%@\t薪水:%ld\t",employee.name, (employee.sex == FEMALE ?@"女":@"男"),employee.salary];
    return info;
}

// 组装出部门经理的信息
- (NSString *)managerInfo:(Manager *)manager {
    NSString *basicInfo = [self basicInfo:manager];
    NSString *otherInfo = [NSString stringWithFormat:@"业绩:%@\t",manager.performance];
    
    NSString *result = [NSString stringWithFormat:@"%@%@",basicInfo,otherInfo];
    
    return result;
}

// 组装出普通员工信息
- (NSString *)commonEmployee:(CommonEmployee *)commonEmployee {
    NSString *basicInfo = [self basicInfo:commonEmployee];
    NSString *otherInfo = [NSString stringWithFormat:@"工作:%@\t",commonEmployee.job];
    
    NSString *result = [NSString stringWithFormat:@"%@%@",basicInfo,otherInfo];
    
    return result;
}

@end
