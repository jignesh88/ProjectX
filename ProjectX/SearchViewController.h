//
//  SearchViewController.h
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface SearchViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
