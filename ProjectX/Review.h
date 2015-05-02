//
//  Review.h
//  ProjectX
//
//  Created by Jignesh Patel on 3/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *reviewDescription;
@property (nonatomic, strong) NSNumber *rating;
@end
