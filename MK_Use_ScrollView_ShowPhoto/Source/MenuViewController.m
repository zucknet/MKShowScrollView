//
//  MenuViewController.m
//  MK_Use_ScrollView_ShowPhoto
//
//  Created by zucknet on 13/3/20.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "MenuViewController.h"
#import "ShowViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize list;
@synthesize toolbar;
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    toolbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f)];
    toolbar.delegate = self;
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    [self.view addSubview:toolbar];
    
    UINavigationItem *item = [[UINavigationItem alloc]init];
    
    item.title = @"上海";
    
    [toolbar pushNavigationItem:item animated:NO];
        
    list = [[NSArray alloc]initWithObjects:@"第一张",@"第二张",@"第三张",@"第四张",@"第五张",@"第六张",@"第七章", nil];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height - 44.0f)];
    tableView.delegate=self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor colorWithRed:42.0/255.0 green:42.0/255.0 blue:42.0/255.0 alpha:1.0];
    [self.view addSubview:tableView];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MenuCell *cell = (MenuCell *)[_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.lab.text = [list objectAtIndex:indexPath.section];
    
    switch (indexPath.section) {
        case 0:
            cell.imageCell.image = [UIImage imageNamed:@"1.jpg"];
            break;
        case 1:
            cell.imageCell.image = [UIImage imageNamed:@"2.jpg"];
            break;
        case 2:
            cell.imageCell.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 3:
            cell.imageCell.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 4:
            cell.imageCell.image = [UIImage imageNamed:@"5.jpg"];
            break;
        case 5:
            cell.imageCell.image = [UIImage imageNamed:@"6.jpg"];
            break;
        case 6:
            cell.imageCell.image = [UIImage imageNamed:@"7.jpg"];
            break;
        default:
            break;
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowViewController *showVc = [[ShowViewController alloc]init];
    
    showVc.navigationController.navigationBarHidden = YES;
    
    [self.navigationController pushViewController:showVc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
