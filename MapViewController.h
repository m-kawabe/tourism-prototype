//
//  MapViewController.h
//  tourism_prototype
//
//  Created by 河辺 雅史 on 2014/07/30.
//  Copyright (c) 2014年 河辺 雅史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    CLLocationManager *lm;
}

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@end
