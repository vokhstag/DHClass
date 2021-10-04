//
//  YADetailViewController.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import "YADetailViewController.h"

@interface YADetailViewController ()

@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UILabel *nameLabel;
@property (weak, nonatomic) UILabel *descriptionLabel;

@end

@implementation YADetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupUI];
    
    self.nameLabel.text = self.presenter.name;
    self.descriptionLabel.text = self.presenter.descriptionText;
    self.imageView.image = [UIImage imageNamed:(@"noImage.jpg")];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void) setupUI {
    UIImageView *imageView = [[UIImageView alloc] init];
    UILabel *nameLabel = [[UILabel alloc] init];
    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.numberOfLines = 0;
    [self.view addSubview:imageView];
    [self.view addSubview:nameLabel];
    [self.view addSubview:descriptionLabel];
    
    
    self.imageView = imageView;
    self.nameLabel = nameLabel;
    self.descriptionLabel = descriptionLabel;
    
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [self.imageView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height/3].active = YES;
    
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:20].active = YES;
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:0].active = YES;
    
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:20].active = YES;
    [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:0].active = YES;
    [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:0].active = YES;
}


@end
