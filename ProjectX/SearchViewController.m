//
//  SearchViewController.m
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import "SearchViewController.h"
#import "CoachAnnotation.h"

@implementation SearchViewController

-(void)viewdidload{
    [super viewDidLoad];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = true;
}

-(void)viewDidAppear:(BOOL)animated {
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.03f, 0.03f);
    CLLocationCoordinate2D coordinate = {-33.8791406,151.1976682};
    MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    NSMutableArray *locations = [[NSMutableArray alloc]initWithCapacity:20];
    
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = -33.8791406;
    annotationCoord.longitude = 151.1976682;
        
        
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;

    annotationPoint.title = [[NSString alloc]initWithFormat:@" Trainer %d", 1];
    annotationPoint.subtitle = [self getTrainerExpertise:1];
    
    [locations addObject:annotationPoint];
    
    [_mapView addAnnotation: annotationPoint];
    
    [self.mapView setRegion:regionThatFits animated:YES];
}

- (NSString*) getTrainerExpertise : (int) step{
    NSString *val = [[NSString alloc]init];
    switch(step) {
        case 1:
            val = @"Basket ball coach";
            break;
        case 2:
            val = @"Golf Coach";
            break;
        case 3:
            val = @"Yoga Coach";
            break;
        case 4:
            val = @"Pingpong Coach";
            break;
        case 5:
            val = @"Rugby Coach";
            break;
        case 6:
            val = @"Swimming Coach";
            break;
        default:
            val = @"Football Trainer";
            break;
    }
    return val;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
}

- (void)mapView:(MKMapView *)myMapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"Center: %f %f", myMapView.region.center.latitude,myMapView.region.center.longitude);
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [self performSegueWithIdentifier: @"showTrainer" sender: self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
