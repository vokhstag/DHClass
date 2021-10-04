//
//  YAListPresenter.h
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#ifndef YAListPresenter_h
#define YAListPresenter_h

#endif /* YAListPresenter_h */

#import <Foundation/Foundation.h>

@interface YAListPresenter: NSObject

@property (strong, nonatomic) NSDictionary<NSString *, NSString *> *model;

-(NSInteger) numberOfElements;
-(NSString *) elementName:(NSInteger) index;

@end
