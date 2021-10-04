//
//  YAListPresenter.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "YAListPresenter.h"

@implementation YAListPresenter

- (id)init {
    __weak typeof(self) weakSelf = [super init];
    if (self) {
        self.numberOfElements = ^{
            return weakSelf.model.allKeys.count;
        };
    }

    return self;
}

-(NSString *) elementName:(NSInteger) index {
    return _model.allKeys[index];
}

@end
