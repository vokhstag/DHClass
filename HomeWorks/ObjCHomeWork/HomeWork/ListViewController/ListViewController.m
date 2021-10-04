//
//  ListViewController.m
//  HomeWork
//
//  Created by Yunus Abubakarov on 04.10.2021.
//

#import "ListViewController.h"
#import "YAListPresenter.h"
#import "YADetailViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;



@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter numberOfElements];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndentifier = @"cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndentifier];
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text = [self.presenter elementName:(indexPath.row)];
    
    return cell;
}

#pragma mark - UITableViewDelegata
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YADetailViewController *nextVC = [[YADetailViewController alloc] init];
    YADetailPresenter *nextVCPresenter = [[YADetailPresenter alloc] init];
    NSString *name = [self.presenter elementName:(indexPath.row)];
    nextVCPresenter.name = name;
    NSString *description = self.presenter.model[name];
    nextVCPresenter.descriptionText = description;
    nextVC.presenter = nextVCPresenter;
    [self.navigationController pushViewController:nextVC animated:YES];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
