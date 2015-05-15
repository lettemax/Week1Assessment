//
//  ViewController.m
//  Week1Assessment
//
//  Created by Max Lettenberger on 5/15/15.
//  Copyright (c) 2015 Max. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *operand0;
@property (weak, nonatomic) IBOutlet UITextField *operand1;
@property NSInteger int0;
@property NSInteger int1;
@property (weak, nonatomic) IBOutlet UIButton *webButton;
@property NSInteger product;
@property NSString *rootAnswerString;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webButton.enabled = NO;

}

- (IBAction)onCalculatePressed:(UIButton *)sender {

    self.int0 = [self.operand0.text integerValue];
    self.int1 = [self.operand1.text integerValue];
    self.product = self.int0 * self.int1;
    self.rootAnswerString = [NSString stringWithFormat:@"%li", self.product];
    self.title = self.rootAnswerString;

    [self disableButton];
    [self.operand0 resignFirstResponder];
    [self.operand1 resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    WebViewController *webVC = segue.destinationViewController;
    webVC.answerInt = self.product;
    webVC.answerString = [NSString stringWithFormat:@"%li", webVC.answerInt];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.operand0 resignFirstResponder];
    [self.operand1 resignFirstResponder];
}

-(void)disableButton {
    //Disable  mybtn
    if (((self.product % 5) == 0) && self.product > 4) {
        self.webButton.enabled = YES;
    } else {
        self.webButton.enabled = NO;
    }
}

@end
