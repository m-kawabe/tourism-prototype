//
//  CourseViewController.m
//  tourism_prototype
//
//  Created by 河辺 雅史 on 2014/07/30.
//  Copyright (c) 2014年 河辺 雅史. All rights reserved.
//

#import "CourseViewController.h"
#import "OHAttributedLabel.h"
#import "NSAttributedString+Attributes.h"

@interface CourseViewController ()

@end

@implementation CourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
}

//Sectionの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//Cellの数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }else{
        return 1;
    }
}

//Cellの高さ
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


//各Cellの設定
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
        //cell.textLabel.font = [UIFont boldSystemFontOfSize:13.0];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.numberOfLines = 0;
    }
    
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            cell.textLabel.text = @"このコースを歩く";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"時間:40分";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"距離:約3.4km";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else if(indexPath.row == 3){
            cell.textLabel.text = @"歩数:4770歩";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }else if(indexPath.section == 1){
        if(indexPath.row == 0){
            cell.textLabel.text = @"健康ウォーキングマッップを見る";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    return cell;
}

- (IBAction)rightButton:(id)sender {
    self.myImageView.image = [UIImage imageNamed:@"yanagawa_park"];
}

- (IBAction)leftButton:(id)sender {
    self.myImageView.image = [UIImage imageNamed:@"goryokaku_park"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            [self performSegueWithIdentifier:@"course_map" sender:self];
        }
    }else if(indexPath.section == 1){
        if(indexPath.row == 0){
            [self performSegueWithIdentifier:@"web" sender:self];
        }
    }
}

//footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if(section == 1){
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 44.0)];
        
        // リンクを付加するOHAttributedLabel
        OHAttributedLabel *footerLabel = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        footerLabel.backgroundColor = [UIColor clearColor];
        NSString * text =@"powered by 健康ウォーキングマップ";
        NSMutableAttributedString *attrStr = [NSMutableAttributedString attributedStringWithString:text];
        
        NSRange linkRange = [text rangeOfString:@"健康ウォーキングマップ"];
        NSURL *linkUrl = [NSURL URLWithString:@"http://www.city.hakodate.hokkaido.jp/docs/2014012700900/"];
        [attrStr setLink:linkUrl range:linkRange];
        
        footerLabel.attributedText = attrStr;
        
        // リンクをつけた文字列の色を変更
        [footerLabel setLinkColor:[UIColor blueColor]];
        // リンクをつけた文字列にアンダーラインを付けないようにする
        footerLabel.underlineLinks = NO;
        
        footerLabel.textColor = [UIColor blackColor];
        footerLabel.highlightedTextColor = [UIColor whiteColor];
        
        
        //this is what you asked
        footerLabel.font = [UIFont systemFontOfSize:11];
        
        footerLabel.shadowColor = [UIColor clearColor];
        footerLabel.shadowOffset = CGSizeMake(0.0, 1.0);
        footerLabel.numberOfLines = 0;
        footerLabel.textAlignment = NSTextAlignmentRight;
        [footerView addSubview: footerLabel];
        
        // Return the headerView
        return footerView;
    }else{
        return nil;
    }
}

//footerViewの高さ
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 70;
}

//戻るボタンのアクション
- (IBAction)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
