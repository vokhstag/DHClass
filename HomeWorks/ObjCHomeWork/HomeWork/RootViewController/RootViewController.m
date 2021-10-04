//
//  ViewController.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 03.10.2021.
//

#import "RootViewController.h"
#import "ListViewController.h"
#import "YAListPresenter.h"
#import "YAModel.h"

@interface RootViewController ()

@end

@implementation RootViewController

YAModel *model;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [[YAModel alloc] init];
    UIButton *bicyclesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *carsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bicyclesButton.tag = 1;
    carsButton.tag = 2;
    [bicyclesButton addTarget:self
               action:@selector(buttonTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [carsButton addTarget:self
               action:@selector(buttonTapped:)
     forControlEvents:UIControlEventTouchUpInside];

    [bicyclesButton setTitle:@"Bicycles" forState:UIControlStateNormal];
    [carsButton setTitle:@"Cars" forState:UIControlStateNormal];
    CGFloat midX = self.view.frame.size.width/2;
    CGFloat midY = self.view.frame.size.height/2;
    bicyclesButton.frame = CGRectMake(midX - 50, midY - 60, 100, 50);
    carsButton.frame = CGRectMake(midX - 50, midY + 10, 100, 50);
    bicyclesButton.backgroundColor = UIColor.blueColor;
    carsButton.backgroundColor = UIColor.blueColor;
    [self.view addSubview:bicyclesButton];
    [self.view addSubview:carsButton];
}

-(void)buttonTapped: (UIButton *)sender {
    ListViewController *nextVC = [[ListViewController alloc] init];
    YAListPresenter *presenter = [[YAListPresenter alloc] init];
    if (sender.tag == 1) {
        presenter.model = model.bicycles;
    } else {
        presenter.model = model.cars;
    }
    nextVC.presenter = presenter;
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
