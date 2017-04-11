//
//  SubjectsService.m
//  iSchool
//
//  Created by Pavlo Ivanov on 4/9/17.
//  Copyright © 2017 Pavel Ivanov. All rights reserved.
//

#import "SubjectsService.h"

@interface SubjectsService ()

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation SubjectsService

- (void)getSubjectsOnSuccess:(void (^)(NSDictionary *))success {
    self.ref = [[FIRDatabase database] reference];
    [[self.ref child:@"subjects"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *response = snapshot.value;
        success(response);
    }];
}

@end
