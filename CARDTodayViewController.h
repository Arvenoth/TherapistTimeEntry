//
//  CARDTodayViewController.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 12/3/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CARDTodayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameCityLabel;

@property (weak, nonatomic) IBOutlet UILabel *patientNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientZipLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientStartTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientEndTimeLabel;

@end
