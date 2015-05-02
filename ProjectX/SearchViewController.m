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
    //1BC8c2
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


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSLog(@"Clicked Pizza Shop");
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Disclosure Pressed" message:@"Click Cancel to Go Back" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}


- (IBAction)zoomToCurrentLocation:(UIBarButtonItem *)sender {
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region;
    region.center.latitude = self.mapView.userLocation.coordinate.latitude;
    region.center.longitude = self.mapView.userLocation.coordinate.longitude;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    [self.mapView setRegion:region animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"Football.png"];
            pinView.calloutOffset = CGPointMake(0, 32);
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
