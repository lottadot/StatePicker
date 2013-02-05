//
//  LDTViewController.m
//  States
//
//  Created by Shane Zatezalo on 2/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTViewController.h"

@interface LDTViewController ()
@property (strong, nonatomic) NSArray *states;

- (NSArray *)loadStatesWithError:(NSError *)error;
@end

@implementation LDTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSError *statesLoadError = nil;
    _states = [self loadStatesWithError:statesLoadError];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)loadStatesWithError:(NSError *)error
{
    NSString *statesDataFile = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"json"];
    NSData   *statesData = [NSData dataWithContentsOfFile:statesDataFile];
    
    id parsedJSON = [NSJSONSerialization JSONObjectWithData:statesData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    NSArray *states = [parsedJSON valueForKeyPath:@"states.state"];
    return states;
}

@end
