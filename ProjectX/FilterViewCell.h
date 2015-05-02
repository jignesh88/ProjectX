//
//  FilterViewCell.h
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewCell : UICollectionViewCell {

}
@property (weak, nonatomic) IBOutlet UIImageView *FilterImage;
@property (weak, nonatomic) IBOutlet UILabel *FilterLabel;
@property (nonatomic, assign) BOOL isSelected;
@end
