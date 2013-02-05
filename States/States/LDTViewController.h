//
//  LDTViewController.h
//  States
//
//  Created by Shane Zatezalo on 2/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDTViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *statePickerView;

@end
