//
//  YAListPresenter.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "YAListPresenter.h"

@implementation YAListPresenter

-(NSInteger) numberOfElements {
    return _model.allKeys.count;
}

-(NSString *) elementName:(NSInteger) index {
    return _model.allKeys[index];
}

@end
