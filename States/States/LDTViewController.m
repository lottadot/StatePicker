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

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [_states count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSDictionary *stateInfo = [_states objectAtIndex:row];
	return [stateInfo valueForKey:@"name"];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDictionary *stateInfo = [_states objectAtIndex:row];
	NSLog(@"selected state:%@", [stateInfo valueForKey:@"name"]);
}


@end
