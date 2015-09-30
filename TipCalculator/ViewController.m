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
- (IBAction)onTap:(id)sender;
- (IBAction)onAmountChange:(id)sender;
- (void)updateValues;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
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
