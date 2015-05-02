//
//  FilterViewController.m
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterViewCell.h"

NSMutableArray *data;
NSString *CellID = @"CellID";

@implementation FilterViewController {

}

- (void)viewDidLoad{
    
    data = [[NSMutableArray alloc]initWithCapacity:10];
    [data addObject:[[NSString alloc]initWithFormat:@"Soccer"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Basketball"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Golf"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Gym"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Yoga"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Pingpong"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Cycling"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Rugbyball"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Runner"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Mountainbiking"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Pingpong"]];
    [data addObject:[[NSString alloc]initWithFormat:@"Weightlift"]];
    self.filterCollection.allowsMultipleSelection = true;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterViewCell *cell = (FilterViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    
    if(cell.isSelected== NO) {
        cell.backgroundColor = [UIColor redColor];
        cell.isSelected = YES;
    }
    else {
        cell.backgroundColor = [UIColor redColor];
        cell.isSelected = NO;
    }
}


-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //FilterViewCell *cell = (FilterViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    //cell.backgroundColor = [UIColor whiteColor];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return data.count;
}

- (FilterViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterViewCell* newCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID
                                                                           forIndexPath:indexPath];
    
    NSString *sportName = [data objectAtIndex:indexPath.item];
    NSString *sportImg = [[NSString alloc]initWithFormat:@"%@.png",sportName];
    newCell.FilterImage.image = [UIImage imageNamed:[[NSString alloc]initWithFormat:@"%@.png",sportName]];
    newCell.FilterLabel.text = sportName;
    return newCell;
    
    
}

@end
