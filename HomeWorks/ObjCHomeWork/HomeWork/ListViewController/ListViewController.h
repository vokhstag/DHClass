//
//  ListViewController.h
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import <UIKit/UIKit.h>
#import "YAListPresenter.h"


NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController

@property (strong, nonatomic) YAListPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
