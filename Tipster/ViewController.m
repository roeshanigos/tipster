//
//  ViewController.m
//  Tipster
//
//  Created by Roesha Nigos on 6/26/18.
//  Copyright © 2018 Roesha Nigos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tipTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *totalUpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIView animateWithDuration:0.000002 animations:^{
        self.totalUpView.alpha=0;
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    
    double tip = tipPercentage *bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];;

}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
    self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y,
        self.mealBillField.frame.size.width,
        self.mealBillField.frame.size.height);
        
        
    }];
  
    
    [UIView animateWithDuration:1 animations:^{
        self.totalUpView.alpha=1;
        self.totalUpView.frame.origin.y-50;
    }];

    

    
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    
    
    [UIView animateWithDuration:0.000002 animations:^{
        self.mealBillField.frame = newFrame;
        
    }];
    
    
    if (_mealBillField.text && _mealBillField.text.length > 0)
    {
        [UIView animateWithDuration:0.000002 animations:^{
            self.totalUpView.alpha=1;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.000002 animations:^{
            self.totalUpView.alpha=0;
        }];
    }

    
    
}




@end
