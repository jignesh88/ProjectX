//
//  TrainerProfileViewController.m
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import "TrainerProfileViewController.h"
#import "ReviewCell.h"
#import "Review.h"
NSMutableArray *reviews;
NSString *ReviewCellID = @"ReviewCellID";
@implementation TrainerProfileViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewCell* newCell = [tableView  dequeueReusableCellWithIdentifier:ReviewCellID forIndexPath:indexPath];
    
    newCell.imgReview.image = [UIImage imageNamed:@"rating_2.png"];
    newCell.imgTrainee.image = [UIImage imageNamed:@"avatar_2.png"];
    newCell.lblTitle.text = @"Amazing Trainer!!";
    newCell.lblReview.text = @"Great yoga teacher, I will be back next week for sure!!";
    return newCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

@end
