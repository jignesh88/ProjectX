//
//  FilterViewController.h
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCollection.h"

@interface FilterViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollection;

@end
