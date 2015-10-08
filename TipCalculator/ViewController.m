//
//  ViewController.m
//  TipCalculator
//
//  Created by Michael Chang on 9/30/15.
//  Copyright © 2015 Michael Chang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipRate;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipRate.selectedSegmentIndex = [defaults integerForKey:@"defaultTipIndex"];
    [self updateValues];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)onRateChange:(id)sender {
    [self updateValues];
}

- (IBAction)onAmountChange:(id)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billAmount.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmount = billAmount * [tipValues[self.tipRate.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
