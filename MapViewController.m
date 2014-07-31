//
//  MapViewController.m
//  tourism_prototype
//
//  Created by 河辺 雅史 on 2014/07/30.
//  Copyright (c) 2014年 河辺 雅史. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    
    self.myMapView.delegate = self;
    
    //Map
    lm = [[CLLocationManager alloc]init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    self.myMapView.showsUserLocation = YES;
    
    MKCoordinateRegion region = self.myMapView.region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude = newLocation.coordinate.longitude;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    [self.myMapView setRegion:region animated:YES];
    
    //Pin
    MKPointAnnotation *goryokaku_pin = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D goryokaku_point;
    goryokaku_point.latitude = 41.792093;
    goryokaku_point.longitude = 140.754775;
    [goryokaku_pin setCoordinate:goryokaku_point];
    goryokaku_pin.title = @"五稜郭・梁川コース";
    [self.myMapView addAnnotation:goryokaku_pin];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if(annotation == self.myMapView.userLocation){
        return nil;
    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.myMapView dequeueReusableAnnotationViewWithIdentifier:@"my_annotation"];
    
    if(annotationView == nil){
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"my_annotation"];
    }else{
        annotationView.annotation = annotation;
    }
    
    annotationView.animatesDrop = YES;
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

- (void) mapView:(MKMapView*)myMapView annotationView:(MKAnnotationView*)annotationView calloutAccessoryControlTapped:(UIControl*)control {
    [self performSegueWithIdentifier:@"course" sender:self];
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
