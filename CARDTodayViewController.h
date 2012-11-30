//
//  CARDTodayViewController.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/29/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CARDTodayViewController : UIViewController

@property (nonatomic, copy) NSMutableArray *dayEventList;

- (void)fetchCalendarTodayEvents;

@end
